<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="login_style.css" />
<meta charset="UTF-8">
<title>로그인 화면</title>

<script>
	function showTab(tabName) {
	    const tabs = document.querySelectorAll('.tab-content');
	    tabs.forEach(tab => {
	        tab.style.display = tab.id === tabName ? 'block' : 'none';
	    });
	
	    const buttons = document.querySelectorAll('.tab-button');
	    buttons.forEach(button => {
	        if (button.dataset.tab === tabName) {
	            button.classList.add('active');
	        } else {
	            button.classList.remove('active');
	        }
	    });
	}
	
	// 페이지 로드 시 기본 탭을 설정
	document.addEventListener('DOMContentLoaded', () => {
	    showTab('guest'); // 기본 '손님' 탭을 표시
	});
</script>

</head>
<body>	
	<div class="container">
		<span><img class = "mainpic" src="http://localhost:8080/myJSPDB/img/login.png"></span>
        
        <div class="tabs">
            <button class="tab-button" data-tab="guest" onclick="showTab('guest')">Customer</button>
            <button class="tab-button" data-tab="admin" onclick="showTab('admin')">Admin</button>
        </div>
        
        <div id="guest" class="tab-content">
        	<h1>방문자 로그인</h1>
            <form action="login" method="post">
                <label for="customer_user_id">아이디</label>
   				<div id="container1">
            		<input type="text" id="customer_user_id" name="customer_user_id" placeholder="아이디를 입력하세요" required>
            		<i class="bi bi-person-square"></i>
         		</div>
				
                
                <label for="customer_user_pwd">패스워드</label>
                <div  id="container1">
          			<input type="password" id="customer_user_pwd" name="customer_user_pwd" placeholder="비밀번호를 입력하세요" required>
          			<i class="bi bi-key"></i>
          		</div>
                
                <button type="submit">로그인</button>
                <span><input type="checkbox" id="savelogin" name="savelogin" value="로그인 유지">
                <label for="savelogin">로그인 유지</label></span>
                <p><button type="button" onclick="window.location.href='findId.jsp'">아이디 찾기</button> <button type="button" onclick="window.location.href='findPw.jsp'">비밀번호 찾기</button></p>
                
                <button type="button" onclick="window.location.href='signup.jsp'">회원가입</button>
            </form>
        </div>
        
        <div id="admin" class="tab-content" style="display: none;">
        	<h1>관리자 로그인</h1>
            <form action="adminlogin" method="post">
                <label for="id">아이디</label>
                <div  id="container1">
                	<input type="text" id="id" name="id" placeholder="아이디를 입력하세요" required>
                	<i class="bi bi-key"></i>
                </div>
                
                <label for="pwd">패스워드</label>
                <div  id="container1">
	                <input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요" required>
	                <i class="bi bi-key"></i>
				</div>
                
                <button type="submit">로그인</button>
                <span><input type="checkbox" id="savelogin" name="savelogin" value="로그인 유지">
                <label for="savelogin">로그인 유지</label></span>
                <!-- <p><button type="button" onclick="window.location.href='findId.jsp'">아이디 찾기</button> <button type="button" onclick="window.location.href='adminSignup.jsp'">비밀번호 찾기</button></p> -->
                <button type="button" onclick="window.location.href='adminSignup.jsp'">회원가입</button>
            </form>
        </div>
    </div> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>           
</body>
</html>
