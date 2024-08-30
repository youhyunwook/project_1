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
<script>
	function confirm_del(){
		var decision = confirm("정말 삭제 하시겠습니까?");
		if (decision){
			var chk_pwd = prompt("회원님의 비밀번호를 입력해주세요.")
			if (chk_pwd == user_pwd){
				alert("삭제 되었습니다.");
				// DB에서 삭제
			}
		}
	}
</script>
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
    
    try {
        Class.forName(driver);
        // 데이터베이스 연결
        conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
        stmt = conn.createStatement();
        
        // user_id는 user 테이블에서 가져와 변수에 저장하는 것으로 변경해야함.
        String sql = "select * from posts where Customer_user_id ="+"'user1'";
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
        <div id='title'>
            <h2><%= title %></h2>
            <p><small>작성자: <%= Customer_user_id %> | 게시일: <%= cereate_date %></small></p>
        </div><br>
        <div id='content'>
            <div class='left'></div>
            <div class='center'><p><%= body %></p></div>
            <div class='right'></div>
        </div><br>
        <div id='button'>
            <button type="submit" onclick="location.href='xx.jsp'">답변</button>
            <button type="submit" onclick="location.href='xx.jsp'">수정</button>
            <button onclick="confirm_del()">삭제</button>
        </div>
    </form>
<%
        }
        
        if (!hasData) {
%>
    <p>No data found in the database with inquiry_id = 1.</p>
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