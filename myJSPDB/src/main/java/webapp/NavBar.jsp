<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Navibar</title>

    <link href="carousel.css" rel="stylesheet">
    <link href="carousel.rtl.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.122.0">

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/carousel/">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="nav.css" rel="stylesheet">
    
    <!-- Google Fonts 링크 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">


    <%
        // 로그인 세션 확인
        String adminName = (String) session.getAttribute("admin_id");
        String userName = (String) session.getAttribute("id");
    %>

    <script>
    var adminName = "${sessionScope.admin_id != null ? sessionScope.admin_id : 'null'}"; // 어드민용 변수저장
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

      
        //네비바 스크롤 상단 고정
//네비바 스크롤 상단 고정
window.onscroll = function() {
    const navbar = document.querySelector('.navbar');
    const navbar_in = document.querySelector(".container-fluid");
    const sticky = navbar.offsetTop;

    if (window.pageYOffset > sticky) {
        navbar.classList.add("fixed-top");
        if (adminName !== 'null') { // 관리자 로그인 체크
            navbar.style.backgroundColor = "rgba(255, 255, 255, 0.6)"; // 관리자 반투명 배경
            navbar_in.style.backgroundColor = "rgba(255, 255, 255, 0)"; // 관리자 반투명 배경
            navbar.style.color = "black"; // 글자색 검정
        } else {
            navbar.style.backgroundColor = "rgba(0, 0, 0, 0.6)"; // 일반 반투명 배경
            navbar_in.style.backgroundColor = "rgba(0, 0, 0, 0)"; // 일반 반투명 배경
            navbar.style.color = "white"; // 글자색 흰색
        }
    } else {
        navbar.classList.remove("fixed-top");
        navbar.style.backgroundColor = "transparent"; // 원래 상태의 배경
        navbar_in.style.backgroundColor = "transparent"; // 원래 상태의 배경
        navbar.style.color = ""; // 기본 글자색으로 복구
    }
};

    </script>

    <!-- Custom styles for this template -->
    <link href="carousel.css" rel="stylesheet">
    <%
if (adminName != null){
	%>
	<style>
	.bg-black{
	background-color: white !important;
	}
	.navbar-toggler{
	background-color: black !important;}
	</style><%
}else%>

</head>

<body>
    <div class="collapse" id="navbarToggleExternalContent" data-bs-theme="black" style="<%= adminName != null ? "background-color: white; color: black;" : "background-color: black;" %>" >
        <div class="bg-black p-4" style="<%= adminName != null ? "background-color: white !important; color: black;" : "background-color: black;" %>">
            <nav class="navbar navbar-expand-lg bg-black-tertiary" style="<%= adminName != null ? "background-color: white; color: black;" : "background-color: black;" %>">
                <div class="container-fluid" style="<%= adminName != null ? "background-color: white; color: black;" : "background-color: black;" %>">
                    <h5 class="text-body-emphasis h4" onclick="location.href='index3.jsp'" style="cursor: pointer; margin-top: 5px;">
                        <img src="img/login_logo2.png" alt="로고" />
                    </h5>

                    <div class="navbar_links" >
					    <a class="nav-link" href="CompanyInfo.jsp" style="color: <%= adminName != null ? "black" : "white" %>; padding: 8px 12px; text-decoration: none; margin-right: 10px; border-bottom: 2px solid transparent; transition: border-color 0.3s;">기업 소개</a>
					    <a class="nav-link" href="AnnouncementMain.jsp" style="color: <%= adminName != null ? "black" : "white" %>; padding: 8px 12px; text-decoration: none; margin-right: 10px; border-bottom: 2px solid transparent; transition: border-color 0.3s;">공지사항</a>
					    <a class="nav-link" href="QnA_main.jsp" style="color: <%= adminName != null ? "black" : "white" %>; padding: 8px 12px; text-decoration: none; margin-right: 10px; border-bottom: 2px solid transparent; transition: border-color 0.3s;">문의 게시판</a>
					    <a class="nav-link" href="listPosts.jsp" style="color: <%= adminName != null ? "black" : "white" %>; padding: 8px 12px; text-decoration: none; border-bottom: 2px solid transparent;">의뢰 게시판</a>
					</div>
                    
                    <div class="btn-group" role="group" aria-label="Basic example" id="nav-right" >
					    <%
					        if (adminName != null) {
					    %>
					        <img src="img/logout-icon.png" alt="로그아웃" style="width: 50px; height:50px; cursor: pointer; transition: transform 0.3s;" onclick="window.location.href='logout.jsp'" onmouseover="this.style.transform='scale(1.1)';" onmouseout="this.style.transform='scale(1)';" />
					    <%
					        } else if (userName != null) {
					    %>
					        <div class="btn-group" role="group" aria-label="Basic example" id="nav-right">
					            <img src="img/mypage-icon.png" title="마이페이지" alt="마이페이지" style="width: 50px; height:50px; cursor: pointer; transition: transform 0.3s; margin-right: 30px;" onclick="window.location.href='MyPage.jsp'" onmouseover="this.style.transform='scale(1.1)';" onmouseout="this.style.transform='scale(1)';" />
					            <img src="img/logout-icon.png" title="로그아웃" alt="로그아웃" style="width: 50px; height:50px; cursor: pointer; transition: transform 0.3s;" onclick="window.location.href='logout.jsp'" onmouseover="this.style.transform='scale(1.1)';" onmouseout="this.style.transform='scale(1)';" />
					        </div>
					    <%
					        } else {
					    %>
					        <a href="loginMain.jsp">
					            <img src="img/loginIcon.png" alt="로그인" style="width: 50px; height:50px; cursor: pointer; transition: transform 0.3s;" />
					        </a>
					    <%
					        }
					    %>
					</div>
                </div>
            </nav>
        </div>
    </div>

    <nav class="navbar navbar-dark bg-black" >
        <div class="container-fluid" >
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
    </nav>
</body>
</html>
