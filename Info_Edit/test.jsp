<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Information</title>
</head>
<body>
	<form action="UserInfoEdit" method="post">
	    <ul>
	        <li>userid: <%= request.getAttribute("userid") %></li>
	        <li>password: <%= request.getAttribute("password") %></li>
	        <li>name: <%= request.getAttribute("name") %></li>
	        <li>company: <%= request.getAttribute("company") %></li>
	        <li>phoneNumber: <%= request.getAttribute("phoneNumber") %></li>
	        <li>email: <%= request.getAttribute("email") %></li>
	    </ul>
    </form>
</body>
</html>
