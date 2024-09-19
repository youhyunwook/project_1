<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">

<head>
<link href="index.css" rel="stylesheet">
	<link href="carousel.css" rel="stylesheet">
	<link href="carousel.rtl.css" rel="stylesheet">
	<link rel="stylesheet" href="Announcement_style.css" />
	<title>BBA Main Page</title>
</head>

<body>
<!--네비게이션 바 로딩 -->    
<jsp:include page="NavBar.jsp" />
<!-- 네비게이션 바 로딩 -->

<!-- 메인 컨텐트 -->
<div id="main-content">

  <div id="myCarousel" class="carousel slide mb-6" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
      <div class="carousel-item active">
<svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" style="display: block;">
  <image href="img/mainAni1.jpg" width="100%" height="100%" preserveAspectRatio="xMidYMid slice" />
</svg>
        <div class="container">
          <div class="carousel-caption text-start">
            <h1>Example headline.</h1>
            <p class="opacity-75">Some representative placeholder content for the first slide of the carousel.</p>
            <p><a class="btn btn-lg btn-primary" href="#">Sign up today</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
       <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" style="display: block;">
  <image href="img/mainAni2.png" width="100%" height="100%" preserveAspectRatio="xMidYMid slice" />
</svg>
        <div class="container">
          <div class="carousel-caption">
            <h1>Another example headline.</h1>
            <p>Some representative placeholder content for the second slide of the carousel.</p>
            <p><a class="btn btn-lg btn-primary" href="#">Learn more</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
       <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" style="display: block;">
  <image href="img/mainAni3.jpg" width="100%" height="100%" preserveAspectRatio="xMidYMid slice" />
</svg>
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
        <h2 class="featurette-heading fw-normal lh-1">"데이터가 이끄는 제조 혁신"</span></h2>
        <p class="lead">데이터 분석을 통해 제조업체가 직면한 문제를 해결하고 혁신적인 솔루션을 제공합니다. 우리는 데이터를 기반으로 한 인사이트를 통해 고객이 새로운 기회를 발견하도록 돕습니다.</p>
      </div>
      <div class="col-md-5">
        <img src="img/test.jpg"/>
      </div>
    </div>

    <div class="row featurette" style="margin-bottom: 50px;">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading fw-normal lh-1" style=" white-space: nowrap;">"정확한 분석, 생산성을 극대화"</h2>
        <p class="lead">데이터 기반의 정확한 분석을 통해 제조 과정의 비효율성을 식별하고 개선합니다. 이를 통해 고객은 생산성을 높이고 비용을 절감하며, 지속 가능한 성장을 이룰 수 있습니다.</p>
      </div>
      <div class="col-md-5 order-md-1">
      	<img src="img/test.jpg"/>  
      </div>
    </div>

  

    <div class="row featurette" style="margin-bottom: 50px;">
      <div class="col-md-7">
        <h2 class="featurette-heading fw-normal lh-1">"스마트 제조, 데이터의 힘" </h2>
        <p class="lead">데이터의 힘으로 제조 과정을 스마트하게 변화시킵니다. 우리의 분석 솔루션은 실시간으로 데이터를 처리하여 고객이 변화하는 시장에 신속하게 대응할 수 있도록 지원합니다.</p>
      </div>
      <div class="col-md-5">
        <img src="img/test.jpg"/>
      </div>
    </div>

 

    <!-- /END THE FEATURETTES -->

  </div><!-- /.container -->


  <!-- FOOTER -->
  <footer style="background-color: black; border-radius: 5px; height:200px;">
    <p class="float-end" style="color: white;"><hr><hr><hr>
    <p style="color: white; text-align: center">&copy; (주)BBA데이터<br>
서울특별시 강남구 테헤란로 223 제일큰빌딩 전체 / 대표자 : 유현욱 / 사업자등록번호 : 111-11-1111 / 통신판매업 신고 : 2024-수원망포-12345<br>
/ Tel : 02-1111-1111 / Fax : 02-111-1111 / Email : evelth4@gmail.com / 채용문의 : evelth4@gmail.com<br>
©BBA Data Co. Ltd. All Rights Reserved. &middot; <br><a href="loginMain.jsp">Login</a>  | <a href="#" style="padding:10px;">Back to top</a></p>
  </footer>
</div>
<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    </body>
</html>
