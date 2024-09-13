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
	
<style>
     .bd-placeholder-img {
       font-size: 1.125rem;
       text-anchor: middle;
       -webkit-user-select: none;
       -moz-user-select: none;
       user-select: none;
     }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        width: 100%;
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }



      .btn-bd-primary {
        --bd-violet-bg: #712cf9;
        --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

        --bs-btn-font-weight: 600;
        --bs-btn-color: var(--bs-white);
        --bs-btn-bg: var(--bd-violet-bg);
        --bs-btn-border-color: var(--bd-violet-bg);
        --bs-btn-hover-color: var(--bs-white);
        --bs-btn-hover-bg: #6528e0;
        --bs-btn-hover-border-color: #6528e0;
        --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
        --bs-btn-active-color: var(--bs-btn-hover-color);
        --bs-btn-active-bg: #5a23c8;
        --bs-btn-active-border-color: #5a23c8;
      }

      .bd-mode-toggle {
        z-index: 1500;
      }

      .bd-mode-toggle .dropdown-menu .active .bi {
        display: block !important;
      }
</style>

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
	<form action='' method='post'>
	<div class="collapse" id="navbarToggleExternalContent" data-bs-theme="dark">
		<div class="bg-dark p-4">
			<nav class="navbar navbar-expand-lg bg-dark-tertiary">
			<div class="container-fluid">
				<h5 class="text-body-emphasis h4" onclick="location.href='index3.jsp'" style="cursor: pointer;">
    			<img src="img/login_logo2.png" alt="로고" />
   				</h5>

			<div class="navbar_links">  
				<a class="nav-link" href="#" style="color:white;">기업 소개</a>
	
				<a class="nav-link" href="AnnouncementMain.jsp" style="color:white;">공지사항</a>
	  
				<a class="nav-link" href="#" style="color:white;">문의 게시판</a>     
	
				<a class="nav-link" href = "#" style="color:white;">의뢰 게시판</a>           
			</div>
			<div class="btn-group" role="group" aria-label="Basic example" id="nav-rigth">
				<a href="loginMain.jsp"><button type="button" class="btn btn-outline-light">로그인</button></a>
			</div>
			</div>
			</nav> 
		</div>  
	</div>

	<nav class="navbar navbar-dark bg-dark">
  		<div class="container-fluid">
    		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
      		<span class="navbar-toggler-icon"></span>
    		</button>
  		</div>
	</nav>
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
        
        while (rs.next()) {
            hasData = true; // 데이터를 가져왔으므로 true로 설정
            String Ann_id = rs.getString("Ann_id");
            String Ann_author_id = rs.getString("Ann_author_id");
            String title = rs.getString("Ann_title");
            String body = rs.getString("Ann_body");
            String create_date = rs.getString("create_date");
	%>
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
            <button type="button" onclick="location.href='AnnouncementMain.jsp'">목 록</button>
        </div>
    </form>
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

</body>
</html>