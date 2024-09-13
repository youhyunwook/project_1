<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	<link rel="stylesheet" href="Announcement_style.css" />
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
		$(document).ready(function() {
		    $('.nav-link[href="pageTestAnn.jsp"]').on('click', function(event) {
		        event.preventDefault(); // 기본 링크 동작 방지
		
		        $.ajax({
		            url: 'pageTestAnn.jsp',
		            type: 'GET',
		            success: function(data) {
		                $('main').html(data); // 'main' 태그의 내용을 가져온 데이터로 교체
		            },
		            error: function(xhr, status, error) {
		                console.error('AJAX 요청 실패:', status, error);
		            }
		        });
		    });
		});
	</script>
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

    
<!-- Custom styles for this template -->
<link href="carousel.css" rel="stylesheet">
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
	
				<a class="nav-link" href="pageTestAnn.jsp" style="color:white;">공지사항</a>
	  
				<a class="nav-link" href="#" style="color:white;">문의 게시판</a>     
	
				<a class="nav-link" href = "#" style="color:white;">의뢰 게시판</a>           
			</div>
			 <div class="btn-group" role="group" aria-label="Basic example" id="nav-rigth">
				  <button type="button" class="btn btn-outline-light" onclick="window.location.href ='UserModify.jsp'">개인정보수정</button>
				  <button type="button" id = "logout" class="btn btn-outline-light">로그아웃</button>
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


    


<main>

  <div id="myCarousel" class="carousel slide mb-6" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="var(--bs-secondary-color)"/></svg>
        <div class="container">
          <div class="carousel-caption text-start">
            <h1>Example headline.</h1>
            <p class="opacity-75">Some representative placeholder content for the first slide of the carousel.</p>
            <p><a class="btn btn-lg btn-primary" href="#">Sign up today</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="var(--bs-secondary-color)"/></svg>
        <div class="container">
          <div class="carousel-caption">
            <h1>Another example headline.</h1>
            <p>Some representative placeholder content for the second slide of the carousel.</p>
            <p><a class="btn btn-lg btn-primary" href="#">Learn more</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="var(--bs-secondary-color)"/></svg>
        <div class="container">
          <div class="carousel-caption text-end">
            <h1>One more for good measure.</h1>
            <p>Some representative placeholder content for the third slide of this carousel.</p>
            <p><a class="btn btn-lg btn-primary" href="#">Browse gallery</a></p>
          </div>
        </div>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>


  <!-- Marketing messaging and featurettes
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->

  <div class="container marketing">

    <!-- Three columns of text below the carousel -->
   


    <!-- START THE FEATURETTES -->


    <div class="row featurette" style="margin-bottom: 50px;">
      <div class="col-md-7">
        <h2 class="featurette-heading fw-normal lh-1">First featurette heading. <span class="text-body-secondary">It’ll blow your mind.</span></h2>
        <p class="lead">Some great placeholder content for the first featurette here. Imagine some exciting prose here.</p>
      </div>
      <div class="col-md-5">
        <img src="img/test.jpg"/>
      </div>
    </div>

    <div class="row featurette" style="margin-bottom: 50px;">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading fw-normal lh-1">Oh yeah, it’s that good. <span class="text-body-secondary">See for yourself.</span></h2>
        <p class="lead">Another featurette? Of course. More placeholder content here to give you an idea of how this layout would work with some actual real-world content in place.</p>
      </div>
      <div class="col-md-5 order-md-1">
      	<img src="img/test.jpg"/>  
      </div>
    </div>

  

    <div class="row featurette" style="margin-bottom: 50px;">
      <div class="col-md-7">
        <h2 class="featurette-heading fw-normal lh-1">And lastly, this one. <span class="text-body-secondary">Checkmate.</span></h2>
        <p class="lead">And yes, this is the last block of representative placeholder content. Again, not really intended to be actually read, simply here to give you a better view of what this would look like with some actual content. Your content.</p>
      </div>
      <div class="col-md-5">
        <img src="img/test.jpg"/>
      </div>
    </div>

 

    <!-- /END THE FEATURETTES -->

  </div><!-- /.container -->


  <!-- FOOTER -->
  <footer class="container" style="background-color: black; border-radius: 5px;">
    <p class="float-end" style="color: white;"><a href="#">Back to top</a></p>
    <p style="color: white;">&copy; 2024 BBA Company, Inc. &middot; <a href="loginMain.jsp">Login</a> &middot;</p>
  </footer>
</main>
<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    </body>
</html>
