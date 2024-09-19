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
<title>패스워드 찾기 실패</title>
</head>
<body>	
	<div class="container">
		<h1>패스워드 찾기 실패</h1>
		<p>아이디나 이름, 이메일 중 하나가 틀렸습니다. </p>
		<p>${errorMessage}</p>
		<p><a href="findPw.jsp">다시 비밀번호 찾기</a></p>
		<p><a href="loginMain.jsp">로그인 화면으로 돌아가기</a></p>
	</div>
</body>
</html>