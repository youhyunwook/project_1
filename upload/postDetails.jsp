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
</head>
<script src="del.js"></script>
<body>
    <div class="container">
        <h2 class="mt-4">게시글 상세보기</h2>
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
                <h3><%= requestTitle %></h3>
                <p><strong>작성자:</strong> <%= customerUserId %></p>
                <p><strong>내용:</strong></p>
                <pre><%= requestBody %></pre>
                <p><strong>RMSE:</strong> <%= RMSE %></p>
                <p><strong>MAE:</strong> <%= MAE %></p>
                <p><strong>평가 지표:</strong> <%= evaluationIndicators %></p>
                <p><strong>예측 이미지:</strong></p>
                <img src="data:image/jpeg;base64,<%= imageBase64 %>" alt="Actual Prediction Image" style="max-width: 100%; height: auto;"/>
                <button id="delete-button" class="btn btn-danger" data-request-number="<%= requestNumber %>">삭제</button>
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
</body>
</html>

