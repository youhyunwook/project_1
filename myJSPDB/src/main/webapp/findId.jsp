<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" href="login_style.css" />
</head>
<body>	
	<div class="container">
		<h1>아이디 찾기</h1>
		<form action="UserFindIdController" method="post">
			<label for="customer_user_name"> 이름</label>
			<input type="text" id="customer_user_name" name="customer_user_name" required><br>
			
			<label for="customer_user_email"> 이메일</label>
			<input type="text" id="customer_user_email" name="customer_user_email" required><br>

			<button type="submit">찾   기</button>
			<p><a href = "loginMain.jsp">로그인 화면으로 이동</a></p>				
		</form>
	</div>
</body>
</html>