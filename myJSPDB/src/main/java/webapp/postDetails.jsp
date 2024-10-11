<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>  
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>게시글 상세보기</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="Announcement_style.css">
</head>
<script>
    function toggleImage(imageContainerId, toggleTextId) {
        const imgContainer = document.getElementById(imageContainerId);
        const toggleText = document.getElementById(toggleTextId);
        
        if (imgContainer.style.display === 'none' || imgContainer.style.display === '') {
            imgContainer.style.display = 'block'; // 이미지 표시
            toggleText.innerText = '▼'; // 아이콘 변경
        } else {
            imgContainer.style.display = 'none'; // 이미지 숨김
            toggleText.innerText = '▲'; // 아이콘 변경
        }
    }

    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });
</script>

<body>
    <!-- 네비게이션 바 로딩 -->    
    <jsp:include page="NavBar.jsp" />
    <!-- 네비게이션 바 로딩 -->
    
    <!-- 메인 이미지 -->
    <div style="position: relative; width: 100%; height: auto; overflow: hidden;">
        <img src="img/postImg.png" style="width: 100%; height: 600px; object-fit: cover;"/>
        <div style="position: absolute; top: 30%; left: 50%; transform: translate(-50%, -50%); text-align: center; color: white;">
            <h1 style="font-size: 2.5em; text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);">의뢰 게시판</h1>
            <hr style="border: 3px solid white; width: 50%; margin: 10px auto;"/>
            <p style="font-size: 1.5em; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.7);">최고의 품질, 최고의 기술력을 바탕으로 의뢰 결과에 만족하는 결과를 창출하겠습니다. </p>
            <hr style="border: 3px solid white; width: 50%; margin: 10px auto;"/>
        </div>
    </div>
    
    <!-- 메인 내용 -->
    
        <% 
            // 데이터베이스 연결 정보
            
            String dbURL = "jdbc:mariadb://localhost:3306/project";
            String dbUser = "root";
            String dbPassword = "1234";
            
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            // 요청 파라미터에서 게시글 번호를 가져옴
            String requestNumberStr = request.getParameter("request_number");
            int requestNumber = 0;
            if (requestNumberStr != null && !requestNumberStr.isEmpty()) {
                try {
                    requestNumber = Integer.parseInt(requestNumberStr);
                } catch (NumberFormatException e) {
                    out.println("<p>잘못된 게시글 번호입니다.</p>");
                    return;
                }

                try {
                    // MariaDB JDBC 드라이버 로드
                    Class.forName("org.mariadb.jdbc.Driver");

                    // 데이터베이스 연결
                    conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);                   

                    // SQL 쿼리 작성
                    String sql = "SELECT request_title, Customer_user_id, request_body, actual_prediction, important, hitmap, RMSE, MAE, Evaluation_indicators, create_date FROM analysis_request WHERE request_number = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, requestNumber);
                    rs = pstmt.executeQuery();

                    if (rs.next()) {
                        String requestTitle = rs.getString("request_title");
                        String customerUserId = rs.getString("Customer_user_id");
                        String requestBody = rs.getString("request_body");
                        Blob actualPredictionBlob = rs.getBlob("actual_prediction");
                        Blob importantBlob = rs.getBlob("important");
                        Blob hitmapBlob = rs.getBlob("hitmap");
                        float RMSE = rs.getFloat("RMSE");
                        float MAE = rs.getFloat("MAE");
                        float evaluationIndicators = rs.getFloat("Evaluation_indicators");
                        Timestamp createDate = rs.getTimestamp("create_date");

                        // Get image data from Blobs
                        InputStream actualPredictionStream = actualPredictionBlob.getBinaryStream();
                        byte[] actualPredictionBytes = new byte[(int) actualPredictionBlob.length()];
                        actualPredictionStream.read(actualPredictionBytes);
                        actualPredictionStream.close();
                        String actualPredictionBase64 = java.util.Base64.getEncoder().encodeToString(actualPredictionBytes);

                        InputStream importantStream = importantBlob.getBinaryStream();
                        byte[] importantBytes = new byte[(int) importantBlob.length()];
                        importantStream.read(importantBytes);
                        importantStream.close();
                        String importantBase64 = java.util.Base64.getEncoder().encodeToString(importantBytes);

                        InputStream hitmapStream = hitmapBlob.getBinaryStream();
                        byte[] hitmapBytes = new byte[(int) hitmapBlob.length()];
                        hitmapStream.read(hitmapBytes);
                        hitmapStream.close();
                        String hitmapBase64 = java.util.Base64.getEncoder().encodeToString(hitmapBytes);
                %>
                <!-- 요소 부분 -->
				
				<div id="content_box" style="position: relative; z-index: 1; margin-top: -160px; padding: 20px; background-color: rgba(255, 255, 255, 0.8);">
				    
				    <ul>				    	
				    	<li><h2 class="mt-4" style="text-align: center;">게시글 상세보기</h2>
				    	<p style="text-align: center;"><small>작성자: <%= customerUserId %></small></p>
				    	</li>
				    	<li>
				        	<h3 style="text-align: center;"><%= requestTitle %></h3>
				            <p>
				                <strong>내용:</strong>
				            </p>
				            <pre><%= requestBody %></pre>
				        </li>
				        <li>
				            <p class="toggle-button" onclick="toggleImage('imageContainer1', 'toggleText1')">
				                <strong>히트맵 이미지 :<span id="toggleText1">▲</span></strong>
				            </p>
				            <div id="imageContainer1" class="image-container" style="display: none;">
				                <p>데이터 전처리 전 사용자로부터 받은 데이터셋 피처들의 상관관계를 시각적으로 나타낸 이미지입니다.</p>
				                <img src="data:image/jpeg;base64,<%= hitmapBase64 %>" alt="Hitmap Image" style="max-width: 100%; height: auto;"/>
				            </div>
				        </li>
				        <li>
				            <div style="display: flex; justify-content: space-between; align-items: center;">
				                <div class="muted">
				                    <strong data-bs-toggle="tooltip" title="모델의 예측값과 실제값 간의 차이를 제곱하여 평균한 뒤, 제곱근을 취한 값입니다. 값이 낮을수록 예측의 정확도가 높습니다.">
				                        RMSE:</strong> <%= RMSE %>
				                </div>
				                <div style="text-align: center;">
				                    <strong data-bs-toggle="tooltip" title="모델의 예측값과 실제값 간의 절대 차이의 평균입니다. 값이 낮을수록 예측의 정확도가 높습니다.">
				                        MAE:</strong> <%= MAE %>
				                </div>
				                <div style="text-align: right;">
				                    <strong data-bs-toggle="tooltip" title="모델이 데이터 변동성을 얼마나 설명하는지를 나타내는 지표입니다. 1에 가까울수록 좋은 성능을 의미하며, 0은 설명력이 없는 모델을 의미합니다.">
				                        R²-Score:</strong> <%= evaluationIndicators %>
				                </div>
				            </div>
				        </li>
				        <li>
				            <p class="toggle-button" onclick="toggleImage('imageContainer2', 'toggleText2')">
				                <strong>예측 이미지: <span id="toggleText2">▲</span></strong>
				            </p>
				            <div id="imageContainer2" class="image-container" style="display: none;">
				                <p>회귀 모델의 예측 결과를 시각적으로 나타낸 이미지입니다.</p>
				                <img src="data:image/jpeg;base64,<%= actualPredictionBase64 %>" alt="Actual Prediction Image" style="max-width: 100%; height: auto;"/>
				            </div>
				        </li>
				        <li>
				            <p class="toggle-button" onclick="toggleImage('imageContainer3', 'toggleText3')">
				                <strong>중요도 이미지 :<span id="toggleText3">▲</span></strong>
				            </p>
				            <div id="imageContainer3" class="image-container" style="display: none;">
				                <p>데이터를 전처리 한 후의 피처들의 중요도를 나타낸 이미지입니다.</p>
				                <img src="data:image/jpeg;base64,<%= importantBase64 %>" alt="Important Image" style="max-width: 100%; height: auto;"/>
				            </div>
				        </li>
				    </ul>
				</div>
                <div id="button">
                    <button type="button" onclick="location.href='listPosts.jsp'" style="border-radius: 5px;">목 록</button>
                </div>
                <%
                    } else {
                        out.println("<p>해당 게시글을 찾을 수 없습니다.</p>");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("<p>데이터베이스 오류가 발생했습니다.</p>");
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<p>오류가 발생했습니다.</p>");
                } finally {
                    // 리소스 정리
                    try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                    try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                    try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            } else {
                out.println("<p>게시글 번호가 제공되지 않았습니다.</p>");
            }
        %>
    </div>
    <!-- 푸터 바 로딩 -->    
	<jsp:include page="Footer.jsp" />
	<!-- 푸터 바 로딩 --> 
    
</body>
</html>