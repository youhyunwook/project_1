<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.PreparedStatement" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="Announcement_style.css" />
    <title>의뢰사항 목록</title>

    <script>
    document.addEventListener("DOMContentLoaded", function() {
        const urlParams = new URLSearchParams(window.location.search);
        const isOpen = urlParams.get('navbarOpen') === 'true';

        if (isOpen) {
            document.querySelector('.navbar-toggler').classList.add('show');
            document.querySelector('.navbar-collapse').classList.add('show');
        }
    });
    </script>
</head>

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

<!-- DB에서 게시글의 제목을 가져와 목록으로 나열 -->
<div id='content_box' style="position: relative; z-index: 1; margin-top: -200px; padding: 20px; background-color: rgba(255, 255, 255, 0.8);">    
    <ul>
    <!-- 검색창 -->
    <div id="search_box" style="display: flex; justify-content: center; margin-bottom: 20px;">
        <form action="listPosts.jsp" method="get" style="position: relative; width: 500px;">
            <input type="text" name="searchQuery" placeholder="작성자 또는 제목을 입력하세요" style="width: 100%; height: 45px; padding-right: 50px; box-sizing: border-box;" />
            <button type="submit" style="position: absolute; right: 0px; top: 50%; transform: translateY(-50%); height: 45px;">검색</button>
        </form>
    </div>
    <%
    String searchQuery = request.getParameter("searchQuery");
    String driver = "org.mariadb.jdbc.Driver";
    String DB_IP = "localhost";
    String DB_PORT = "3306";
    String DB_NAME = "project";
    String DB_USER = "root";
    String DB_PASSWORD = "1234";
    String DB_URL1 = "jdbc:mariadb://"+DB_IP+":"+DB_PORT+"/"+DB_NAME;
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String userId = null;
    if (session != null) {
        userId = (String) session.getAttribute("id");
    }

    int pageSize = 5;
    int pageNumber = 1;

    String pageNumberParam = request.getParameter("page");
    if (pageNumberParam != null && !pageNumberParam.isEmpty()) {
        try {
            pageNumber = Integer.parseInt(pageNumberParam);
        } catch (NumberFormatException e) {
            pageNumber = 1;
        }
    }

    int offset = (pageNumber - 1) * pageSize;
    int totalPosts = 0;

    try {
        Class.forName(driver);
        conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);

        // Count query
        String countQuery = "SELECT COUNT(*) FROM analysis_request" + 
                            (searchQuery != null && !searchQuery.isEmpty() ? " WHERE request_title LIKE ? OR Customer_user_id LIKE ?" : "");
        pstmt = conn.prepareStatement(countQuery);
        if (searchQuery != null && !searchQuery.isEmpty()) {
            pstmt.setString(1, "%" + searchQuery + "%");
            pstmt.setString(2, "%" + searchQuery + "%");
        }
        rs = pstmt.executeQuery();

        if (rs.next()) {
            totalPosts = rs.getInt(1);
        }

        // Data query
        String sql_get = "SELECT request_number, Customer_user_id, request_title, create_date FROM analysis_request" + 
                         (searchQuery != null && !searchQuery.isEmpty() ? " WHERE request_title LIKE ? OR Customer_user_id LIKE ?" : "") + 
                         " ORDER BY create_date DESC LIMIT ? OFFSET ?";
        pstmt = conn.prepareStatement(sql_get);
        if (searchQuery != null && !searchQuery.isEmpty()) {
            pstmt.setString(1, "%" + searchQuery + "%");
            pstmt.setString(2, "%" + searchQuery + "%");
            pstmt.setInt(3, pageSize);
            pstmt.setInt(4, offset);
        } else {
            pstmt.setInt(1, pageSize);
            pstmt.setInt(2, offset);
        }
        rs = pstmt.executeQuery();

        boolean hasResults = false;
        while (rs.next()) {
            hasResults = true;
            int requestNumber = rs.getInt("request_number");
            String customerUserId = rs.getString("Customer_user_id");
            String requestTitle = rs.getString("request_title");
            Timestamp createDate = rs.getTimestamp("create_date");
    %>       
            <li>
                <a href="postDetails.jsp?request_number=<%= requestNumber %>" class="title_click" data-id="<%= requestNumber %>"><%= requestTitle %></a>
                <div class="info">
                    <div class="author">작성자: <%= customerUserId %></div>
                    <div class="date">작성일: <%= new SimpleDateFormat("yyyy-MM-dd HH:mm").format(createDate) %></div>
                </div>
            </li>
    <%
        }
        if (!hasResults) {
    %>
            <li>검색 결과가 없습니다.</li>
    <%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) 
            try { rs.close(); } 
            catch (Exception e) { e.printStackTrace(); }
        if (pstmt != null) 
            try { pstmt.close(); } 
            catch (Exception e) { e.printStackTrace(); }
        if (conn != null) 
            try { conn.close(); } 
            catch (Exception e) { e.printStackTrace(); }
    }
    int totalPages = (int) Math.ceil((double) totalPosts / pageSize);
    %>
    </ul>
</div>

<!-- 페이지네이션 링크 -->
<div id='button'>
    <%
        if (pageNumber > 1) {
    %>
        <a href="listPosts.jsp?page=<%= pageNumber - 1 %>&searchQuery=<%= searchQuery != null ? searchQuery : "" %>">이전</a>
    <%
        }
        for (int i = 1; i <= totalPages; i++) {
            if (i == pageNumber) {
    %>
                <strong><%= i %></strong>
    <%
            } else {
    %>
                <a href="listPosts.jsp?page=<%= i %>&searchQuery=<%= searchQuery != null ? searchQuery : "" %>"><%= i %></a>
    <%
            }
        }
        if (pageNumber < totalPages) {
    %>
        <a href="listPosts.jsp?page=<%= pageNumber + 1 %>&searchQuery=<%= searchQuery != null ? searchQuery : "" %>">다음</a>
    <%
        }
        if (userId != null) {
    %>
        <button onclick="location.href='request_upload.jsp'" style="border-radius: 5px; height: 42px;">등록</button>
    <%
        }
    %>     
</div>
<!-- 푸터 바 로딩 -->    
<jsp:include page="Footer.jsp" />
<!-- 푸터 바 로딩 -->  

</body>
</html>
