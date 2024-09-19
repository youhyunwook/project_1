<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>답변 보기</title>
</head>
<body>
<!--네비게이션 바 로딩 -->    
<jsp:include page="NavBar.jsp" />
<!-- 네비게이션 바 로딩 -->
<%
    String driver = "org.mariadb.jdbc.Driver";
    String DB_IP = "localhost";
    String DB_PORT = "3306";
    String DB_NAME = "project";
    String DB_USER = "root";
    String DB_PASSWORD = "1234";
    String DB_URL1 = "jdbc:mariadb://" + DB_IP + ":" + DB_PORT + "/" + DB_NAME;
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    String inquiry_id = request.getParameter("inquiry_id");

    try {
        Class.forName(driver);
        conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
        stmt = conn.createStatement();
        String sql = "SELECT admin_id, answer FROM posts WHERE inquiry_id = " + inquiry_id;
        rs = stmt.executeQuery(sql);
        
        if (rs.next()) {
            String admin_id = rs.getString("admin_id");
            String answer = rs.getString("answer");
%>
            <h1>답변 상세</h1>
            <p><strong>답변 작성자:</strong> <%= admin_id %></p>
            <p><strong>답변 내용:</strong> <%= answer %></p>
<%
        } else {
%>
            <p>답변이 존재하지 않습니다.</p>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace(); }
        if (stmt != null) try { stmt.close(); } catch (Exception e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace(); }
    }
%>
</body>
</html>
