<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>
body {
	
    margin: 0; /* 기본 margin 제거 */
    width: 100vw; /* vw로 수정 */
    height: 100vh;
    background-color: #F4C432;
}

#errorPage {
    position: relative;
    width: 100vw; /* vw로 수정 */
    height: 100%; /* 원하는 높이 설정 */
    background: url('img/error.png') no-repeat center center; /* 이미지 반복 금지 및 중앙 정렬 */
    color: rgb(255,0, 0);
    display: flex; /* Flexbox 사용 */
    flex-direction: column; /* 세로 방향으로 정렬 */

    align-items: center; /* 수평 중앙 정렬 */
}

h2 {
    text-align: center;
    font-family: 'Do Hyeon', sans-serif;
}

#button {
    width: 170px;
    height: 40px;
    margin-top: 20px; /* 제목과 버튼 사이의 간격 */
    font-family: 'Do Hyeon', sans-serif;
    background-color: #000000;
    border-radius: 5px;
    color: #ffffff;
}

.do-hyeon-regular {
  font-family: "Do Hyeon", sans-serif;
  font-weight: 400;
  font-style: normal;
  }
</style>
</head>
<body>
	<div id="errorPage">
		<h2> 예기치 못한 오류가 발생했습니다. </h2>
		<button id='button' onclick="window.location.href='index3.jsp';">메인페이지로 돌아가기 </button>
	</div>	
</body>
</html>