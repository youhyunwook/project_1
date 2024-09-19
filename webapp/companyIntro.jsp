<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- Google Tag Manager (noscript) -->
    <noscript>
        <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-TBX2LS95"
            height="0" width="0" style="display: none; visibility: hidden"></iframe>
    </noscript>
    <!-- End Google Tag Manager (noscript) -->

    <div class="loading-wrap" style="display: none;">
        <div class="spinner-border text-light"></div>
    </div>
    <div class="wrapper">
        <!-- header -->
        








<script type="text/javascript">
    $(document).ready(function() {
        let url = $(location).attr('pathname');
        $("#header").removeClass("visual");

        if (url.indexOf("/index") == 0) {
            $("#header").addClass("visual");
        }
        changeStyle();
    });

    function gotoContact() {
        $("#mainMenuOpen").click();
        return gtag_report_conversion('/company/main#contactUs');
    }

    function changeStyle() {
        let lang = 'KOR';
        if (lang == 'ENG') {
            document.querySelector('html').classList.add('eng');
            document.querySelector('#engBtn').style.display = "none";
        } else {
            document.querySelector('html').classList.remove('eng');
            document.querySelector('#korBtn').style.display = "none";
        }
    }
</script>
<header class="header" id="header" style="transform: translateY(0px);">
    <div class="inner">
        <h1 class="logo">
            <a href="/index"> <span class="a11y-hidden">infiniq</span></a>
        </h1>
        <nav class="gnb">
            <ul class="gnb_list">
                <li class="gnb_item lnb">
                    <div class="gnb_block">
                        <a href="/business/driving" class="gnb_link">Business</a>
                        <button type="button" class="gnb_link mo">Business</button>
                        <ul class="lnb_list">
                            <li class="lnb_item"><a href="/business/driving" class="lnb_link">자율주행</a></li>
                            <li class="lnb_item"><a href="/business/autoCalibration" class="lnb_link">오토 캘리브레이션</a></li>
                            <li class="lnb_item"><a href="/business/aetem" class="lnb_link">AETEM(국방)</a></li>
                            <li class="lnb_item"><a href="/business/aistudio" class="lnb_link">AI-STUDIO</a></li>
                            <li class="lnb_item"><a href="/business/heidi" class="lnb_link">HEIDI-AI</a></li>
                            <li class="lnb_item"><a href="/business/testingService" class="lnb_link">Testing Service</a></li>
                        </ul>
                    </div>
                </li>
                <li class="gnb_item lnb">
                 <div class="gnb_block">
                    <a href="/company/info" class="gnb_link">Company</a>
                    <button type="button" class="gnb_link mo">Company</button>
                    <ul class="lnb_list">
                        <li class="lnb_item"><a href="/company/info" class="lnb_link">
                            회사소개</a>
                        </li>
                        <li class="lnb_item"><a href="/company/historyAndawards" class="lnb_link">
                            연혁 및 수상</a>
                        </li>
                        <li class="lnb_item"><a href="/company/patents" class="lnb_link">
                            특허</a>
                        </li>
                        <li class="lnb_item"><a href="/company/ci" class="lnb_link">
                            CI 소개</a>
                        </li>
                    </ul>
                </div>
                </li>
                <li class="gnb_item">
                    <div class="gnb_block">
                        <a href="/news/main" class="gnb_link">News</a>
                    </div>
                </li>
                <li class="gnb_item">
                    <div class="gnb_block">
                        <a href="/contactUs/main" class="gnb_link">Contact us</a>
                    </div>
                </li>
                
                <li class="gnb_item">
                    <div class="gnb_block">
                        <a href="/openDataset/main" class="gnb_link">Open Dataset</a>
                    </div>
                </li>
                
            </ul>
        </nav>
        <div class="langs">
            <button type="button" class="langs-btn">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none">
                            <path d="M9.99 0C4.47 0 0 4.48 0 10C0 15.52 4.47 20 9.99 20C15.52 20 20 15.52 20 10C20 4.48 15.52 0 9.99 0ZM16.92 6H13.97C13.65 4.75 13.19 3.55 12.59 2.44C14.43 3.07 15.96 4.35 16.92 6ZM10 2.04C10.83 3.24 11.48 4.57 11.91 6H8.09C8.52 4.57 9.17 3.24 10 2.04ZM2.26 12C2.1 11.36 2 10.69 2 10C2 9.31 2.1 8.64 2.26 8H5.64C5.56 8.66 5.5 9.32 5.5 10C5.5 10.68 5.56 11.34 5.64 12H2.26ZM3.08 14H6.03C6.35 15.25 6.81 16.45 7.41 17.56C5.57 16.93 4.04 15.66 3.08 14ZM6.03 6H3.08C4.04 4.34 5.57 3.07 7.41 2.44C6.81 3.55 6.35 4.75 6.03 6ZM10 17.96C9.17 16.76 8.52 15.43 8.09 14H11.91C11.48 15.43 10.83 16.76 10 17.96ZM12.34 12H7.66C7.57 11.34 7.5 10.68 7.5 10C7.5 9.32 7.57 8.65 7.66 8H12.34C12.43 8.65 12.5 9.32 12.5 10C12.5 10.68 12.43 11.34 12.34 12ZM12.59 17.56C13.19 16.45 13.65 15.25 13.97 14H16.92C15.96 15.65 14.43 16.93 12.59 17.56ZM14.36 12C14.44 11.34 14.5 10.68 14.5 10C14.5 9.32 14.44 8.66 14.36 8H17.74C17.9 8.64 18 9.31 18 10C18 10.69 17.9 11.36 17.74 12H14.36Z" fill="white"></path>
                        </svg>
                KOR
            </button>
            <ul class="langs_list">
                <li class="langs_item" id="engBtn"><a href="#" onclick="_ai.util.changeLocale('en');return false;">ENG</a></li>
                <li class="langs_item" id="korBtn" style="display: none;"><a href="#" onclick="_ai.util.changeLocale('ko');return false;">KOR</a></li>
            </ul>
        </div>
        <button class="hamburger-btn">
            <i class="line"></i> <i class="line"></i> <i class="line"></i> <span class="blind">모바일 햄버거버튼</span>
        </button>
    </div>
</header>

        <!--// header -->

        <!-- main -->
        







<main class="main introduction">
  <section class="visual-area">
      <div class="inner">
          <h2 class="h2-title">회사소개</h2>
      </div>
  </section>

  <section class="introduction_intro">
      <div class="inner">
          <div class="flex-box">
              <div class="title-box">
                  <div>
                      <span class="sub-title">WHO WE ARE</span>
                      <h2 class="h2-title">인피닉은 인공지능 플랫폼<br> 전문기업 입니다.</h2>
                  </div>
                  <p class="text">인피닉은 다양한 산업분야에서 AI 데이터,<br>AI 모델 및 AI 서비스를 제공하고 있습니다.</p>
              </div>
              <ul class="widget-group">
                  <li class="stats-widget">
                      <i class="stats-icon"></i>
                      <span class="stats-number"><em class="point">+</em>110</span>
                      <span class="stats-label">고객사</span>
                  </li>
                  <li class="stats-widget">
                      <i class="stats-icon"></i>
                      <span class="stats-number" id="patentsNumber">120</span>
                      <span class="stats-label">특허 수</span>
                  </li>
                  <li class="stats-widget">
                      <i class="stats-icon"></i>
                      <span class="stats-number" id="AwardsNumber">29</span>
                      <span class="stats-label">수상</span>
                  </li>
              </ul>
          </div>
      </div>
  </section>

  <section class="introduction_business">
      <div class="inner">
          <div class="title-box">
              <div>
                  <span class="sub-title">OUR BUSINESS</span>
                  <h2 class="h2-title">Accelerating AI Creation</h2>
              </div>
              <p class="text">우리의 기술을 통해 인공지능이 더 편리하고 안전하게 사용될 수 있는 세상을 꿈꿉니다.</p>
          </div>
          <ul class="card-list">
              <li class="card-item">
                  <div class="title-box">
                      <span class="card-tit">자율주행</span>
                      <p class="text">자율주행 개발을 위한 고품질의<br>데이터 토탈 서비스를 제공합니다.</p>
                  </div>
                  <a href="/business/driving" class="btn-more">자세히 보기</a>
              </li>
              <li class="card-item">
                  <div class="title-box">
                      <span class="card-tit">오토 캘리브레이션</span>
                      <p class="text">전문가의 도움 없이 AI 기반 임베디드<br>시스템으로 정확하고 효율적인 캘리브레이션을 제공합니다.</p>
                  </div>
                  <a href="/business/autoCalibration" class="btn-more">자세히 보기</a>
              </li>
              <li class="card-item">
                  <div class="title-box">
                      <span class="card-tit">AETEM(국방)</span>
                      <p class="text">AETEM은 무기체계에서 활용가능한<br>최적의 의사결정을 할 수 있도록 지원하는 시스템입니다.</p>
                  </div>
                  <a href="/business/aetem" class="btn-more">자세히 보기</a>
              </li>
              <li class="card-item">
                  <div class="title-box">
                      <span class="card-tit">AI-Studio</span>
                      <p class="text">AI 서비스를 위한 다양한 프로세스를<br>하나의 플랫폼으로 지원합니다.</p>
                  </div>
                  <a href="/business/aistudio" class="btn-more">자세히 보기</a>
              </li>
              <li class="card-item">
                  <div class="title-box">
                      <span class="card-tit">HEIDI-AI</span>
                      <p class="text">개인정보 보호부터 오브젝트 검색과<br>군중난류 위험 분석이 가능한 AI 통합 모니터링 솔루션입니다.</p>
                  </div>
                  <a href="/business/heidi" class="btn-more">자세히 보기</a>
              </li>
              <li class="card-item">
                  <div class="title-box">
                      <span class="card-tit">Testing Service</span>
                      <p class="text">체계적인 시스템 운영과 차별화된<br>품질검증(QA) 서비스를 제공합니다.</p>
                  </div>
                  <a href="/business/testingService" class="btn-more">자세히 보기</a>
              </li>
          </ul>
      </div>
  </section>

  <section class="introduction_partners">
      <div class="inner">
          <div class="title-box">
              <div>
                  <span class="sub-title">OUR PARTNERS</span>
                  <h2 class="h2-title">고객사</h2>
              </div>
          </div>
          <div class="partner-wrap">
              <ul class="partner-list">
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">한국데이터산업진흥원</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">서울산업진흥원</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">중소기업기술정보진흥원</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">한국교통안전공단</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">대구경북과학기술원</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">nipa</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">NIA</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">정보통신기술진흥센터</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">GIST</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">KATECH</span>
                      </span>
                  </li>
              </ul>
              <ul class="partner-list">
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">HYUNDAI</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">HYUNDAI MOBIS</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">HYUNDAI AutoEver</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">Qualcomm</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">LG</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">SAMSUNG</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">SK</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">Murata</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">SL</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">Spring Cloud</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">42dot</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">STRADVISION</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">CUBOX</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">LOTTE</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">SCATTER LAB</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">NC</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">TELSTAR</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">noul</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">NUVILAB</span>
                      </span>
                  </li>
                  <li class="partner-item">
                      <span class="partner-logo">
                          <span class="blind">beyless</span>
                      </span>
                  </li>
              </ul>
          </div>
      </div>
  </section>

  <section class="introduction_network">
      <div class="inner">
          <div class="title-box">
              <div>
                  <span class="sub-title">OUR NETWORK</span>
                  <h2 class="h2-title">지사 소개</h2>
              </div>
          </div>
          <figure class="img-box"></figure>
      </div>
  </section>

  <section class="introduction_quicklinks">
      <div class="inner">
          <div class="title-box">
              <div>
                  <h2 class="h2-title">바로가기</h2>
              </div>
          </div>
          <ul class="box-list">
              <li class="box-item">
                  <span class="tit">연혁 및 수상</span>
                  <a href="/company/historyAndawards" class="btn-arrow"></a>
              </li>
              <li class="box-item">
                  <span class="tit">특허</span>
                  <a href="/company/patents" class="btn-arrow"></a>
              </li>
              <li class="box-item">
                  <span class="tit">CI 소개</span>
                  <a href="/company/ci" class="btn-arrow"></a>
              </li>
          </ul>
      </div>
  </section>
</main>
<script>
$(document).ready(function () {
    $("#patentsNumber").text(120);
    $("#AwardsNumber").text(29);
});
</script>
        <!-- // main -->

        <!-- footer -->
        








<footer class="footer">
    <div class="inner">
        <div class="footer_top">
            <h3 class="footer_logo">
                <span class="blind">INFINIQ</span>
            </h3>
            <div class="address">
                <address><em>HQ</em>서울시 금천구 가산디지털1로 186, 제이플라츠 701호</address>
                <address><em>AI LAB</em>서울 강남구 영동대로96길 20 대화빌딩 2층</address>
                <address><em>USA</em>3003 NORTH 1ST STREET, #221, SAN JOSE, CA 95134</address>
                <address><em>Vietnam</em>INFINIQ Building, Lot 2C1, 137 P. Mạc Thái Tông, Trung Hoà, Cầu Giấy, Hà Nội</address>
            </div>
            <div class="sns">
                <a href="https://blog.naver.com/bt_infiniq" title="blog" class="sns_item"><span class="blind">blog</span></a>
                <a href="https://www.facebook.com/infiniqko" title="facebook" class="sns_item"><span class="blind">facebook</span></a>
                <a href="https://www.instagram.com/infiniq.official/" title="instagram" class="sns_item"><span class="blind">instagram</span></a>
                <a href="https://www.linkedin.com/company/infiniq-inc" title="linkedin" class="sns_item"><span class="blind">linkedin</span></a>
            </div>
            <div class="familysite">
                <button type="button" class="familysite-btn">FAMILY SITE</button>
                <ul>
                    <li>
                    	
                    		
			                    <a href="https://www.ai-studio.co.kr?lang=ko" target="_blank">AI-STUDIO</a>                    		
                    		
                    		
                    	
                    </li>
                    <li>
                    	
                    		
			                    <a href="https://heidi-ai.com/" target="_blank">HEIDI-AI</a>                    		
                    		
                    		
                    	
                    </li>
                    <li><a href="https://www.labfinder.co.kr/" target="_blank">Lab Finder</a></li>
                </ul>
            </div>
        </div>
        <div class="footer_bottom">
            <div class="privacypolicy">
                <a href="/privacy">개인정보 처리방침</a>
            </div>
            <div class="copyright">COPYRIGHT 2023 Ⓒ INFINIQ.ALL RIGHTS RESERVED</div>
            <div class="footer_contactus">
                <div>
                    <span>사업 문의</span>
                    
                    	
		                    <a href="mailto:sales@infiniq.co.kr">SALES@infiniq.co.kr</a>                    	
                    	
                    	
                    
                </div>
                <div>
                    <span>PR 문의</span>
                    <a href="mailto:PR@infiniq.co.kr">PR@infiniq.co.kr</a>
                </div>
            </div>
        </div>
    </div>
</footer>

        <!--// footer -->
    </div>

<script src="/common/js/style.js"></script><iframe allow="join-ad-interest-group" data-tagging-id="AW-10864744395" data-load-time="1726716684022" height="0" width="0" src="https://td.doubleclick.net/td/rul/10864744395?random=1726716684003&amp;cv=11&amp;fst=1726716684003&amp;fmt=3&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=45be49h0v9126602878za200&amp;gcd=13l3l3l3l1l1&amp;dma=0&amp;tag_exp=0&amp;u_w=1536&amp;u_h=864&amp;url=https%3A%2F%2Fwww.infiniq.co.kr%2Fcompany%2Finfo&amp;ref=https%3A%2F%2Fwww.infiniq.co.kr%2Fbusiness%2Fdriving&amp;hn=www.googleadservices.com&amp;frm=0&amp;tiba=INFINIQ&amp;npa=0&amp;pscdl=noapi&amp;auid=691624885.1726716632&amp;uaa=x86&amp;uab=64&amp;uafvl=Chromium%3B128.0.6613.138%7CNot%253BA%253DBrand%3B24.0.0.0%7CMicrosoft%2520Edge%3B128.0.2739.79&amp;uamb=0&amp;uam=&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;fledge=1&amp;data=event%3Dgtag.config" style="display: none; visibility: hidden;"></iframe><iframe allow="join-ad-interest-group" data-tagging-id="AW-10907511661" data-load-time="1726716684107" height="0" width="0" src="https://td.doubleclick.net/td/rul/10907511661?random=1726716684091&amp;cv=11&amp;fst=1726716684091&amp;fmt=3&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=45be49h0v9135977744za200&amp;gcd=13l3l3l3l1l1&amp;dma=0&amp;tag_exp=0&amp;u_w=1536&amp;u_h=864&amp;url=https%3A%2F%2Fwww.infiniq.co.kr%2Fcompany%2Finfo&amp;ref=https%3A%2F%2Fwww.infiniq.co.kr%2Fbusiness%2Fdriving&amp;hn=www.googleadservices.com&amp;frm=0&amp;tiba=INFINIQ&amp;npa=0&amp;pscdl=noapi&amp;auid=691624885.1726716632&amp;uaa=x86&amp;uab=64&amp;uafvl=Chromium%3B128.0.6613.138%7CNot%253BA%253DBrand%3B24.0.0.0%7CMicrosoft%2520Edge%3B128.0.2739.79&amp;uamb=0&amp;uam=&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;fledge=1&amp;data=event%3Dgtag.config" style="display: none; visibility: hidden;"></iframe>



</body>
</html>