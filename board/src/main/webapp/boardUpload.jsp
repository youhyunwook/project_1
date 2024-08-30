<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload</title>
</head>
<style>
	#title{
		width: 500px; 
	}
	#body{
		width: 500px;
	}
	#button{
		width: 500px;
		text-align: right;
	}
</style>
<body>
	<form action="submitPost" method='post'>
		<div>
			<label for='title'>제목</label><br>
			<input type="text" id='title' name='title' value='제목을 입력하세요...' required>
		</div><br>
		<div id='textbox'>
			<label for='body'>내용</label><br>
			<input type="text" id="body" name="body" value='내용을 입력하세요...' required>
		</div>
		<div id='button'>
			<button type="submit">등록</button>
			<button type="button" onclick="location.href='boardMain.jsp'">취소</button>
		</div>
	</form>
</body>
</html>