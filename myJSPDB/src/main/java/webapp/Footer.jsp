<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:include page="font.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer Example</title>
<style>
    body {
        font-family: "Do Hyeon", sans-serif;
  		font-weight: 400;
        margin: 0;
        padding: 0;
        width:100vw;
    }
    footer {
        background-color: black;
        color: white;
        padding: 40px 20px;
        text-align: center;
        width: 100vw;
        margin:0;
    }
    footer p {
        margin: 5px 0;
    }
    footer a {
        color: #f0a500;
        text-decoration: none;
    }
    footer a:hover {
        text-decoration: underline;
    }
    .login-button, .back-to-top-button {
        display: inline-block;
        background-color: #f0a500;
        color: black;
        padding: 10px 20px;
        border-radius: 5px;
        transition: background-color 0.3s;
        margin-top: 10px;
        margin-left: 10px; /* 간격 추가 */
    }
    .login-button:hover, .back-to-top-button:hover {
        background-color: #d68a00;
    }
</style>
</head>
<body>
    <!-- FOOTER -->
	<footer>
	    <p>(주)BBA데이터</p>
	    <p>서울특별시 강남구 테헤란로 223 제일큰빌딩</p>
	    <p>대표: 유현욱 | 사업자등록번호: 111-11-1111 | 통신판매업 신고: 2024-수원망포-12345</p>
	    <p>Tel: 02-1111-1111 | Fax: 02-111-1111 | Email: <a href="mailto:evelth4@gmail.com">evelth4@gmail.com</a></p>
	    <p>채용문의: <a href="mailto:evelth4@gmail.com">evelth4@gmail.com</a></p>
	    <p>© BBA Data Co. Ltd. All Rights Reserved.</p>
	    <a href="loginMain.jsp" class="login-button">Login</a>
	    <a href="javascript:void(0);" class="back-to-top-button" onclick="scrollToTop(event)">Back to Top</a>
	</footer>
	
	<script>
	function scrollToTop() {
	    const headerOffset = document.querySelector('head').offsetHeight; // 헤더 높이
	    const elementPosition = 0; // 스크롤할 위치 (0)
	    const offsetPosition = elementPosition - headerOffset; // 조정된 위치

	    window.scrollTo({
	        top: offsetPosition,
	        behavior: 'smooth'
	    });	    
	}
	</script>

</body>
</html>
