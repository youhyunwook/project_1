<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문자 회원 가입</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" href="login_style.css" />

</head>
<body>
    <div class="container">
   		<div class="card-front" style="position:relative; max-height:700px;">
        <h1 style="text-align: center; margin-top:50px;">Customer Sign Up</h1>
        <form action="signup" method="post">
            <div class="form-group">
                <label for="customer_user_id">ID</label><br>
                <input type="text" id="customer_user_id" name="customer_user_id" class="form-style_b1" placeholder="Enter UserId to use" required>
            </div>
            
            <div class="form-group">
                <label for="customer_user_pwd">PASSWORD</label><br>
                <input type="password" id="customer_user_pwd" name="customer_user_pwd" placeholder="Enter UserPassword to use" class="form-style_b1" required>
            </div>
            
            <div class="form-group">
                <label for="customer_user_name">NAME</label><br>
                <input type="text" id="customer_user_name" name="customer_user_name" placeholder="Enter your Name" class="form-style_b1" required>
            </div>
            
            <div class="form-group">
                <label for="customer_user_address">ADDRESS</label><br>
                <input type="text" id="customer_user_address" name="customer_user_address" placeholder="Enter your Address" class="form-style_b1" required>
            </div>
            
            <div class="form-group">
                <label for="customer_user_phoneNumber">PHONE NUMBER</label><br>
                <input type="text" id="customer_user_phoneNumber" name="customer_user_phoneNumber" placeholder="Enter your PhoneNumber without '-'" class="form-style_b1" required>
                <p>전화번호는 - 를 빼고 적어주세요</p>
            </div>
            
            <div class="form-group">
                <label for="customer_user_email">EMAIL</label><br>
                <input type="text" id="customer_user_email1" name="customer_user_email1" class="form-style_b2" placeholder="Enter your Email Id" required>
                @
                <input type="text" id="customer_user_email2" name="customer_user_email2" class="form-style_b2" placeholder="Choose OR Enter your Domain" required>
                <select id="customer_user_email3" name="customer_user_email3" class="form-style_b3" required>
                    <option value="">직접입력</option>
                    <option value="gmail.com">gmail.com</option>
                    <option value="naver.com">naver.com</option>
                    <option value="daum.net">daum.net</option>
                    <option value="kakao.com">kakao.com</option>
                </select>
                <p>이메일은 정확하게 적어주세요 (ID/PW 분실 시 필요)</p>
            </div>
            
            <button type="submit" class="btn" style="margin-left: 35px; margin-bottom:20px;"> Submit</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button type="button" class="btn" onclick="window.location.href='loginMain.jsp'">Back to Login</button>
        </form>
    </div>
    </div>
	<script>
        document.getElementById('customer_user_email3').addEventListener('change', function() {
            var domainInput = document.getElementById('customer_user_email2');
            var selectedDomain = this.value;
            
            // 선택된 도메인이 ''이면 사용자 입력 필드로 비워두기
            if (selectedDomain === "") {
                domainInput.value = ""; // 도메인 입력 필드 비우기
                domainInput.focus(); // 커서를 도메인 입력 필드로 이동
            } else {
                domainInput.value = selectedDomain; // 선택된 도메인으로 입력 필드 값 설정
            }
        });

        // 페이지 로드 시, 기본 도메인 값을 입력 필드에 설정
        document.addEventListener('DOMContentLoaded', function() {
            var selectElement = document.getElementById('customer_user_email3');
            var domainInput = document.getElementById('customer_user_email2');
            var initialDomain = selectElement.value;

            // 초기 선택값에 따라 도메인 입력 필드 값 설정
            domainInput.value = initialDomain;
        });
    </script>
</body>
</html>
