<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // MariaDB JDBC 드라이버 로드
            Class.forName("org.mariadb.jdbc.Driver");

            // 데이터베이스 연결
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // 페이지 번호 처리
            int pageNumber = 1;
            if (request.getParameter("page") != null) {
                pageNumber = Integer.parseInt(request.getParameter("page"));
            }
            int pageSize = 10;
            int offset = (pageNumber - 1) * pageSize;

            // 전체 게시글 수 조회
            String countSql = "SELECT COUNT(*) AS total FROM analysis_request";
            pstmt = conn.prepareStatement(countSql);
            rs = pstmt.executeQuery();
            rs.next();
            int totalPosts = rs.getInt("total");
            int totalPages = (int) Math.ceil((double) totalPosts / pageSize);

            // SQL 쿼리 작성 (페이징 적용)
            String sql = "SELECT request_number, request_title, Customer_user_id, create_date " +
                         "FROM analysis_request ORDER BY create_date DESC LIMIT ? OFFSET ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, pageSize);
            pstmt.setInt(2, offset);
            rs = pstmt.executeQuery();

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
        %>
        </tbody>
    </table>

    <!-- 페이징 네비게이터 부분 -->
    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <% for (int i = 1; i <= totalPages; i++) { %>
                <li class="page-item <%= (i == pageNumber) ? "active" : "" %>">
                    <a class="page-link" href="?page=<%= i %>"><%= i %></a>
                </li>
            <% } %>
        </ul>
    </nav>
    <!-- 페이징 네비게이터 끝 -->
    <%
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<tr><td colspan='4'>데이터베이스 오류: " + e.getMessage() + "</td></tr>");
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
    %>
</div>
</body>
</html>
