<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<div><h1>문의사항 답변</h1></div>
		<div id='title'>
        	<h1>문의사항 작성</h1>

        </div><br>
        <div id='content'>
            <div class='left'></div>
            <div class='center'></div>
            <div class='right'></div>
        </div><br>
        <div id='button'>
            <button type="button" onclick="window.location.href='answer.jsp'">답변</button>
            <button type="button" onclick="window.location.href='xx.jsp'">수정</button>
            <button type="button" onclick="confirm_del()">삭제</button>
        </div>
	</form>
</body>
</html>