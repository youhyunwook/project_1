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
<title>회원 가입 실패</title>

</head>
<body>
	<div class="container">
		<h1>회원 가입 실패</h1>
		<p>${errorMessage}</p>
		<p><a href="loginMain.jsp">로그인 화면로 이동</a></p>
	</div>
</body>
</html>
