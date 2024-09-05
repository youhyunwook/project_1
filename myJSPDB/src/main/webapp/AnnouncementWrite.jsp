<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 작성 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container mt-4">
        <h1 class="mb-4">공지사항 작성</h1>
        <form action="AnnController" method="post">
            <div class="mb-3">
                <label for="Ann_title" class="form-label">제 목</label>
                <input type="text" class="form-control" id="Ann_title" name="Ann_title" placeholder="제목을 입력해주세요" required>
            </div>
            <div class="mb-3">
                <label for="Ann_body" class="form-label">내 용</label>
                <textarea class="form-control" id="Ann_body" name="Ann_body" rows="15" placeholder="내용을 입력해주세요" required></textarea>
            </div>
          
            <button id="submit-button" type="submit" class="btn btn-outline-dark">등 록</button>
        </form>     
</body>
</html>