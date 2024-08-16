<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 업로드 테스트 페이지 입니다 이것으로 의뢰게시판을 만들 예쩡입니다. -->
<html>
<head>
<meta charset="UTF-8">
<title>upload Test page</title>
</head>
<body>
    <form id="uploadForm">
        <label for="fileUpload">파일 업로드</label>
        <input type="file" id="fileUpload" accept=".csv" />
        <p id="fileError" style="color: red;"></p>
        <button type="submit">Upload</button>
    </form>
    <script src="Main_page.js"></script>
</body>
</html>