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
<title>관리자 회원 가입</title>

</head>
<body>
	<div class="container">
		<h1>관리자 회원 가입</h1>
		<form action="AdminSignup" method="post">
			<label for="id"> 아이디</label>
			<input type="text" id="id" name="id" required><br>
		
			<label for="pwd"> 패스워드</label>
			<input type="text" id="pwd" name="pwd" required><br>
		
			<label for="name"> 이름</label>
			<input type="text" id="name" name="name" required><br>
		
			<label for="Em_code"> 승인코드 </label>
			<input type="text" id="Em_code" name="Em_code" required><br>

			<button type="submit">가 입</button>
			<p><a href = "loginMain.jsp">로그인 화면으로 이동</a></p>				
		</form>
	</div>
</body>
</html>
