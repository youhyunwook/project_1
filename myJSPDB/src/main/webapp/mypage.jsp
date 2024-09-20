<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="java.util.ArrayList" %>

<%
    HttpSession userSession = request.getSession(); // 변수 이름 변경
    String customerUserId = (String) userSession.getAttribute("id"); 

    // 데이터베이스 연결 설정
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("org.mariadb.jdbc.Driver"); 
        conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/project", "root", "1234");

        // 사용자 정보 쿼리
        String userInfoQuery = "SELECT Customer_user_name, Customer_user_company, Customer_user_phoneNumber, Customer_user_email FROM user WHERE Customer_user_id = ?";
        pstmt = conn.prepareStatement(userInfoQuery);
        pstmt.setString(1, customerUserId);
        rs = pstmt.executeQuery();

        String customerUserName = "";
        String customerUserCompany = "";
        String customerUserPhoneNumber = "";
        String customerUserEmail = "";

        if (rs.next()) {
            customerUserName = rs.getString("Customer_user_name");
            customerUserCompany = rs.getString("Customer_user_company");
            customerUserPhoneNumber = rs.getString("Customer_user_phoneNumber");
            customerUserEmail = rs.getString("Customer_user_email");
        }

        // posts 테이블 쿼리
        String postsQuery = "SELECT title FROM posts WHERE Customer_user_id = ?";
        pstmt = conn.prepareStatement(postsQuery);
        pstmt.setString(1, customerUserId);
        rs = pstmt.executeQuery();

        ArrayList<String> postTitles = new ArrayList<>();
        while (rs.next()) {
            postTitles.add(rs.getString("title"));
        }

        // analysis_request 테이블 쿼리
        String analysisQuery = "SELECT request_title FROM analysis_request WHERE Customer_user_id = ?";
        pstmt = conn.prepareStatement(analysisQuery);
        pstmt.setString(1, customerUserId);
        rs = pstmt.executeQuery();

        ArrayList<String> requestTitles = new ArrayList<>();
        while (rs.next()) {
            requestTitles.add(rs.getString("request_title"));
        }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
</head>
<body>
    <h1>마이페이지</h1>
    <h2>사용자 정보</h2>
    <p>이름: <%= customerUserName %></p>
    <p>회사: <%= customerUserCompany %></p>
    <p>전화번호: <%= customerUserPhoneNumber %></p>
    <p>이메일: <%= customerUserEmail %></p>

    <h2>게시물 제목</h2>
    <ul>
        <% for (String title : postTitles) { %>
            <li><%= title %></li>
        <% } %>
    </ul>

    <h2>분석 요청 제목</h2>
    <ul>
        <% for (String requestTitle : requestTitles) { %>
            <li><%= requestTitle %></li>
        <% } %>
    </ul>

</body>
</html>

<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>
