<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
   <div class="card-front" style="position:relative; max-height:auto;">
        <h3 style="text-align: center; margin-top:50px;">Customer Sign Up</h3>
     <form action="signup" method="post" id="signupForm">
    <div class="form-group">
        <label for="customer_user_id">ID</label><br>
        <input type="text" id="customer_user_id" name="customer_user_id" class="form-style_b1" placeholder="Enter UserId to use" style="width:280px;" required>
        	<button type="button" class="btn" onclick="#" style="margin-left:15px; width: 142px; height:40px;" disabled>ID Check</button>
        <p id="idError" style="color: red;"></p>
    </div>
    
    <div class="form-group">
        <label for="customer_user_pwd">PASSWORD</label><br>
        <input type="password" id="customer_user_pwd" name="customer_user_pwd" placeholder="Enter UserPassword to use" class="form-style_b1" required>
        <p id="pwdError" style="color: red;"></p>
    </div>
    
    <div class="form-group">
        <label for="customer_user_name">NAME</label><br>
        <input type="text" id="customer_user_name" name="customer_user_name" placeholder="Enter your Name" class="form-style_b1" required>
        <p id="nameError" style="color: red;"></p>
    </div>
    
    <div class="form-group">
        <label for="customer_user_company">COMPANY NAME</label><br>
        <input type="text" id="customer_user_company" name="customer_user_company" placeholder="Enter your Company Name" class="form-style_b1" required>
        <p id="companyError" style="color: red;"></p>
    </div>
    
    <div class="form-group">
        <label for="customer_user_phoneNumber">PHONE NUMBER</label><br>
        <input type="text" id="customer_user_phoneNumber" name="customer_user_phoneNumber" placeholder="Enter your PhoneNumber without '-'" class="form-style_b1" required>
        <p>전화번호는 - 를 빼고 적어주세요</p>
        <p id="phoneError" style="color: red;"></p>
    </div>
    
    <div class="form-group">
        <label for="customer_user_email">EMAIL</label><br>
        <input type="text" id="customer_user_email1" name="customer_user_email1" class="form-style_b2" placeholder="Enter your Email Id" required>
        @
        <input type="text" id="customer_user_email2" name="customer_user_email2" class="form-style_b2" placeholder="Choose OR Enter your Domain" required>
        <select id="customer_user_email3" name="customer_user_email3" class="form-style_b3">
            <option value="">직접입력</option>
            <option value="gmail.com">gmail.com</option>
            <option value="naver.com">naver.com</option>
            <option value="daum.net">daum.net</option>
            <option value="kakao.com">kakao.com</option>
        </select>
        <p>이메일은 정확하게 적어주세요 (ID/PW 분실 시 필요)</p>
        <p id="emailError" style="color: red;"></p>
    </div>
    
    <button type="submit" class="btn" style="margin-left: 80px; margin-bottom:20px;" disabled>Submit</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
<script src="Signup.js"></script>
</body>
</html> --%>

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
<style>
.popup {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background: white;
    padding: 20px;
    border: 1px solid #ccc;
    z-index: 1000;
    display: none;
}

.popup-content {
    display: flex;
    flex-direction: column;
    align-items: center;
}

#checkError, #validationError {
    color: red;
}
</style>
</head>
<body>
    <div class="container" >
	   <div class="card-front" style="position:relative; max-height:auto;">
	        <h3 style="text-align: center; padding-top:50px;">Customer Sign Up</h3>
	   <form action="signup" method="post" id="signupForm">
	   
	   
		   <div class="form-group">
			    <label for="customer_user_id" style="display:block; margin-left:30px; margin-bottom:-20px;">ID</label>
			    <input type="text" id="customer_user_id" name="customer_user_id" class="form-style_b1" placeholder="Press 'ID CHECK' Button" style="width:230px; margin-left:30px; cursor: not-allowed;" required disabled>
			    <button type="button" class="btn" onclick="togglePopup()" style="margin-left:30px; width: 150px; height:40px;">ID Check</button>
			    <p id="idError" style="color: red; margin-left:30px;"></p>
			</div>
			
			<!-- ID 체크 팝업 -->
			<div class="popup" id="popup-idCheckPopup">
			    
			        <li>
			        	<h2 id="popup-idCheckTitle">ID 중복 확인</h2>
			        	<img id="check_img" src="img/id_check.png"/>
			            
			        </li>			        
			            <label for="popup-check_user_id">ID</label>
			        <li>
			            <input type="text" id="popup-check_user_id" name="customer_user_id" placeholder="Enter UserId to check" required>			       
			            <button type="button" onclick="checkId()">중복 체크</button>			        
			            <p id="popup-checkError"></p>
			            <p id="popup-validationError"></p>			        
			            <button type="button" id="popup-useButton" onclick="useId()" disabled>사용하기</button>
			            <button type="button" id="popup-closeButton" onclick="togglePopup()">닫기</button>
			        </li>
			    
			</div>

    
		    <div class="form-group">
		        <label for="customer_user_pwd" style="margin-left:30px;">PASSWORD</label><br>
		        <input type="password" id="customer_user_pwd" name="customer_user_pwd" placeholder="Enter UserPassword to use" class="form-style_b1" style="margin-left:30px; width:410px;" required>
		        <p id="pwdError" style="color: red; margin-left:30px;"></p>
		    </div>
		    
		    <div class="form-group">
		        <label for="customer_user_name" style="margin-left:30px;">NAME</label><br>
		        <input type="text" id="customer_user_name" name="customer_user_name" placeholder="Enter your Name" class="form-style_b1" style="margin-left:30px; width:410px;" required>
		        <p id="nameError" style="color: red; margin-left:30px;"></p>
		    </div>
		    
		    <div class="form-group">
		        <label for="customer_user_company" style="margin-left:30px;">COMPANY NAME</label><br>
		        <input type="text" id="customer_user_company" name="customer_user_company" placeholder="Enter your Company Name" class="form-style_b1" style="margin-left:30px; width:410px;" required>
		        <p id="companyError" style="color: red; margin-left:30px;"></p>
		    </div>
		    
		    <div class="form-group">
		        <label for="customer_user_phoneNumber" style="margin-left:30px;">PHONE NUMBER</label><br>
		        <input type="text" id="customer_user_phoneNumber" name="customer_user_phoneNumber" placeholder="Enter your PhoneNumber without '-'" class="form-style_b1"  style="margin-left:30px; width:410px;" required>
		        <p style="margin-left:30px;">전화번호는 - 를 빼고 적어주세요</p>
		        <p id="phoneError" style="color: red; margin-left:30px;"></p>
		    </div>
		    
		    <div class="form-group">
		        <label for="customer_user_email" style="margin-left:30px;">EMAIL</label><br>
		        <input type="text" id="customer_user_email1" name="customer_user_email1" class="form-style_b2" placeholder="Enter your Email Id" style="margin-left:30px; "required>
		        @
		        <input type="text" id="customer_user_email2" name="customer_user_email2" class="form-style_b2" placeholder="Choose OR Enter your Domain" style="width:100px;" required>
		        <select id="customer_user_email3" name="customer_user_email3" class="form-style_b3">
		            <option value="">직접입력</option>
		            <option value="gmail.com">gmail.com</option>
		            <option value="naver.com">naver.com</option>
		            <option value="daum.net">daum.net</option>
		            <option value="kakao.com">kakao.com</option>
		        </select>
		        <p style="margin-left:30px;">이메일은 정확하게 적어주세요 (ID/PW 분실 시 필요)</p>
		        <p id="emailError" style="color: red; margin-left:30px;"></p>
		    </div>
    
		    <button type="submit" class="btn" style="margin-left: 80px; margin-bottom:20px;" disabled>Submit</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
        
     // ID 체크 팝업
        function togglePopup() {
            const popup = document.getElementById('popup-idCheckPopup'); // 수정된 ID
            const userIdInput = document.getElementById('customer_user_id');

            if (popup.style.display === 'none' || popup.style.display === '') {
                popup.style.display = 'flex';
                userIdInput.disabled = true; // 팝업이 열리면 메인 입력란 비활성화
            } else {
                popup.style.display = 'none';
                userIdInput.disabled = true; // 팝업이 닫히면 메인 입력란 비활성화
            }
        }

        function validateUserId(userId) {
            const regex = /^[a-zA-Z0-9]{4,12}$/;
            return regex.test(userId);
        }

        function checkId() {
            const userId = document.getElementById('popup-check_user_id').value; // 수정된 ID
            const validationError = document.getElementById('popup-validationError'); // 수정된 ID
            validationError.textContent = ''; 

            // ID 유효성 검사
            if (!validateUserId(userId)) {
                validationError.textContent = 'ID는 4자 이상 12자 이하의 영문 대소문자와 숫자로만 구성되어야 합니다.';
                document.getElementById('popup-useButton').disabled = true; // 수정된 ID
                return; 
            }

            const xhr = new XMLHttpRequest();
            xhr.open('POST', 'checkIdResult.jsp', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onload = function() {
                const result = JSON.parse(this.responseText);
                const checkError = document.getElementById('popup-checkError'); // 수정된 ID
                if (result.exists) {
                    checkError.textContent = '중복된 ID입니다.';
                    document.getElementById('popup-useButton').disabled = true; // 수정된 ID
                } else {
                    checkError.textContent = '사용 가능한 ID입니다';
                    document.getElementById('popup-useButton').disabled = false; // 수정된 ID
                }
            };
            xhr.send('customer_user_id=' + encodeURIComponent(userId));
        }

        function useId() {
            const userId = document.getElementById('popup-check_user_id').value; // 수정된 ID
            const mainUserIdInput = document.getElementById('customer_user_id'); // 메인 페이지의 ID 입력란

            if (userId) {
                mainUserIdInput.value = userId; // 메인 페이지의 입력란에 ID 설정
                mainUserIdInput.disabled = true; // 입력란 비활성화
                mainUserIdInput.style.cursor = 'not-allowed'; // 커서 변경
            }

            togglePopup(); // 팝업 닫기
        }

    </script>
<script src="Signup.js"></script>
</body>
</html>