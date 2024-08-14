<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문자 회원 가입</title>
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
    label {
        display: block;
        margin-bottom: 8px;
        color: teal; 
    }
    input[type="text"] {
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
    }
    a {
  		text-align: center;
  		display: inline-block;
  		width: 93.5%;
        padding: 10px;        
        border-radius: 3px;
        background-color: skyblue; 
        color: white; 
        text-decoration: none;
        margin-top : 10px;
        font-size: 16px;    
    }
</style>
</head>
<body>
	<div class="container">
		<h1>방문자 회원 가입</h1>
		<form action="signup" method="post">
			<label for="customer_user_id"> 아이디</label>
			<input type="text" id="customer_user_id" name="customer_user_id" required><br>
		
			<label for="customer_user_pwd"> 패스워드</label>
			<input type="text" id="customer_user_pwd" name="customer_user_pwd" required><br>
		
			<label for="customer_user_name"> 이름</label>
			<input type="text" id="customer_user_name" name="customer_user_name" required><br>
			
			<label for="customer_user_address"> 주소</label>
			<input type="text" id="customer_user_address" name="customer_user_address" required><br>
			
			<label for="customer_user_phoneNumber"> 전화번호</label>
			<input type="text" id="customer_user_phoneNumber" name="customer_user_phoneNumber" required><br>
		
			<label for="customer_user_email"> 이메일</label>
			<input type="text" id="customer_user_email" name="customer_user_email" required><br>

			<button type="submit">가 입</button>
			<p><a href = "loginMain.jsp">로그인 화면으로 이동</a></p>				
		</form>
	</div>
</body>
</html>