<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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
<link rel="stylesheet" href="Announcement_style.css" />
</head>
<body>
<!-- 네비게이션 바 -->
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
<!-- 네이게이션 바 끝 -->

    <div class="container mt-4">
        <h1 class="mb-4">공지사항 작성</h1>
        <form action="AnnController" method="post">
            <div class="mb-3">
                <label for="Ann_title" class="form-label">제 목</label>
                <input type="text" class="form-control" id="Ann_title" name="Ann_title" placeholder="제목을 입력해주세요" required>
            </div>
            <div class="mb-3">
                <label for="Ann_body" class="form-label">내 용</label>
                <textarea class="form-control" id="Ann_body" name="Ann_body" rows="15" placeholder="내용을 입력해주세요" required></textarea>
            </div>
          
            <button id="submit-button" type="submit" class="btn btn-outline-dark">등 록</button>
        </form>     
</body>
</html>