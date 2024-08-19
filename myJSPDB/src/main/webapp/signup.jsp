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
<title>방문자 회원 가입</title>

</head>
<body>
	<div class="container">
		<h1>방문자 회원 가입</h1>
		<form action="signup" method="post">
			<label for="customer_user_id"> 아이디</label>
			<input type="text" id="customer_user_id" name="customer_user_id" required><br>
		
			<label for="customer_user_pwd"> 패스워드</label>
			<input type="text" id="customer_user_pwd" name="customer_user_pwd" required><br>
		
			<label for="customer_user_name"> 이름</label>
			<input type="text" id="customer_user_name" name="customer_user_name" required><br>
			
			<label for="customer_user_address"> 주소</label>
			<input type="text" id="customer_user_address" name="customer_user_address" required><br>
			
			<label for="customer_user_phoneNumber"> 전화번호</label>
			<input type="text" id="customer_user_phoneNumber" name="customer_user_phoneNumber" required><br>
		
			<label for="customer_user_email"> 이메일</label>
			<input type="text" id="customer_user_email" name="customer_user_email" required><br>

			<button type="submit">가 입</button>
			<p><a href = "loginMain.jsp">로그인 화면으로 이동</a></p>				
		</form>
	</div>
</body>
</html>
