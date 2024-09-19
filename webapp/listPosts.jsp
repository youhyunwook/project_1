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

<div id='title'>
    <h1>의뢰사항</h1>
</div>

<!-- DB에서 게시글의 제목을 가져와 목록으로 나열 -->
<div id='content_box'>	
    <ul>
    <%
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

    // 세션 객체를 가져와서 사용자 역할을 확인합니다.
    HttpSession login_session = request.getSession(false);
    String useRole = null;
    
    if (login_session != null) {
        useRole = (String) login_session.getAttribute("useRole");
    }

    int pageSize = 5; // 한페이지에 표시할 게시글 수
    int pageNumber = 1; // 현재 페이지 번호

    // 페이지 번호가 요청 파라미터로 전달되면 해당 파라미터 사용
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
        // 데이터베이스 연결
        conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
        
        // 총 게시글 수를 가져옴
        String countQuery = "SELECT COUNT(*) FROM analysis_request";
        pstmt = conn.prepareStatement(countQuery);
        rs = pstmt.executeQuery();
        
        if (rs.next()) {
            totalPosts = rs.getInt(1);
        }
        
        // 게시글 가져오는 쿼리
        String sql_get = "SELECT request_number, Customer_user_id, request_title, create_date FROM analysis_request ORDER BY create_date DESC LIMIT ? OFFSET ?";
        pstmt = conn.prepareStatement(sql_get);
        pstmt.setInt(1, pageSize);
        pstmt.setInt(2, offset);
        rs = pstmt.executeQuery();
        
        while (rs.next()) {
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
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 리소스 해제
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
        <a href="listPosts.jsp?page=<%= pageNumber - 1 %>">이전</a>
    <%
        }
        for (int i = 1; i <= totalPages; i++) {
            if (i == pageNumber) {
    %>
                <strong><%= i %></strong>
    <%
            } else {
    %>
                <a href="listPosts.jsp?page=<%= i %>"><%= i %></a>
    <%
            }
        }
        if (pageNumber < totalPages) {
    %>
        <a href="listPosts.jsp?page=<%= pageNumber + 1 %>">다음</a>
    <%
        }
        // Check user role from session            
        if ("admin".equals(useRole)) {
    %>
        <button onclick="location.href='upload_test.jsp'">등록</button>
    <%
        }
    %>     
</div>	
</body>
</html>
