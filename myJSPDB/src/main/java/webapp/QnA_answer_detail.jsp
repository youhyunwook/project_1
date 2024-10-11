<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="Announcement_style.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>답변 보기</title>
</head>
<body>
<!--네비게이션 바 로딩 -->    
<jsp:include page="NavBar.jsp" />
<!-- 네비게이션 바 로딩 -->

    <!-- 메인 이미지 -->
	<div style="position: relative; width: 100%; height: auto; overflow: hidden;">
	    <img src="img/QnAImg.png" style="width: 100%; height: 600px; object-fit: cover;"/>
	    <div style="position: absolute; top: 30%; left: 50%; transform: translate(-50%, -50%); text-align: center; color: white;">
	        <h1 style="font-size: 2.5em; text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);">문의 게시판</h1>
	        <hr style="border: 3px solid white; width: 50%; margin: 10px auto;"/>
	        <p style="font-size: 1.5em; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.7);">데이터 분석의 선두주자로서 고객 문의를 성심성의껏<br>답변해드립니다. </p>
	        <hr style="border: 3px solid white; width: 50%; margin: 10px auto;"/>
	    </div>
	</div>
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

            
            <div id="content_box" style="position: relative; z-index: 1; margin-top: -100px; padding: 20px; background-color: rgba(255, 255, 255, 0.8);">
	            <p><strong>답변 작성자:</strong> <%= admin_id %></p>
	            <p><strong>답변 내용:</strong> <%= answer %></p>
			</div>
			<div id="button">
				<button type="button" onclick="window.location.href='QnA_main.jsp'" style="border-radius: 5px;">목록</button>
			</div>
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
	<!-- 푸터 바 로딩 -->    
    <jsp:include page="Footer.jsp" />
    <!-- 푸터 바 로딩 -->  
</body>
</html>
