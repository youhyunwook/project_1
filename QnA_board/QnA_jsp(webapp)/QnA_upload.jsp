<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload</title>
</head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<style>
	#posttitle{
		text-align: center;
	}
	#container{
		text-align: center;
		height: 500px;
		display: flex;
	}
	#button{
		text-align: center;
	}
	div.left{
		flex: 1;
	}
	div.center{
		flex: 3;
	}
	div.right{
		flex: 1;
	}
</style>
<body>
	<form action="submitQnA" method='post'>
		<div id='container'>
			<div class='left'></div>
			<div class='center'>
				<div id='posttitle'>
					<label for="title" class="form-label">Title</label>
            		<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요" required>
				</div><br>
				<label for="body" class="form-label">Contents</label>
            	<textarea class="form-control" id="body" name="body" rows="15" placeholder="내용을 입력해주세요" required></textarea>
            </div>
            <div class='right'></div>
		</div>
		<div id='button'>
			<button type="submit">등록</button>
			<button type="button" onclick="window.history.back()">취소</button>
		</div>
	</form>
</body>
</html>