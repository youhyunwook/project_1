<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" href="login_style.css" />
<title>아이디 찾기 실패</title>
</head>
<body>	
	<div class="container">
		<h1>아이디 찾기 실패</h1>
		<p>찾는 아이디가 없습니다. </p>
		<p>${errorMessage}</p>
		<p><a href="signup.jsp">회원가입 하기</a></p>
		<p><a href="loginMain.jsp">로그인 화면으로 가기</a></p>
	</div>
</body>
</html>