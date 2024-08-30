<%@ page import=
	"java.sql.Connection,
	java.sql.DriverManager,
	java.sql.ResultSet,
	java.sql.Statement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardMain</title>
</head>
<style>
	#title{
		text-align: center;
	}
	#content_box{
		width: 1000px;
		border: 1px solid black;
		margin: 0 auto;
	}
	ul{
		padding-left: 10px; 
	}
	li{
		list-style-type: none;
	}
	li>p{
		text-align: right;
		padding: 0 0 10px 10px;
	}
	#button{
		text-align: right;
	}
</style>
<body>
	<div>	
	<!-- 게시판 제목 -->
	<div id='title'>
		<h1>xx게시판</h1>
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
	    Statement stmt = null;
	    ResultSet rs = null;
	    boolean hasData = false; // 데이터를 가져왔는지 여부를 확인하는 변수
	    
	    try {
	        Class.forName(driver);
	        // 데이터베이스 연결
	        conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
	        stmt = conn.createStatement();
	        
	        // user_id는 user 테이블에서 가져와 변수에 저장하는 것으로 변경해야함.
	        String sql = "select * from posts;";
	        rs = stmt.executeQuery(sql);
	        
	        while (rs.next()) {
	            hasData = true; // 데이터를 가져왔으므로 true로 설정
	            String inquiry_id = rs.getString("inquiry_id");
	            String Customer_user_id = rs.getString("Customer_user_id");
	            String title = rs.getString("title");
	            String body = rs.getString("body");
	            String admin_id = rs.getString("admin_id");
	            String answer = rs.getString("answer");
	            String cereate_date = rs.getString("cereate_date");
                    
        %>
		
			<li>
				<%= title %><br>
				<small>작성자: <%= Customer_user_id %>  |  게시일: <%= cereate_date %></small>
			</li>
			<hr>
		
		<%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // 리소스 해제
                if (rs != null) 
                	try { rs.close(); } 
                	catch (Exception e) { 
                		e.printStackTrace(); }
                if (stmt != null) 
                	try { stmt.close(); } 
                	catch (Exception e) { 
                		e.printStackTrace(); }
                if (conn != null) 
                	try { conn.close(); } 
                	catch (Exception e) { 
                		e.printStackTrace(); }
            }
        %>
        </ul>
	</div>
	<!-- 게시글 등록 페이지로 이동 버튼 -->
	<div id='button'>
		<button onclick="location.href='boardUpload.jsp'">게시글 등록</button>
	</div>
	</div>
</body>
</html>