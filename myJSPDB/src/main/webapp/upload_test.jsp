<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 업로드 테스트 페이지 입니다 이것으로 의뢰게시판을 만들 예쩡입니다. -->
<html>
<head>
<link href="Main_page.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>upload Test page</title>
</head>
<body>
<div class="collapse" id="navbarToggleExternalContent" data-bs-theme="dark">
  <div class="bg-dark p-4">
    <h5 class="text-body-emphasis h4">Logo.img</h5>
    <span class="text-body-secondary">
    	<span class= "nav-rigth">
        	<a class = "nav-link" href = "login_Succes.jsp">로그인</a>
  		</span>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="NewFile.jsp">Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <div id ="nav-link"><a class="nav-link active" href="#">123</a></div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">element</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">element</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href = "#">element</a>
        </li>
      </ul>
    </div>
  </div>  
</nav>
</span>
</div>
</div>
<nav class="navbar navbar-dark bg-dark">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  </div>
</nav>
  <!-- Marketing messaging and featurettes
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->
<hr>
<br><br>
<div class="notice-board">
<h1 class="board-title">게시글 작성</h1>
<br><br>
    <form id="uploadForm">
<div class="mb-3">
  <label for="exampleFormControlInput1" class="form-label">Title</label>
  <input type="text" class="form-control" id="" placeholder="제목을 입력해주세요">
</div>
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">Contents</label>
 <textarea class="form-control" rows="15" placeholder="내용을 입력해주세요"></textarea>
</div>
        <label for="fileUpload">파일 업로드</label>
        <input class="form-control" type="file" id="fileUpload" accept=".csv" />
        <p id="fileError" style="color: red;"></p>
        <button id= "submit-button" type="submit" class="btn btn-outline-dark">Upload</button>
    </form>
</div>
    <script src="Main_page.js"></script>
</body>
</html>