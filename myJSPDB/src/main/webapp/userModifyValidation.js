    function validatePassword() {
        var password = document.getElementById("customer_user_pwd").value;
        var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,16}$/;
        if (!passwordPattern.test(password)) {
            document.getElementById("pwdError").innerHTML = "비밀번호는 8자 이상 16자 이하, 알파벳, 숫자, 특수문자를 포함해야 합니다.";
            return false;
        } else {
            document.getElementById("pwdError").innerHTML = "";
            return true;
        }
    }

    function validateName() {
        var name = document.getElementById("customer_user_name").value;
        var namePattern = /^[A-Za-z가-힣]{1,12}$/;
        if (!namePattern.test(name)) {
            document.getElementById("nameError").innerHTML = "이름은 12자 이하이고, 숫자 및 특수문자를 사용할 수 없습니다.";
            return false;
        } else {
            document.getElementById("nameError").innerHTML = "";
            return true;
        }
    }

    function validateCompany() {
        var company = document.getElementById("customer_user_company").value;
        var companyPattern = /^[A-Za-z가-힣0-9 ]{1,100}$/;
        if (!companyPattern.test(company)) {
            document.getElementById("companyError").innerHTML = "회사명은 100자 이하이고, 특수문자를 사용할 수 없습니다.";
            return false;
        } else {
            document.getElementById("companyError").innerHTML = "";
            return true;
        }
    }

    function validatePhoneNumber() {
        var phoneNumber = document.getElementById("customer_user_phoneNumber").value;
        var phonePattern = /^[0-9]{1,}$/;
        if (!phonePattern.test(phoneNumber)) {
            document.getElementById("phoneError").innerHTML = "전화번호는 숫자만 입력해야 합니다.";
            return false;
        } else {
            document.getElementById("phoneError").innerHTML = "";
            return true;
        }
    }

    function validateEmail() {
        return true;
    }

    function validateForm() {
        var isPasswordValid = validatePassword();
        var isNameValid = validateName();
        var isCompanyValid = validateCompany();
        var isPhoneValid = validatePhoneNumber();
        var isEmailValid = validateEmail();

        // 모든 필드가 유효할 때만 제출 버튼 활성화
        var submitButton = document.querySelector(".modify-btn");
        if (isPasswordValid && isNameValid && isCompanyValid && isPhoneValid && isEmailValid) {
            submitButton.disabled = false;
        } else {
            submitButton.disabled = true;
        }

        return isPasswordValid && isNameValid && isCompanyValid && isPhoneValid && isEmailValid;
    }

    // 입력 필드에 이벤트 리스너 추가
    document.addEventListener("DOMContentLoaded", function() {
        var fields = [
            "customer_user_pwd",
            "customer_user_name",
            "customer_user_company",
            "customer_user_phoneNumber",
            "customer_user_email1",
            "customer_user_email2"
        ];

        fields.forEach(function(field) {
            document.getElementById(field).addEventListener("input", validateForm);
        });

        // 초기 상태에서 제출 버튼 비활성화
        document.querySelector(".modify-btn").disabled = true;
    });
