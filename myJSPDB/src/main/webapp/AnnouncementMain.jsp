<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement, java.sql.PreparedStatement " %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="Announcement_style.css" />
<title>AnnouncementMain</title>
</head>
<body>
	
	<!-- 게시판 제목 -->
	<div id='title'>
		<h1>공지사항</h1>
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
/* 	    boolean hasData = false; // 데이터를 가져왔는지 여부를 확인하는 변수 */

 		// 세션 객체를 가져와서 사용자 역할을 확인합니다.
        HttpSession login_session = request.getSession(false); // 세션이 존재하지 않으면 null을 반환
        String useRole = null;
        
        if (login_session != null) {
            useRole = (String) session.getAttribute("useRole");
        }

		int pageSize = 5; // 한페이지에 표시할 게시글 수
		int pageNumber = 1; // 현재 페이지 번호
		
		// 페이지 번호가 요청 파라미터로 전달되면 해당 파라미터 사용
		String pageNumberParam = request.getParameter("page");
		if(pageNumberParam != null && !pageNumberParam.isEmpty() ){
			try {
				pageNumber = Integer.parseInt(pageNumberParam);
			} catch(NumberFormatException e) {
				pageNumber = 1;
			}
		}
	    
		int offset = (pageNumber - 1) * pageSize;
		int totalPosts = 0;
		
		
	    try {
	        Class.forName(driver);
	        // 데이터베이스 연결
	        conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
	        stmt = conn.createStatement();
	        
	        // 총 게시글 수를 가져옴	         
	      	String countQuery = "SELECT COUNT(*) FROM announcement";
	        // user_id는 user 테이블에서 가져와 변수에 저장하는 것으로 변경해야함.
	        String sql = "select * from announcement";
	        ResultSet countResult = stmt.executeQuery(countQuery);
	       
	        
	        if(countResult.next()){
	        	totalPosts = countResult.getInt(1);
	        }
	        	        
	        // 게시글 가져오는 쿼리
	        String sql_get = "SELECT * FROM announcement ORDER BY Ann_id DESC LIMIT ? OFFSET ?";
	        PreparedStatement pstmt = conn.prepareStatement(sql_get);
	        pstmt.setInt(1, pageSize);
	        pstmt.setInt(2, offset);
	        rs = pstmt.executeQuery();
	        
	       while (rs.next()) {
	            /* hasData = true; // 데이터를 가져왔으므로 true로 설정 */
	            int id = rs.getInt("Ann_id");
	            String admin_id = rs.getString("Ann_author_id");
	            String title = rs.getString("Ann_title");
	            String body = rs.getString("Ann_body");
	            String create_date = rs.getString("create_date");
                    
        %>		
			<!--  화면 타이틀 -->
			<li>
				<a href="AnnouncementPost.jsp?Ann_id=<%= id %>"><%= title %></a><br>
				<small> 작성자: <%= admin_id %>  |  게시일: <%= create_date %></small>
			</li>
			
		
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
	    	int totalPages = (int) Math.ceil((double) totalPosts / pageSize);
        %>
        </ul>
	</div>
	<!-- 페이지네이션 링크 -->
        <div id='button'>
            <%
                if (pageNumber > 1) {
            %>
            <a href="AnnouncementMain.jsp?page=<%= pageNumber - 1 %>">이전</a>
            <%
                }
                for (int i = 1; i <= totalPages; i++) {
                    if (i == pageNumber) {
            %>
            <strong><%= i %></strong>
            <%
                    } else {
            %>
            <a href="AnnouncementMain.jsp?page=<%= i %>"><%= i %></a>
            <%
                    }
                }
                if (pageNumber < totalPages) {
            %>
            <a href="AnnouncementMain.jsp?page=<%= pageNumber + 1 %>">다음</a>
            <%
                }
            %>
            <%
            // Check user role from session            
            if ("admin".equals(useRole)) {
        	%>
        	<button onclick="location.href='AnnouncementWrite.jsp'">등록</button>
        	<%
            }
            
   			%>     
        </div>
	</div>
</body>
</html>