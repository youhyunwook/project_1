<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
	<%
	session.removeAttribute("admin_id");
	session.removeAttribute("id");
	response.sendRedirect("index3.jsp");
	%>
</body>
</html>