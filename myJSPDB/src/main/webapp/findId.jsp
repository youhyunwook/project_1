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
	<div class="card-front" style="position:relative; max-height:700px;">
		<h1 style="text-align: center;">Find your ID</h1>
		<form action="UserFindIdController" method="post">
		<div class="form-group">
			<label for="customer_user_name"> NAME</label>
			<input type="text" id="customer_user_name" name="customer_user_name" class="form-style_b1" required><br>
		</div>
		<div class="form-group">
			<label for="customer_user_email"> E-MAIL</label>
			<input type="text" id="customer_user_email" name="customer_user_email" class="form-style_b1" required><br>
		</div>
		
			<button type="submit" class="btn" style="margin-left: 50px; margin-bottom:20px;">Find</button>&nbsp;
			<button type="button" class="btn" style="margin-right:50px; margin-bottom:20px;" onclick="window.location.href='loginMain.jsp'">Login page</button>		
		</form>
	</div>
</body>
</html>