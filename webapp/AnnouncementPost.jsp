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
<link rel="stylesheet" href="Announcement_style.css" />
<!-- bootStrap -->
	<script src="../assets/js/color-modes.js"></script>
	<link href="carousel.css" rel="stylesheet">
	<link href="carousel.rtl.css" rel="stylesheet">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
	<meta name="generator" content="Hugo 0.122.0">
	<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/carousel/">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">  
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<link rel = "'stylesheet" href = "../bootstrap/scss/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
	<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="NewFile.css">
	
	<title>BoardPost</title>


</head>
<script>
function confirm_del(postId) {
    var decision = confirm("정말 삭제 하시겠습니까?");
    if (decision) {
        // AJAX 요청을 통해 삭제 요청을 서버로 전송
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "AnnouncementDel", true); // 서버의 삭제 처리 URL
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    // 서버에서 삭제 성공 응답이 오면 페이지를 새로고침하여 변경된 내용을 반영
                    alert("게시글이 삭제되었습니다.");
                    /* history.go(-1); */
                    window.location.reload();
                    
                } else {
                    alert("게시글 삭제에 실패했습니다.");
                }
            }
        };
        xhr.send("postId=" + encodeURIComponent(postId));
        
    } else {
        // 삭제 취소 시 이전 페이지로 돌아감
        history.go(-1);
    }
}
</script>

<body>
<!--네비게이션 바 로딩 -->    
<jsp:include page="NavBar.jsp" />
<!-- 네비게이션 바 로딩 -->
<div id="main-content">
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
    String AnnId = request.getParameter("Ann_id");
    
 	// 세션 객체를 가져와서 사용자 역할을 확인합니다.
    HttpSession login_session = request.getSession(false); // 세션이 존재하지 않으면 null을 반환
    String useRole = null;
    
    if (login_session != null) {
        useRole = (String) session.getAttribute("useRole");
    }
    
    try {
        Class.forName(driver);
        // 데이터베이스 연결
        conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
        stmt = conn.createStatement();
        
        String sql = "select * from announcement where Ann_id = '"+AnnId+"';";
        rs = stmt.executeQuery(sql);
        
        if (rs.next()) {
            hasData = true; // 데이터를 가져왔으므로 true로 설정
            String Ann_id = rs.getString("Ann_id");
            String Ann_author_id = rs.getString("Ann_author_id");
            String title = rs.getString("Ann_title");
            String body = rs.getString("Ann_body");
            String create_date = rs.getString("create_date");
	%>
	<div id="back_ann_main">
        <div id='title'>
            <h2><%= title %></h2>
            <p><small>작성자: <%= Ann_author_id %> | 게시일: <%= create_date %></small></p>
        </div><br>
        <div id='content_box'>
            <p><%= body %></p>
        </div><br>
        <div id='button'>
        	<%
            // Check user role from session            
            if ("admin".equals(useRole)) {
        	%>
            <button type="submit" onclick="location.href='Ann_Modify.jsp'">수 정</button>
            <button onclick="confirm_del('<%= Ann_id %>')">삭제</button>
            <%
            }
            %>
            <button type="button" onclick="location.href='AnnouncementMain.jsp'" class="back_main">목 록</button>
        </div>
	</div>

<%
        }
        
        if (!hasData) {
        // 해당하는 게시글 고유 id를 찾을 수 없을 때
        	

         response.sendRedirect("AnnouncementMain.jsp");

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
</div>
</body>
</html>