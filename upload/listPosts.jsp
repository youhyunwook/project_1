<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>게시글 목록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
    <div class="container">
        <h2 class="mt-4">게시글 목록</h2>
        <table class="table table-bordered mt-4">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // 데이터베이스 연결 정보
                    String dbURL = "jdbc:mariadb://localhost:3306/project";
                    String dbUser = "root";
                    String dbPassword = "1234";

                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        // MariaDB JDBC 드라이버 로드
                        Class.forName("org.mariadb.jdbc.Driver");

                        // 데이터베이스 연결
                        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                        // SQL 쿼리 작성
                        String sql = "SELECT request_number, request_title, Customer_user_id, create_date FROM analysis_request ORDER BY create_date DESC";
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(sql);

                        // 결과 출력
                        while (rs.next()) {
                            int requestNumber = rs.getInt("request_number");
                            String requestTitle = rs.getString("request_title");
                            String customerUserId = rs.getString("Customer_user_id");
                            Timestamp createDate = rs.getTimestamp("create_date");
                %>
                <tr>
                    <td><%= requestNumber %></td>
                    <td><a href="postDetails.jsp?request_number=<%= requestNumber %>"><%= requestTitle %></a></td>
                    <td><%= customerUserId %></td>
                    <td><%= createDate %></td>
                </tr>
                <% 
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println("<tr><td colspan='4'>데이터베이스 오류: " + e.getMessage() + "</td></tr>");
                    } finally {
                        // 리소스 정리
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
