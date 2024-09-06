document.addEventListener('DOMContentLoaded', function() {
    var userIdInput = document.getElementById('customer_user_id');
    var userPwdInput = document.getElementById('customer_user_pwd');

    // 정규표현식
    var idPattern = /^[A-Za-z0-9]{1,16}$/;
    var pwdPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/;

    // 오류 메시지 요소
    var idError = document.getElementById('idError');
    var pwdError = document.getElementById('pwdError');

    // 입력값 검증 함수
    function validateInput() {
        var userId = userIdInput.value;
        var userPwd = userPwdInput.value;

        // ID 검증
        var validId = idPattern.test(userId);
        if (!validId) {
            idError.textContent = "ID는 영문 대소문자와 숫자만 사용 가능하며, 최대 16자까지 입력할 수 있습니다.";
            userIdInput.setAttribute('aria-invalid', 'true');
        } else {
            idError.textContent = ""; // 오류 메시지 지우기
            userIdInput.removeAttribute('aria-invalid');
        }

        // 비밀번호 검증
        var validPwd = pwdPattern.test(userPwd);
        if (!validPwd) {
            pwdError.textContent = "비밀번호는 8자 이상 16자 이하의 문자로, 영어, 숫자 및 특수문자를 모두 포함해야 합니다.";
            userPwdInput.setAttribute('aria-invalid', 'true');
        } else {
            pwdError.textContent = ""; // 오류 메시지 지우기
            userPwdInput.removeAttribute('aria-invalid');
        }
    }

    // 입력 필드의 입력값이 변경될 때마다 검증
    userIdInput.addEventListener('input', validateInput);
    userPwdInput.addEventListener('input', validateInput);
});
