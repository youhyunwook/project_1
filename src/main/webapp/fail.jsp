<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 실패</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: lightgrey;
        margin: 0;
        padding: 20px;
        text-align: center;
    }
    .container {
        background: white; 
        border: 1px solid lightgrey; 
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 5px 0; 
        max-width: 300px;
        width: 100%;
    }
    h1 {
        color: red;
    }
    p {
        font-size: 10;
        color: blue;
    }
    a {
        color: skyblue;
        text-decoration: none;
        font-size: 8;
    }    
</style>
</head>
<body>
	<div class="container">
		<h1>회원 가입 실패</h1>
		<p>${errorMessage}</p>
		<p><a href="loginMain.jsp">로그인 화면로 이동</a></p>
	</div>
</body>
</html>