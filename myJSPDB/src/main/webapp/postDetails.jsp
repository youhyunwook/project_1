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
    function toggleImage() {
        const imgContainer = document.getElementById('imageContainer');
        const toggleText = document.getElementById('toggleText');
        
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
	<script src="del.js"></script>
<body>
    <!-- 네비게이션 바 로딩 -->    
    <jsp:include page="NavBar.jsp" />
    <!-- 네비게이션 바 로딩 -->
    
    <!-- 메인 이미지 -->
	<div style="position: relative; width: 100%; height: 230px; overflow: hidden;">
	    <img src="img/postImg.png" style="width: 100%; height: 230px; object-fit: cover;"/>
	    <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center; color: white;">
	        <h1 style="font-size: 2.5em; text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);">의뢰 게시판</h1>
	        <hr style="border: 3px solid white; width: 50%; margin: 10px auto;"/>
	        <p style="font-size: 1.5em; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.7);">최고의 품질, 최고의 기술력을 바탕으로 의뢰 결과에 만족하는 결과를 창출하겠습니다. </p>
	        <hr style="border: 3px solid white; width: 50%; margin: 10px auto;"/>
	    </div>
	</div>
	
	<!-- 메인 내용 -->
    <div class="container">
        <h2 class="mt-4" style="text-align: center;">게시글 상세보기</h2>
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
                    String sql = "SELECT request_title, Customer_user_id, request_body, actual_prediction, RMSE, MAE, Evaluation_indicators, create_date FROM analysis_request WHERE request_number = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, requestNumber);
                    rs = pstmt.executeQuery();

                    if (rs.next()) {
                        String requestTitle = rs.getString("request_title");
                        String customerUserId = rs.getString("Customer_user_id");
                        String requestBody = rs.getString("request_body");
                        Blob actualPredictionBlob = rs.getBlob("actual_prediction");
                        float RMSE = rs.getFloat("RMSE");
                        float MAE = rs.getFloat("MAE");
                        float evaluationIndicators = rs.getFloat("Evaluation_indicators");
                        Timestamp createDate = rs.getTimestamp("create_date");

                        // Get image data from Blob
                        InputStream imageStream = actualPredictionBlob.getBinaryStream();
                        byte[] imageBytes = new byte[(int) actualPredictionBlob.length()];
                        imageStream.read(imageBytes);
                        imageStream.close();
                        String imageBase64 = java.util.Base64.getEncoder().encodeToString(imageBytes);
                %>
                <!-- 요소 부분 -->
                <p style="text-align: center;"><small>작성자: <%= customerUserId %></small></p>
                <div id="content_box">
                <h3 style="text-align: center;"><%= requestTitle %></h3>
               <ul>
               	<li> <p><strong>내용:</strong></p>
                <pre><%= requestBody %></pre> 
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
    				평가 지표:</strong> <%= evaluationIndicators %>
					</div>
				</div>
                </li>
                <li>
                <p class="toggle-button" onclick="toggleImage()">
        			<strong>예측 이미지: <span id="toggleText">▲</span></strong>
        			</p>
			    <div id="imageContainer" class="image-container">
			    	<p>회귀 모델의 예측 결과를 시각적으로 나타낸 이미지입니다.</p>
			        <img src="data:image/jpeg;base64,<%= imageBase64 %>" alt="Actual Prediction Image" style="max-width: 100%; height: auto;"/>
			    </div>
               	</li>
               </ul>
                </div>
                <div id="button">
                <button type="button" onclick="window.location.href='listPosts.jsp'" style="border-radius: 5px;">목록</button>
                </div>
                
                <!-- 요소 끝 -->
                <% 
                    } else {
                        out.println("<p>게시글을 찾을 수 없습니다.</p>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<p>데이터베이스 오류: " + e.getMessage() + "</p>");
                } finally {
                    // 리소스 정리
                    try {
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
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

