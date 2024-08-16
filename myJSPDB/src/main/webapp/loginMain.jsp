<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<title>로그인 화면</title>
<style>
	body {
	    font-family: Arial, sans-serif;
	    background-color: lightgrey;
	    margin: 0;
	    padding: 20px;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    height: 100vh; /* 전체 화면 높이 */
	}
	
	.container {
	    background: white;
	    border: 1px solid lightgrey;
	    padding: 20px;
	    border-radius: 5px;
	    box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.2);
	    max-width: 400px; /* 컨테이너 최대 너비 조정 */
	    width: 100%;
	}
	
	h1 {
	    text-align: center;
	    color: deepgrey;
	    margin-bottom: 20px;
	}
	
	.tabs {
	    display: flex;
	    margin-bottom: 20px;
	}
	
	.tab-button {
	    flex: 1;
	    padding: 10px;
	    border: 1px solid lightgrey;
	    background-color: #f9f9f9;
	    color: #333;
	    cursor: pointer;
	    text-align: center;
	    font-size: 16px;
	    border-radius: 5px 5px 0 0;
	    transition: background-color 0.3s ease, color 0.3s ease, border 0.3s ease;
	}
	
	.tab-button.active {
	    background-color: #b0b0b0;
	    color: #000;
	    border: 1px solid #ccc; /* 선택된 탭에 테두리 추가 */
	    border-bottom: 1px solid white; /* 선택된 탭의 아래 테두리 제거 */
	}
	
	.tab-button:not(.active) {
	    border: 1px solid transparent; /* 비활성 탭에는 테두리 제거 */
	}
	
	.tab-button:hover {
	    background-color: #e0e0e0;
	}
	
	.tab-content {
	    display: flex;
	    width: 365px;	
 	 justify-content: center;
	    
	}
	
	.tab-content form {
	  	width: 365px;
	    display: flex;
	    flex-direction: column;
	    justify-content: center;
	}
	.input_icon{
	 width: 30px;
	 border: none;
	 margin-left: 10px;
	 
	}
	label {
	    margin-bottom: 8px;
	    color: teal;
	}
	
	input[type="text"], input[type="password"] {
	    width: 100%;
	    padding: 8px;
	    border: 1px solid grey;
	    border-radius: 3px;
	    margin-bottom: 12px;
	    box-sizing: border-box;
	}
	
	button {
	    width: 100%;
	    padding: 10px;
	    border: none;
	    border-radius: 3px;
	    background-color: skyblue;
	    color: white;
	    font-size: 16px;
	    margin-bottom: 10px;
	    cursor: pointer;
	}
	
	button:hover {
	    background-color: #4a90e2;
	}
	
	p {
	    text-align: right;
	}
	
	p a {
	    font-family: Arial, sans-serif;
	    text-decoration: none;
	    font-size: 12px;
	    color: teal;
	}
	
	p a:hover {
	    text-decoration: underline;
	}
	#container1{
    width: 360px;
    height: 50px;
    position: relative;
    display: flex;
}
#container1 input{
    width: 100%;
    text-indent: 20px;
}
#container1 i{
    text-align:center;
    position: absolute;
    top: 5px;
    bottom: 5px;
    left: 5px;
    font-size: 20px;
}
</style>
<script>
	function showTab(tabName) {
	    const tabs = document.querySelectorAll('.tab-content');
	    tabs.forEach(tab => {
	        tab.style.display = tab.id === tabName ? 'block' : 'none';
	    });
	
	    const buttons = document.querySelectorAll('.tab-button');
	    buttons.forEach(button => {
	        if (button.textContent.trim() === tabName) {
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
                <button type="submit" class="btn btn-secondary" >로그인</button>
                <p><a href="idPwfind.jsp">아이디, 비밀번호를 잊으셨나요?</a></p>
                <button type="button" onclick="window.location.href='signup.jsp'" class="btn btn-secondary">회원가입</button>
            </form>
        </div>
        
        <div id="admin" class="tab-content" style="display: none;">
        	<h1>관리자 로그인</h1>
            <form action="adminlogin" method="post">
                <label for="id">아이디</label>
                <input type="text" id="id" name="id" placeholder="아이디를 입력하세요" required>
                
                <label for="pwd">패스워드</label>
                <input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요" required>
                
                <button type="submit" class="btn btn-secondary">로그인</button>
                <p><a href="idPwfind.jsp">아이디, 비밀번호를 잊으셨나요?</a></p>
                <button type="button" onclick="window.location.href='adminSignup.jsp'" class="btn btn-secondary">회원가입</button>
            </form>
        </div>
    </div>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>   
</body>
</html>
