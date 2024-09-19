import pandas as pd
import matplotlib.pyplot as plt
from math import sqrt
from sklearn.metrics import mean_squared_error as MSE
from sklearn.metrics import r2_score
from sklearn.metrics import mean_absolute_error
from xgboost import XGBRegressor
from sklearn.model_selection import train_test_split, GridSearchCV, KFold
import pymysql
import io

# MariaDB에 연결 및 CSV 파일 데이터 읽기
db_config = {
    'host': 'localhost',
    'port': 3306,
    'user': 'root',
    'password': '1234',
    'database': 'project'
}

# 데이터베이스 연결 및 BLOB 데이터 읽기
connection = pymysql.connect(**db_config)

try:
    with connection.cursor() as cursor:
        # 가장 최근 request_number 찾기
        sql = 'SELECT MAX(request_number) FROM analysis_request'
        cursor.execute(sql)
        result = cursor.fetchone()
        latest_request_number = result[0]

        if latest_request_number is None:
            raise ValueError("No data found in the analysis_request table.")

        # 가장 최근 request_number의 BLOB 데이터 읽기
        sql = 'SELECT request_file FROM analysis_request WHERE request_number = %s'
        cursor.execute(sql, (latest_request_number,))
        result = cursor.fetchone()
        
        if result:
            blob_data = result[0]
            # BLOB 데이터를 파일처럼 읽기 위해 BytesIO 사용
            blob_stream = io.BytesIO(blob_data)
            df4 = pd.read_csv(blob_stream)
        else:
            raise ValueError(f"No BLOB data found for request_number {latest_request_number}.")
finally:
    # 연결 종료
    connection.close()

# 독립변수 및 종속변수 정의
Xcols = ['단위중량(kg)', '투입중량(kg)', '투입액량(L)', '염색길이(m)', '공정진행시간(%)',
         '목표온도', '진행온도', '목표대비 진행온도', '지시대비 진행온도', '포속1', '포속3', '포속4']
ycol = ['염색색차 DE']

X = df4[Xcols]
y = df4[ycol]

# 데이터 분리
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=123)

# 하이퍼파라미터 정의 및 모델 학습
parameters = {"n_estimators": [20, 50],
              "learning_rate": [0.1, 0.15],
              "max_depth": [2, 4],
              "objective": ['reg:squarederror']}
kfold = KFold(n_splits=5, shuffle=True, random_state=42)

model_xgb = GridSearchCV(XGBRegressor(random_state=42), parameters, cv=kfold, verbose=2, n_jobs=-1)
model_xgb.fit(X_train, y_train)

# 모델 최적화 및 예측
best_model_xgb = model_xgb.best_estimator_
y_pred_xgb = best_model_xgb.predict(X_test)

# 모델 성능 계산
r2 = r2_score(y_test, y_pred_xgb)
adj_r2 = 1 - (1 - r2) * (len(y_test) - 1) / (len(y_test) - X_test.shape[1] - 1)
rmse = sqrt(MSE(y_test, y_pred_xgb))
mae = mean_absolute_error(y_test, y_pred_xgb)

# 결과 인쇄
print(f"Adjusted R2_score : {round(adj_r2, 3)}")
print(f"RMSE score : {round(rmse, 3)}")
print(f"MAE score : {round(mae, 3)}")

# 그래프 저장
plt.figure(figsize=(10, 6))
plt.title('Prediction vs Actual (XGBoost)')
plt.xlabel('Prediction')
plt.ylabel('Actual')
plt.grid()
plt.scatter(y_pred_xgb, y_test, alpha=0.5)
plt.plot([y_test.min(), y_test.max()], [y_test.min(), y_test.max()], 'r--', lw=2)
plt.tight_layout()

# Save plot to a BytesIO object
buffer = io.BytesIO()
plt.savefig(buffer, format='jpeg')
buffer.seek(0)
image_data = buffer.getvalue()
plt.close()

# MariaDB에 연결 및 데이터 업데이트
connection = pymysql.connect(**db_config)

try:
    with connection.cursor() as cursor:
        # SQL 쿼리 준비
        sql = '''UPDATE analysis_request
                 SET actual_prediction = %s, RMSE = %s, MAE = %s, Evaluation_indicators = %s
                 WHERE request_number = %s'''
        data = (image_data, rmse, mae, adj_r2, latest_request_number)
        
        # 데이터 업데이트
        cursor.execute(sql, data)
        
        # 변경 사항 커밋
        connection.commit()

finally:
    # 연결 종료
    connection.close()
