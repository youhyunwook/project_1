<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navibar</title>

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
	<link href="nav.css" rel="stylesheet">
	
	<%
    // 로그인 세션 확인
    String adminName = (String) session.getAttribute("admin_id");
	String userName = (String) session.getAttribute("id");
	%>
	

    

<script>
window.onload = function() {
    var logInOut = function() {
        var navLink = document.getElementById('logout');

        if (navLink != null) {
            navLink.onclick = function(event) {
                // Prevent the default action of the link
                event.preventDefault();

                // Show confirmation dialog
                if (confirm("정말 로그아웃 하시겠습니까?")) {
                    // If confirmed, redirect to logout.jsp
                    alert("로그아웃되었습니다");
                    window.location.href = 'logout.jsp';
                }
            }
        }
    }

    logInOut();
}

</script>  

<!-- Custom styles for this template -->
<link href="carousel.css" rel="stylesheet">
</head>
<body>
<div class="collapse" id="navbarToggleExternalContent" data-bs-theme="black">
<div class="bg-black p-4">
<nav class="navbar navbar-expand-lg bg-black-tertiary">
  <div class="container-fluid">
		<h5 class="text-body-emphasis h4" onclick="location.href='index3.jsp'" style="cursor: pointer;">
    		<img src="img/login_logo2.png" alt="로고" />
   		</h5>
   

      <div class="navbar_links">
  
          <a class="nav-link" href="CompanyInfo.jsp" style="color:white;">기업 소개</a>
     
          <a class="nav-link" href="AnnouncementMain.jsp" style="color:white;">공지사항</a>
        
          <a class="nav-link" href="QnA_main.jsp" style="color:white;">문의 게시판</a>
     

          <a class="nav-link" href = "listPosts.jsp" style="color:white;">의뢰 게시판</a>
     
    
           
      </div>
 <div class="btn-group" role="group" aria-label="Basic example" id="nav-rigth">
       <%
        if (adminName != null) {
      %>
        <button type="button" id = "logout" class="btn btn-outline-light" onclick="window.location.href ='logout.jsp'">로그아웃</button>
      <%
        } else if(userName != null) {       
      %>
      	<div class="btn-group" role="group" aria-label="Basic example" id="nav-rigth">
		  <button type="button" class="btn btn-outline-light" onclick="window.location.href ='UserModify.jsp'">개인정보수정</button>
		  <button type="button" id = "logout"  class="btn btn-outline-light" onclick="window.location.href ='logout.jsp'">로그아웃</button>
		</div>
      <%
        } else {
      %>
        <a href="loginMain.jsp"><button type="button" class="btn btn-outline-light" >로그인</button></a>
      <%
        }
      %>
</div>
    </div>
   </nav> 
  </div>  


  </div>

<nav class="navbar navbar-dark bg-black">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation" >
      <span class="navbar-toggler-icon" ></span>
    </button>
  </div>
</nav>

</body>
</html>