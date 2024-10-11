<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회사소개</title>
    <style>
    	
    	::-webkit-scrollbar {
        	display: none; /* 스크롤바 숨기기 */
    	}
        body {
            font-family: Arial, sans-serif;
        }
        .company-image-container {
            position: relative;
            width: 100%;
            height: 750px;
            overflow: hidden;
        }
        .company-image-container img {
            width: 100%;
            height: 750px;
            object-fit: cover;
        }
        .company-image-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            text-align: center;
            white-space: nowrap; /* 줄바꿈 방지 */
        }
        
		.company-tab-buttons {
		    position: absolute;
		    bottom: 20px;
		    left: 50%;
		    transform: translateX(-50%);
		    display: flex;
		    z-index: 10;
		}
		
		.company-tab-button {
		    background: none;
		    color: white; /* 기본 글자 색상 */
		    border: none;
		    padding: 10px 10px;
		    margin: 0 10px;
		    cursor: pointer;
		    font-weight: bold;
		    font-size: 20px;
		    position: relative;
		    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.8);
		    transition: color 0.3s, background-color 0.3s;
		}
		
		.company-tab-button:hover {
		    color: black; /* 글자 색상 검정으로 변경 */
		    background: linear-gradient(45deg, rgba(192, 192, 192, 0.8), rgba(255, 255, 255, 0.1)); /* 은색 배경 */
		    border-radius: 5px; /* 모서리를 둥글게 */
		}
		
		.company-tab-button:after {
		    content: '';
		    display: block;
		    width: 100%;
		    height: 3px;
		    background: #FFD700;
		    position: absolute;
		    left: 0;
		    bottom: -5px;
		    transform: scaleX(0);
		    transition: transform 0.3s;
		}
		
		.company-tab-button:hover:after {
		    transform: scaleX(1);
		}
	
		.company-section {
		    padding: 80px 50px 0px 50px; /* 위, 오른쪽, 아래, 왼쪽 패딩 설정 */
		    position: relative; /* 상대 위치 */    
		}
		
		.company-timeline {
		    display: flex; /* 플렉스 박스 사용 */
		    flex-direction: column; /* 세로 방향 정렬 */
		    justify-content: flex-start; /* 왼쪽 정렬 */
		    align-items: flex-start; /* 상단 정렬 */
		    padding: 20px 0; /* 패딩 설정 */
		    margin: 0 auto; /* 중앙 정렬 */
		    position: relative; /* 상대 위치 */
		}
		
		.company-timeline-item {
		    display: flex; /* 플렉스 박스 사용 */
		    flex-direction: row; /* 가로 방향 정렬 */
		    align-items: center; /* 수평 정렬 */
		    text-align: left; /* 텍스트 왼쪽 정렬 */
		    margin: 20px 0; /* 각 항목 간격 */
		    position: relative; /* 상대 위치 */    
		    transition: border-color 0.3s, box-shadow 0.3s, transform 0.3s; /* 애니메이션 추가 */
		}
		
		.company-timeline-item:hover {
		   transform: translateY(-5px); /* 위로 이동 효과 */
		}
		
		.company-timeline-content {
		    background-color: rgba(255, 255, 255, 0.5); /* 배경색 변경 */
		    padding: 15px; /* 패딩 설정 */
		    border-radius: 8px; /* 모서리 둥글게 */
		    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
		    transition: transform 0.3s, background-color 0.3s; /* 호버 시 애니메이션 추가 */
		    margin-left: 20px; /* 내용과 타임라인 항목 간격 */
		    height: 100px; /* 고정 높이 설정 */
		    width: 150px;
		}
		
		.company-timeline-item:hover .company-timeline-content {
		    transform: scale(1.05); /* 호버 시 확대 효과 */
		
		}
		
		.company-timeline-details {
		    display: flex; /* 플렉스 박스 사용 */
		    flex-direction: column; /* 세로 방향 정렬 */
		    margin-left: 20px; /* 오른쪽 여백 */
		}
		
		.timeline-line {
		    position: absolute;
		    left: 50%; /* 중앙 정렬 */
		    top: 20px; /* 타임라인 항목과 간격 */
		    width: 2px; /* 선 두께 */
		    height: calc(100% + 40px); /* 선 길이 조정 */
		    background-color: #007BFF; /* 선 색상 */
		    z-index: -1; /* 텍스트 뒤로 보내기 */
		}
		
		.company-timeline-item:first-child .timeline-line {
		    display: none; /* 첫 번째 항목은 선 숨기기 */
		}
		
		.BusinessAreasImg {
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    flex-wrap: wrap;
		}
		
		.BusinessCard {
		    position: relative;
		    width: 20%;
		    height: 500px;
		    overflow: hidden;
		}
		
		.BusinessCard img {
		    width: 100%;
		    height: 100%;
		    transition: transform 0.5s; /* 카드가 올라오는 효과 */
		}
		
		.BusinessCard:hover img {
		    transform: translateY(-10px); /* 위로 올라오는 효과 */
		}
		
		.BusinessOverlay {
		    position: absolute;
		    top: 0;
		    left: 0;
		    width: 100%;
		    height: 100%;
		    background-color: rgba(255, 255, 255, 0.8); /* 반투명 흰색 */
		    display: flex;
		    flex-direction: column;
		    justify-content: center;
		    align-items: center;
		    opacity: 0; /* 초기 상태에서 보이지 않음 */
		    transition: opacity 0.5s;
		}
		
		.BusinessCard:hover .BusinessOverlay {
		    opacity: 1; /* 호버 시 보이도록 설정 */
		}
		
		.BusinessText {
		    text-align: center;
		    font-size: 20px; /* 텍스트 크기 조정 */
		    position: absolute; /* 절대 위치 지정 */
		    top: 50%; /* 세로 중앙 */
		    left: 50%; /* 가로 중앙 */
		    transform: translate(-50%, -50%); /* 중앙으로 이동 */
		    z-index: 1; /* 텍스트가 버튼과 오버레이 위에 보이도록 설정 */
		}
		
		.BusinessButton {
		    margin-top: auto; /* 텍스트 아래로 버튼 위치 조정 */
		    background-color: #007bff; /* 버튼 배경색 */
		    color: white; /* 버튼 텍스트 색상 */
		    padding: 10px 20px; /* 버튼 패딩 */
		    text-decoration: none; /* 링크 스타일 제거 */
		    border-radius: 5px; /* 버튼 모서리 둥글게 */
		    opacity: 0; /* 초기 상태에서 보이지 않음 */
		    transition: opacity 0.5s;
		}
		
		.BusinessCard:hover .BusinessButton {
		    opacity: 1; /* 호버 시 버튼 보이도록 설정 */
		}
		
		}
		
		.fixed-tab-buttons {
		    position: fixed;
		    bottom: 20px; /* 원하는 하단 위치 */
		    right: 20px; /* 원하는 오른쪽 위치 */
		    z-index: 1000;
		    display: flex;	
		    background: none; /* 배경 없애기 */
		    border: none; /* 테두리 없애기 */
		    padding: 10px 20px; /* 여백 추가 */
		    border-radius: 5px; /* 둥근 모서리 */
		    cursor: pointer; /* 커서 모양 변경 */
		    transition: transform 0.3s ease, background-color 0.3s ease; /* 애니메이션 효과 */	   
		}
		
		}
		
		.fixed-tab-buttons:hover {
		    transform: scale(1.1); /* 마우스 오버 시 크기 확대 */
		    background-color: rgba(0, 0, 0, 0.1); /* 배경색 변경 */
		}
		
		.fixed-tab-buttons:active {
		    transform: scale(0.95); /* 클릭 시 크기 축소 */
		}

        .company-back-to-tabs {
		    position: fixed; /* 고정 위치 */
		    bottom: 20px; /* 하단 간격 */
		    right: 20px; /* 오른쪽 간격 */
		    z-index: 100; /* 다른 요소 위에 표시 */
		}
		
		#companyHistory {
		    /* background-image: url('img/bghistory2.jpg'); */
		    background-color: white;
		    background-blend-mode: overlay; /* 이미지와 배경색을 섞기 위한 설정 */
		    padding-top: 80px;
		    padding-bottom: 80px;
		    width: 100vw;
		    margin: 0;
		    position: relative;
		    left: 50%;
		    transform: translateX(-50%);
		}
		
		.BusinessText {
			font-size: 35px;
		}
		
		.BusinessAreasImg {
		    display: flex; /* 플렉스 박스로 카드들을 정렬 */
		    flex-wrap: wrap; /* 카드가 줄 바꿈 가능하도록 설정 */
		}
		
		.BusinessCard {
		    position: relative; /* 카드 내 요소의 위치 설정 */
		    margin: 10px; /* 카드 간 여백 */
		}
		
		.BusinessOverlay {
		    position: absolute; /* 이미지를 기준으로 절대 위치 설정 */
		    top: 0; /* 이미지 위쪽 */
		    left: 0; /* 이미지 왼쪽 */
		    width: 100%; /* 전체 너비 */
		    height: 100%; /* 전체 높이 */
		    display: flex; /* 내부 요소 정렬을 위한 플렉스 설정 */
		    flex-direction: column; /* 세로 방향 정렬 */
		    justify-content: center; /* 중앙 정렬 */
		    align-items: center; /* 중앙 정렬 */
		    background-color: rgba(255, 255, 255, 0.5); /* 반투명 배경 */
		    opacity: 0; /* 기본적으로 숨김 */
		    transition: opacity 0.3s; /* 부드러운 전환 효과 */
		}
		
		.BusinessCard:hover .BusinessOverlay {
		    opacity: 1; /* 호버 시 배경을 보이도록 설정 */
		}
		
		.BusinessText {
		    text-align: center; /* 텍스트 중앙 정렬 */
		    margin-bottom: 20px; /* 텍스트와 버튼 간격 */
		}
		
		.BusinessButton {
		    background-color: rgba(0, 255, 0, 0.8); /* 반투명 배경 */
		    padding: 10px 20px;
		    border: none;
		    cursor: pointer;
		    color:#000000;
		    transition: background-color 0.3s; /* 호버 효과를 위한 애니메이션 */
		}
		
		.BusinessButton:hover {
		    background-color: rgba(255, 255, 255, 1); /* 호버 시 배경색 변경 */
		    color:#000000;
		}
		
		.popup {
		    display: none; /* 기본적으로 숨김 */
		    position: fixed; /* 전체 화면을 덮도록 고정 */
		    top: 0; /* 화면 위쪽 */
		    left: 0; /* 화면 왼쪽 */
		    width: 100%; /* 전체 너비 */
		    height: 100%; /* 전체 높이 */
		    background-color: rgba(0, 0, 0, 0.7); /* 반투명 검정 배경 */
		    z-index: 1000; /* 다른 요소 위에 표시 */
		    justify-content: center; /* 수직 중앙 정렬 */
		    align-items: center; /* 수평 중앙 정렬 */
		}
		
		.popup-content {
		    background-color: white; /* 팝업 내부 배경색 */
		    padding: 20px;
		    border-radius: 5px;
		    text-align: center; /* 텍스트 중앙 정렬 */
		    max-width: 600px; /* 팝업 최대 너비 */
		    width: 90%; /* 팝업 너비 */
		    font-size: 20px;
		}
		

    </style>
</head>
<body>
<!-- 네비게이션 바 로딩 -->    
<jsp:include page="NavBar.jsp" />
<!-- 네비게이션 바 로딩 -->

<div class="company-image-container">
	<img src="img/companyInfo.png" alt="회사소개" />
    <div class="company-image-text">
	    <div style="font-size: 30px;">About. (주)BBA데이터</div>
	    <div style="font-size: 65px; ">"데이터 분석, 혁신의 만남"</div>
	    <p style="text-align: center;">
            <hr style="width: 700px; border: 2px solid white; margin: auto;">
        </p>
	    <div style="font-size: 20px;">통찰력을 제공하는 데이터 분석 파트너로 소중한 기업의 성공을 이끕니다.</div>
	</div>
    <div class="company-tab-buttons" id="company-tab-buttons">
        <button class="company-tab-button" onclick="scrollToSection('companyOverview')">회사 개요</button>
        <button class="company-tab-button" onclick="scrollToSection('companyHistory')">연 혁</button>
        <button class="company-tab-button" onclick="scrollToSection('companyBusinessAreas')">사업 분야</button>
        <button class="company-tab-button" onclick="scrollToSection('companySuccessCases')">인재 채용</button>
        <button class="company-tab-button" onclick="scrollToSection('companySuccessCases')">오시는 길</button>
    </div>
</div>
<!-- 회사 개요 -->
<div id="companyOverview" class="company-section" style="background-color: #000000;">
    <h1 style="font-size: 50px; color: #ffffff; text-align: center; font-weight: bold; ">회사 소개</h1>
    	<p style="text-align: center;">
			<hr style="width: 30px; border: 2px solid #ffffff; margin: auto;"/>
		</p>
    	<div style="text-align: center; font-size: 24px; color: #333; margin-top: 50px;">
		    <p style="font-size: 20px; color: #333;">G R E E T I N G ㆍ</p>
		    <p style="font-weight: bold; margin-top: 20px;">급변하는 SmartAI 시대,</p>
		    <p style="font-weight: bold; font-size: 28px; color: #00FF00; margin-top: 2px;">BBA 데이터와 함께 미래를 만들어갑니다.</p>
		    <p style="margin-top: 2px;">데이터 분석의 힘으로 혁신을 선도하며, 함께 성장하는 길에 여러분을 초대합니다.</p>
		</div>

    <h1 style="font-size: 36px; color: #000; text-align: center; font-weight: bold;">
        <img src="img/companyMain2.jpg" alt="Company Logo" style="width: 1000px; height: 500px; margin-bottom: 80px;">
    </h1>

    
	<!-- 회사 비전 -->
	<div style="background-color: #000000; padding-top: 100px; padding-bottom: 100px; width: 100vw; margin: 0; position: relative; left: 50%; transform: translateX(-50%);"> 
	    <h2 style="font-size: 30px; color: #ffffff; text-align: center; margin-top: 0; font-weight: bold;">회사 비전</h2>
	    <p style="text-align: center;">
	        <hr style="width: 30px; border: 2px solid #ffffff; margin: auto;">
	    </p>
	    <p style="font-size: 25px; text-align: center; color: #333; font-weight: bold;">"데이터로 연결된 미래, 제조업의 혁신을 선도합니다."<br> BBA Data는 데이터를 기반으로 제조 공정을 혁신하고, 고객의 요구에 부응하는 스마트 솔루션을 제공함으로써 글로벌 제조업계를 선도하는 기업으로 성장할 것입니다.</p>
	    
	    <!-- 이미지 추가 부분 -->
	    <div style="display: flex; justify-content: center; margin-top: 20px;">
	        <img src="img/manufacture.png" alt="Left Image" style="width: 30%; margin: 0 5px;">
	        <img src="img/dataAnalysis.png" alt="Center Image" style="width: 30%; margin: 0 5px;">
	        <img src="img/quarity.png" alt="Right Image" style="width: 30%; margin: 0 5px;">
	    </div>
	    
	    <div style="display: flex; justify-content: space-around; margin-top: 20px;">
		    <div style="text-align: center; flex: 1; margin: 0 10px;">
		        <h2 style="font-size: 28px; color: #5B3A29; font-weight: bold;">스마트 제조 솔루션</h2>
		        <p style="text-align: center;">
		            <hr style="width: 30px; border: 2px solid #000; margin: auto;">
		        </p>
		        <p style="font-size: 20px; line-height: 1.6; color: #555; font-weight: bold; width: 400px; margin: 0 auto; text-align: center;">BBA Data는 제조 공정의 자동화 및 데이터 분석을 통해 스마트 제조 솔루션을 제공합니다.</p>
		    </div>
		    <div style="text-align: center; flex: 1; margin: 0 10px;">
		        <h2 style="font-size: 28px; color: #5B3A29; font-weight: bold;">효율성 극대화</h2>
		        <p style="text-align: center;">
		            <hr style="width: 30px; border: 2px solid #000; margin: auto;">
		        </p>
		        <p style="font-size: 20px; line-height: 1.6; color: #555; font-weight: bold; width: 400px; margin: 0 auto; text-align: center;">우리는 첨단 기술을 활용하여 제조 공장의 효율성을<br> 극대화하고, 품질 향상 및 오류율 감소를 실현하는 데<br> 주력합니다.</p>
		    </div>
		    <div style="text-align: center; flex: 1; margin: 0 10px; margin-bottom: 50px;">
		        <h2 style="font-size: 28px; color: #5B3A29; font-weight: bold;">경쟁력 있는 시장 지원</h2>
		        <p style="text-align: center;">
		            <hr style="width: 30px; border: 2px solid #000; margin: auto;">
		        </p>
		        <p style="font-size: 20px; line-height: 1.6; color: #555; font-weight: bold; width: 400px; margin: 0 auto; text-align: center;">우리의 솔루션은 기업들이 더욱 경쟁력 있는 시장에서<br> 성공할 수 있도록 지원합니다.</p>
		    </div>
		</div>
	</div>

	<!-- 핵심 가치  -->
	<div style="background-color: #000000; padding-top: 80px; padding-bottom: 80px; margin: 20px 0;">
	    <h2 style="font-size: 30px; color: #ffffff; text-align: center; margin-top: 0; font-weight: bold;">핵심 가치</h2>
	    <p style="text-align: center;">
	        <hr style="width: 30px; border: 2px solid #ffffff; margin: auto;">
	    </p>
	    <p style="font-size: 25px; text-align: center; color: #333; font-weight: bold;">"데이터로 연결된 미래, 제조업의 혁신을 선도합니다."<br> BBA Data는 데이터를 기반으로 제조 공정을 혁신하고, 고객의 요구에 부응하는 스마트 솔루션을 제공함으로써 글로벌 제조업계를 선도하는 기업으로 성장할 것입니다.</p>
	    
	    <!-- 이미지 추가 부분 -->
	    <div style="display: flex; justify-content: center; margin-top: 20px;">
	        <div style="text-align: center; margin: 0 10px;"> <!-- 이미지 사이에 20px 여백 추가 -->
	            <img src="img/sang.png" alt="상생 이미지" style="width: 350px; height: 300px;">
	            <p style="font-size: 25px; font-weight: bold; margin-top: 10px;">상생</p>
	            <p style="font-size: 16px; color: #555; width:350px;">우리는 고객, 직원, 파트너와 함께 성장하는 기업이 되기를 지향합니다.</p>
	        </div>
	        <div style="text-align: center; margin: 0 10px;">    
	        	<p style="font-size: 25px; font-weight: bold; margin-top: 10px;">혁신</p>
	            <p style="font-size: 16px; color: #555; width:350px;">지속적인 연구개발과 기술 혁신을 통해 시장의 변화를 선도하며, 고객에게 최상의 솔루션을 제공합니다.</p>        
	            <img src="img/revolu.png" alt="혁신 이미지" style="width: 350px; height: 300px;">            
	        </div>
	        <div style="text-align: center; margin: 0 10px;">
	            <img src="img/improv.png" alt="품질 이미지" style="width: 350px; height: 300px;">
	            <p style="font-size: 25px; font-weight: bold; margin-top: 10px;">품질</p>
	            <p style="font-size: 16px; color: #555; width:350px;">모든 제품과 서비스에서 높은 품질 기준을 유지하며, 고객의 기대를 초과하는 결과를 제공합니다.</p>
	        </div>
	    </div>
	</div>


	<!-- 회사연혁 -->
	<div id="companyHistory" class="company-section" style="/* background-image: url('img/bghistory2.jpg'); */  padding-top: 80px; padding-bottom: 80px; width: 100vw; margin: 0; position: relative; left: 50%; transform: translateX(-50%);">
	    <h1 style="font-size: 50px; color: #000; text-align: center; font-weight: bold;">회사연혁</h1>
	    <p style="text-align: center;">
			<hr style="width: 30px; border: 2px solid #000000; margin: auto;"/>
		</p>
	    <div class="company-introduction" style="text-align: left; margin-left: 80px;">
	    	<p style="font-size: 20px; color: #333; margin-top: 50px;">H I S T O R Y ㆍ</p>
	        <p style="font-size: 30px; color: #808080; margin-top: 50px; margin-bottom:1px;">지금의 저희가 나아온 길,</p>
	        <p style="font-size: 30px; color: #333; "><b style="font-size: 38px;">더 높은 곳을 향해 나아가는 (주)BBA데이터</b>가 되겠습니다.</p>
	    </div>
	    <div class="company-timeline">
	        <div class="company-timeline-item">
	            <div class="company-timeline-content" style="font-weight: bold; margin-left: 80px;">
	                <p>회사 설립</p>
	            </div>
	            <div class="company-timeline-details" style="padding-left: 50px;">
	                <p>2024년</p>
	                <p>9월 5일 회사 창단 및 설립</p>
	            </div>
	        </div>
	        <div class="company-timeline-item">
	            <div class="company-timeline-content" style="font-weight: bold; margin-left: 80px;">
	                <p>(주)BBA 등록</p>
	            </div>
	            <div class="company-timeline-details" style="padding-left: 50px;">
	                <p>2024년</p>
	                <p>9월 10일 (주)BBA데이터 업체 등록</p>
	            </div>
	        </div>
	        <div class="company-timeline-item">
	            <div class="company-timeline-content" style="font-weight: bold; margin-left: 80px;">
	                <p>웹서비스 시작</p>
	            </div>
	            <div class="company-timeline-details" style="padding-left: 50px;">
	                <p>2024년</p>
	                <p>9월 20일 (주)BBA데이터 홈페이지 무료 데이터 분석 시작</p>
	                <p>의류, 화장품 등 스마트 제조공장의 AI 데이터 분석을 통한 성공사례 도입(XX샵 의류공장, XXX퍼시픽, XX콜라 등)</p>
	            </div>
	        </div>
	    </div>
	</div>
	
	<!-- 사업분야 -->
	<div id="companyBusinessAreas" style="padding-top: 80px; padding-bottom: 80px; width: 100vw; margin: 0; position: relative; left: 50%; transform: translateX(-50%);">
	    <h1 style="font-size: 50px; color: #ffffff; text-align: center; font-weight: bold;">사업 분야</h1>
	    <p style="text-align: center;">
	        <hr style="width: 30px; border: 2px solid #ffffff; margin: auto;"/>
	    </p>
	    <div class="BusinessAreasImg" style="margin-top:80px;">
	        <div class="BusinessCard">
	            <img src="img/clothes_cosmatics.png" style="width:100%; height: 500px;" loading="lazy">
	            <div class="BusinessOverlay">
	                <div class="BusinessText">제조 데이터 분석</div>
	                <a href="javascript:void(0);" class="BusinessButton" onclick="togglePopup('popup1')">자세히 보기</a>
	            </div>
	            <div class="popup" id="popup1">
	                <div class="popup-content">
	                    <table style="width: 100%; border-collapse: collapse;">
	                        <tr>
	                            <td style="border: 1px solid #ccc; padding: 10px;">품질 관리 및 결함 분석</td>
	                        </tr>
	                        <tr>
	                            <td style="border: 1px solid #ccc; padding: 10px;">생산 공정 최적화</td>
	                        </tr>
	                        <tr>
	                            <td style="border: 1px solid #ccc; padding: 10px;">원자재 품질 분석</td>
	                        </tr>
	                        <tr>
	                            <td style="border: 1px solid #ccc; padding: 10px;">소비자 피드백 및 트렌드 분석</td>
	                        </tr>
	                    </table>
	                    <button class="BusinessButton" onclick="togglePopup('popup1')">닫기</button>
	                </div>
	            </div>
	        </div>
	
	        <div class="BusinessCard">
	            <img src="img/data_solution.jpg" style="width:100%; height: 500px;" loading="lazy">
	            <div class="BusinessOverlay">
	                <div class="BusinessText">빅데이터 기반 <br>맞춤 솔루션</div>
	                <a href="javascript:void(0);" class="BusinessButton" onclick="togglePopup('popup2')">자세히 보기</a>
	            </div>
	            <div class="popup" id="popup2">
	                <div class="popup-content">
	                    <table style="width: 100%; border-collapse: collapse;">
	                        <tr>
	                            <td style="border: 1px solid #ccc; padding: 10px;">맞춤형 알고리즘 사용</td>
	                        </tr>
	                        <tr>
	                            <td style="border: 1px solid #ccc; padding: 10px;">예측 모델링</td>
	                        </tr>
	                        <tr>
	                            <td style="border: 1px solid #ccc; padding: 10px;">제품 예측 시스템 도입</td>
	                        </tr>
	                        <tr>
	                            <td style="border: 1px solid #ccc; padding: 10px;">산업별 맞춤 데이터 분석 및 트렌드 분석을 통한 혁신 지원</td>
	                        </tr>
	                    </table>
	                    <button class="BusinessButton" onclick="togglePopup('popup2')">닫기</button>
	                </div>
	            </div>
	        </div>
	
	        <div class="BusinessCard">
	            <img src="img/DBserver.jpg" style="width:100%; height: 500px;" loading="lazy">
	            <div class="BusinessOverlay">
	                <div class="BusinessText">데이터 서버<br> 통합 관리</div>
	                <a href="javascript:void(0);" class="BusinessButton" onclick="togglePopup('popup3')">자세히 보기</a>
	            </div>
	            <div class="popup" id="popup3">
	                <div class="popup-content">
	                    <table style="width: 100%; border-collapse: collapse;">
	                        <tr>
	                            <td style="border: 1px solid #ccc; padding: 10px;">통합 데이터 관리로 과정 변경 시 즉시 적용 가능</td>
	                        </tr>
	                        <tr>
	                            <td style="border: 1px solid #ccc; padding: 10px;">데이터 수집 및 정제 서비스 제공</td>
	                        </tr>
	                        <tr>
	                            <td style="border: 1px solid #ccc; padding: 10px;">다양한 데이터 소스 통합 관리</td>
	                        </tr>
	                    </table>
	                    <button class="BusinessButton" onclick="togglePopup('popup3')">닫기</button>
	                </div>
	            </div>
	        </div>
	
	        <div class="BusinessCard">
	            <img src="img/successCase.jpg" style="width:100%; height: 500px;" loading="lazy">
	            <div class="BusinessOverlay">
	                <div class="BusinessText">성공 사례</div>
	                <a href="javascript:void(0);" class="BusinessButton" onclick="togglePopup('popup4')">자세히 보기</a>
	            </div>
	            <div class="popup" id="popup4">
	                <div class="popup-content">
	                    <table style="width: 100%; border-collapse: collapse;">
	                        <tr>
	                            <td style="border: 1px solid #ccc; padding: 10px;">코카X라 캔 제조 공장 품질 향상: 0.2% 낮은 오류</td>
	                        </tr>
	                        <tr>
	                            <td style="border: 1px solid #ccc; padding: 10px;">공장 폐기율 기존 0.6% -> 0.2% 하향 조정</td>
	                        </tr>
	                        <tr>
	                            <td style="border: 1px solid #ccc; padding: 10px;">조X샵 의류 제조 공정 품질 향상 : 염색 공정 품질 향상</td>
	                        </tr>
	                        <tr>
	                            <td style="border: 1px solid #ccc; padding: 10px;">SmartFarm 재배시설 온/습도 데이터 채집 및 분석 : 고사율 ↓</td>
	                        </tr>
	                    </table>
	                    <button onclick="togglePopup('popup4')">닫기</button>
	                </div>
	            </div>
	        </div>
	    </div>
	</div> 


	<!-- 오시는 길 -->
	<div id="companySuccessCases" class="company-section" style="background-color: #f5f5f5; padding-top: 80px; width: 100vw; margin: 0; position: relative; left: 50%; transform: translateX(-50%);">
	    <h1 style="font-size: 50px; color: #000; text-align: center; font-weight: bold;">오시는 길</h1>
	    	<p style="text-align: center;">
			    <hr style="width: 30px; border: 2px solid #000000; margin: auto;">
			</p>
	    <p style="text-align:center; font-size: 20px; color: #333; margin-top: 50px;">A D D R E S Sㆍ</p>
	    <p style="text-align:center; font-size: 20px; color: #333;">서울특별시 강남구 테헤란로 제일 큰 빌딩</p>    
	    <div style="text-align: center; padding-bottom:50px;">
	        <iframe 
	            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d12660.634278927739!2d127.03704767310444!3d37.504178052874394!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca405861e4a67%3A0x73ec1c047764908!2z7ISc7Jq47Yq567OE7IucIOqwleuCqOq1rCDthYztl6TrnoDroZw!5e0!3m2!1sko!2skr!4v1727103890300!5m2!1sko!2skr" 
	            width="1000" 
	            height="550" 
	            style="border:0;" 
	            allowfullscreen="" 
	            loading="lazy"></iframe>
	    </div>
	</div>

	<!-- 상단으로 가기 버튼 -->
	<div class="company-back-to-tabs">
		<img src="img/upPage.png" class="fixed-tab-buttons" onclick="goBackOrScrollToTop()" style="width: 50px; height:50px;">
	</div>

</div>
<!-- 푸터 바 로딩 -->    
<jsp:include page="Footer.jsp" />
<!-- 푸터 바 로딩 -->
<script>
    function scrollToSection(id) {
        const section = document.getElementById(id);
        if (section) {
            section.scrollIntoView({ behavior: 'smooth' });
        }
    }
    
    // 상단으로 가기 버튼
     function goBackOrScrollToTop() {
     const currentSection = document.querySelector('.company-section:target');
        if (currentSection) {
            document.getElementById('company-tab-buttons').scrollIntoView({ behavior: 'smooth' });
        } else {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }
    }
    
    // 팝업 띄우기
    function togglePopup(popupId) {
	    const popup = document.getElementById(popupId);
	    popup.style.display = popup.style.display === 'none' || popup.style.display === '' ? 'flex' : 'none';
	}

</script>
</body>

</html>
