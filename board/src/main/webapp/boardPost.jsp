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
<title>BoardPost</title>
</head>
<style>
	#title{
		text-align: center;
	}
	#content{
		text-align: center;
		height: 500px;
		display: flex;
	}
	#button{
		text-align: center;
	}
	div.left{
		flex: 1;
	}
	div.center{
		flex: 3;
		border: 1px solid black;
	}
	div.right{
		flex: 1;
	}
</style>
<body>
	<form action='' method='post'>
        <div><h1>navbar</h1></div>
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
    
    // a태그를 통해 url에 넘겨준 inquiry_id를 가져옴
    String InquiryId = request.getParameter("inquiry_id");
    
    try {
        Class.forName(driver);
        // 데이터베이스 연결
        conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
        stmt = conn.createStatement();
        
        String sql = "select * from posts where inquiry_id = '"+InquiryId+"';";
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
		<script>
		function confirm_del() {
			var decision = confirm("정말 삭제 하시겠습니까?");
			if (decision) {
				var sessionUserId = "<%= session.getAttribute("userid") %>";
				var postOwnerId = "<%= Customer_user_id %>";
				
				if (sessionUserId === postOwnerId) {
					alert("삭제 되었습니다.");
					// 삭제 처리로 이동
					window.location.href = 'deletePost.jsp?inquiry_id=<%= InquiryId %>';
				} else {
					alert("삭제 권한이 없습니다.");
				}
			}
		}
		</script>
        <div id='title'>
        	<h1>문의사항 작성</h1>
            <h2><%= title %></h2>
            <p><small>작성자: <%= Customer_user_id %> | 게시일: <%= cereate_date %></small></p>
        </div><br>
        <div id='content'>
            <div class='left'></div>
            <div class='center'><p><%= body %></p></div>
            <div class='right'></div>
        </div><br>
        <div id='button'>
            <button type="button" onclick="window.location.href='answer.jsp?post=<%= title %>'">답변</button>
            <button type="button" onclick="window.location.href='xx.jsp'">수정</button>
            <button type="button" onclick="confirm_del()">삭제</button>
        </div>	
    </form>
<%
        }
        
        if (!hasData) {
        // 해당하는 게시글 고유 id를 찾을 수 없을 때
%>
    <p>No data found in the database with inquiry_id = <%= InquiryId %></p>
<%
        }
        
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 리소스 해제
        if (rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace(); }
        if (stmt != null) try { stmt.close(); } catch (Exception e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace(); }
    }
%>

</body>
</html>