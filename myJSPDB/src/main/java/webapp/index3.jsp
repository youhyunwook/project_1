<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="font.jsp"/>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">

<head>
    <link href="carousel.css" rel="stylesheet">
    <link href="carousel.rtl.css" rel="stylesheet">
    <link rel="stylesheet" href="Announcement_style.css" />
    <!-- 구글 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
    <!-- 구글 폰트 -->
    <title>BBA Main Page</title>
	
</head>
<body>
    <!-- 네비게이션 바 로딩 -->

    	<jsp:include page="NavBar.jsp" />
   
    <!-- 네비게이션 바 로딩 -->

    <!-- 메인 컨텐트 -->
    <div id="main" >
    <!-- --------------------------------------------------------- -->
        <div id="myCarousel" class="carousel slide mb-6" data-bs-ride="carousel" >
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner" style="height:850px;">
                <div class="carousel-item active">
                    <svg class="bd-placeholder-img" width="100%" height="850px" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" style="display: block;">
                        <image href="img/mainAni1.jpg" width="100%" height="100%" preserveAspectRatio="xMidYMid slice" />
                    </svg>
                    <div class="container">
                        <div class="carousel-caption text-start">
                            <h1>"정확한 분석, 생산성을 극대화"</h1>
                            <p class="opacity-75">데이터 기반의 정확한 분석을 통해 제조 과정의 비효율성을 식별하고 개선합니다. 이를 통해 고객은 생산성을 높이고 비용을 절감하며, 지속 가능한 성장을 이룰 수 있습니다.</p>
                            <p><a class="btn btn-lg btn-primary" href="#">Sign up today</a></p>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <svg class="bd-placeholder-img" width="100%" height="850px" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" style="display: block;">
                        <image href="img/mainAni2.png" width="100%" height="100%" preserveAspectRatio="xMidYMid slice" />
                    </svg>
                    <div class="container">
                        <div class="carousel-caption">
                            <h1>"데이터가 이끄는 제조 혁신"</h1>
                            <p>데이터 분석을 통해 제조업체가 직면한 문제를 해결하고 혁신적인 솔루션을 제공합니다. 우리는 데이터를 기반으로 한 인사이트를 통해 고객이 새로운 기회를 발견하도록 돕습니다.</p>
                            <p><a class="btn btn-lg btn-primary" href="#">Learn more</a></p>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <svg class="bd-placeholder-img" width="100%" height="850px" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" style="display: block;">
                        <image href="img/mainAni3.jpg" width="100%" height="100%" preserveAspectRatio="xMidYMid slice" />
                    </svg>
                    <div class="container">
                        <div class="carousel-caption text-end">
                            <h1>"스마트 제조, 데이터의 힘"</h1>
                            <p>데이터의 힘으로 제조 과정을 스마트하게 변화시킵니다. 우리의 분석 솔루션은 실시간으로 데이터를 처리하여 고객이 변화하는 시장에 신속하게 대응할 수 있도록 지원합니다.</p>
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
        <!-- --------------------------------------------------------- -->
       
        <div id="inc03">
		    <div class="tit" data-aos="fade-blur-left">
		        <p data-aos="fade-blur" data-aos-delay="200"><span>Company</span> Statistics</p>
		        <div class="pl">혁신적인 AI 스마트 분석으로 더 스마트한 미래를 경험하세요.<br>
		            우리의 기술이 새로운 삶의 방식을 열어줍니다.</div>
		    </div>
		    <ul class="cont" data-aos="line" data-aos-delay="600">
		        <li data-aos="fade-blur-right" data-aos-delay="600">
		            <span class="count" data-count="1256">0</span>
		            <p>Project</p>
		            <div class="pl">효율성과 정확성, 만족감 보장 위한 철저한 분석</div>
		        </li>
		        <li>
		            <span class="count" data-count="45">0</span>
		            <p>Experience Engineers</p>
		            <div class="pl">데이터타입, 공정에 따른 최적화된 분석전문가들 다수 구성</div>
		        </li>
		        <li>
		            <span class="count" data-count="120">0</span>
		            <p style="margin-bottom:-20px;">Active Field Service Engineer</p>
		            <div class="pl" style="margin-bottom:40px;">현장 유지보수 엔지니어 파견 철저한 사후 관리</div>
		        </li>
		    </ul>
		    <div class="bg" >
		        <span>B</span>
		        <span>B</span>
		        <span>A</span>
		    </div>
		</div>
		
        
        <!-- --------------------------------------------------------- -->
        <div class="video_sc" style="position: relative; width: 100%; height: 1000px;">
		    <video autoplay loop muted style="position: absolute; margin-top:-65px; top: 0; left: 0; width: 100%; height: 100%; object-fit: cover; z-index: -1;">
		        <source src="video/smart.mp4" type="video/mp4">
		    </video>
			<div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%) perspective(1000px); 
	             display: flex; 
	             justify-content: center; 
	             align-items: center; 
	             font-size: 50px; 
	             color: #00ffff; /* 기본 색상 */
	             text-shadow: 
	             0 0 5px rgba(0, 255, 255, 0.8), 
	             0 0 10px rgba(0, 255, 255, 0.6), 
	             0 0 15px rgba(0, 255, 255, 0.4), 
	             2px 2px 0 rgba(0, 200, 200, 0.7), 
	             4px 4px 0 rgba(0, 150, 150, 0.5), 
	             6px 6px 0 rgba(0, 100, 100, 0.3); /* 빛나는 효과 추가 */
	             animation: fadeIn 2s, bounce 2s infinite alternate;">
    			 <span style="white-space: nowrap; 
	                 display: inline-block; 
	                 transform: translateZ(20px); 
	                 font-weight: bold; 
	                 background: linear-gradient(135deg, rgba(0, 255, 255, 1), rgba(0, 100, 255, 1)); /* 그라데이션 */
	                 -webkit-background-clip: text; /* 텍스트에 배경 적용 */
	                 color: transparent;">제조공정의 혁신, 스마트 팩토리</span>
			</div>
		</div>
		<!-- --------------------------------------------------------- -->
		<div class="third" style="height: 100vh;">			
		    <div style="position: relative; width: 100%; height: 100%; display: flex; align-items: center; justify-content: space-between; padding: 20px;">
		        
		        <!-- 왼쪽 내용 -->
		        <div style="flex: 1; text-align: left; margin-left:100px;">
		            <p style="font-size: 50px; color:white;">AI 기술과 함께</p>
		            <p style="font-size: 50px; color:white;">정확한 데이터 분석을 통한 가치 창출의 기회</p>
		            <p style="font-size: 25px; color:white; margin-top:80px;">서로 상생하고 혁신적인 연구개발로 항상 최고의 솔루션을 제공합니다. </p>
		            <p style="font-size: 25px; color:white">데이터 분석의 힘과 가치를 탐구하세요!</p>
		        </div>
		
		        <!-- 버튼 부분 -->
		        <div style="display: flex; flex-direction: column; align-items: flex-end;">
		            <button class="third-hover-button" onclick="window.location.href='listPosts.jsp'">
		                <p>
		                    ［ 의 뢰 하 기 ］
		                    <svg class="feather feather-arrow-right" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="margin-left: 250px;">
		                        <line x1="5" y1="12" x2="19" y2="12"></line>
		                        <polyline points="12 5 19 12 12 19"></polyline>
		                    </svg>
		                </p>
		                <div style="display: flex; align-items: center;">
		                    <img src="img/hands.jpg" alt="Hands" style="margin-right: 20px;">
		                    <div>
		                        <p style="font-size: 20px; margin-left:20px;">"가치를 창출하는 분석"</p>
		                        <p style="font-size: 15px;">당신의 데이터를 가치로 바꿉니다.<br>데이터를 업로드하여 샘플 분석자료를<br> 받으세요.</p>
		                    </div>
		                </div>
		            </button>
		            <button class="third-hover-button2" onclick="window.location.href='QnA_main.jsp'">
		                <p>
		                    ［ 문 의 하 기 ］
		                    <svg class="feather feather-arrow-right" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="margin-left: 250px;">
		                        <line x1="5" y1="12" x2="19" y2="12"></line>
		                        <polyline points="12 5 19 12 12 19"></polyline>
		                    </svg>
		                </p>
		                <p style="font-size:20px; color:gray;"> " 모든 문의를 환영합니다. "</p>
		                <p style="font-size:30px; margin-top:-20px;"> 소중한 문의를 성실하게 답변해드립니다. </p>
		            </button>
		        </div>
		    </div>
		</div>

		         
	</div>
	
	
	<!-- /.container -->
        

		<!-- 슬라이더 -->
		<div class="slidershow" style="margin-top:-15px;">
		  <div class="logos"></div>
		  <div class="mask"></div>
		</div>
		
		<!-- 상단으로 가기 버튼 -->
		<div class="company-back-to-tabs">
			<img src="img/upPage.png" class="fixed-tab-buttons" onclick="goBackOrScrollToTop()" style="width: 50px; height:50px;">
		</div>

	<!-- 푸터 바 로딩 -->    
	<jsp:include page="Footer.jsp" />
	<!-- 푸터 바 로딩 --> 
	<!-- 숫자카운팅 스크립트 -->         
	<script>
	document.addEventListener("DOMContentLoaded", function () {
	    const counters = document.querySelectorAll('.count');

	    const startCounting = (counter) => {
	        const updateCount = () => {
	            const target = +counter.getAttribute('data-count');
	            const count = +counter.innerText;

	            const increment = target / 200; // 200번의 반복으로 나누어 증가

	            if (count < target) {
	                counter.innerText = Math.ceil(count + increment);
	                setTimeout(updateCount, 10); // 10ms마다 호출
	            } else {
	                counter.innerText = target; // 최종값 설정
	            }
	        };

	        updateCount();
	    };

	    const resetCounters = () => {
	        counters.forEach(counter => {
	            counter.innerText = '0'; // 초기화
	            startCounting(counter);
	        });
	    };

	    // 첫 번째 카운팅 시작
	    resetCounters();

	    // 카운팅을 일정 간격으로 반복 (예: 5초마다)
	    setInterval(resetCounters, 5000); // 5000ms (5초)마다 카운팅 초기화
	});
	
	// 상단으로 가기 버튼
    function goBackOrScrollToTop() {
    const currentSection = document.querySelector('.company-section:target');
       if (currentSection) {
           document.getElementById('company-tab-buttons').scrollIntoView({ behavior: 'smooth' });
       } else {
           window.scrollTo({ top: 0, behavior: 'smooth' });
       }
   }
	
    

	</script>
   </body>
</html>
