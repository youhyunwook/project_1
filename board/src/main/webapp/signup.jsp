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
			<input type="text" id="customer_user_phoneNumber1" name="customer_user_phoneNumber" required><br>
			<p>전화번호는 - 를 빼고 적어주세요</p>
		
			<label for="customer_user_email"> 이메일</label><br>
			<input id="customer_user_email1" type="text" name="customer_user_email1" placeholder="이메일 ID" required>
            @
            <input type="text" id="customer_user_email2" name="customer_user_email2" placeholder="도메인" required>
            <select id="customer_user_email3" name="customer_user_email3" required>
                <option value="">직접입력</option> <!-- 기타 도메인을 선택할 수 있는 옵션 -->
                <option value="gmail.com">gmail.com</option>
                <option value="naver.com">naver.com</option>
                <option value="daum.net">daum.net</option>
                <option value="kakao.com">kakao.com</option>                
            </select><br>
            <p>이메일은 정확하게 적어주세요 (ID/PW 분실 시 필요)</p>

			<button type="submit">가 입</button>
			<p><button type="button" onclick="window.location.href='loginMain.jsp'">로그인 화면가기</button></p>			
		</form>
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
