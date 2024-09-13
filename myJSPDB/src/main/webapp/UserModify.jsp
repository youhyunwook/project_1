<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="common.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" href="login_style.css" />
<title>User Information Modify</title>
</head>
<body>
    <div class="container">
        <div class="card-front" style="position:relative; max-height:700px;">
            <h3 style="text-align: center; margin-top:50px;">Customer Information Modify</h3>
            <form action="user_modify" method="post">

                <div class="form-group">
                    <label for="customer_user_pwd">PASSWORD</label><br>
                    <% 
                        User user = (User) request.getAttribute("user");
                        // Check if user is not null before accessing its properties
                        String userPassword = user != null ? user.getCustomer_user_pwd() : "";
                    %>
                    <input type="text" id="customer_user_pwd" name="customer_user_pwd" placeholder="Enter UserPassword to use" class="form-style_b1" value="<%= userPassword %>" required>
                </div>
                
                <div class="form-group">
                    <label for="customer_user_name">NAME</label><br>
                    <% 
                        String userName = user != null ? user.getCustomer_user_name() : "";
                    %>
                    <input type="text" id="customer_user_name" name="customer_user_name" placeholder="Enter your Name" class="form-style_b1" value="<%= userName %>" required>
                </div>
                
                <div class="form-group">
                    <label for="customer_user_company">COMPANY NAME</label><br>
                    <% 
                        String userCompany = user != null ? user.getCustomer_user_company() : "";
                    %>
                    <input type="text" id="customer_user_company" name="customer_user_company" placeholder="Enter your Company Name" class="form-style_b1" value="<%= userCompany %>" required>
                </div>
                
                <div class="form-group">
                    <label for="customer_user_phoneNumber">PHONE NUMBER</label><br>
                    <% 
                        String userPhoneNumber = user != null ? user.getCustomer_user_phoneNumber() : "";
                    %>
                    <input type="text" id="customer_user_phoneNumber" name="customer_user_phoneNumber" placeholder="Enter your PhoneNumber without '-'" class="form-style_b1" value="<%= userPhoneNumber %>" required>
                    <p>전화번호는 - 를 빼고 적어주세요</p>
                </div>
                
                <div class="form-group">
                    <label for="customer_user_email">EMAIL</label><br>
                    <% 
                        String userEmail = user != null ? user.getCustomer_user_email() : "";
                        String emailId = userEmail.split("@").length > 0 ? userEmail.split("@")[0] : "";
                        String emailDomain = userEmail.split("@").length > 1 ? userEmail.split("@")[1] : "";
                    %>
                    <input type="text" id="customer_user_email1" name="customer_user_email1" class="form-style_b2" placeholder="Enter your Email Id" value="<%= emailId %>" required>
                    @
                    <input type="text" id="customer_user_email2" name="customer_user_email2" class="form-style_b2" placeholder="Choose OR Enter your Domain" value="<%= emailDomain %>" required>
                    <select id="customer_user_email3" name="customer_user_email3" class="form-style_b3">
                        <option value="">직접입력</option>
                        <option value="">직접입력</option>
                    <option value="gmail.com">gmail.com <%= "gmail.com".equals(emailDomain) ? "selected" : "" %></option>
                    <option value="naver.com">naver.com <%= "naver.com".equals(emailDomain) ? "selected" : "" %></option>
                    <option value="daum.net">daum.net <%= "daum.net".equals(emailDomain) ? "selected" : "" %></option>
                    <option value="kakao.com">kakao.com <%= "kakao.com".equals(emailDomain) ? "selected" : "" %></option>
                    </select>
                    <p>이메일은 정확하게 적어주세요 (ID/PW 분실 시 필요)</p>
                </div>
                
                <button type="submit" class="btn" style="margin-left: 35px; margin-bottom:20px;"> Submit</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn" onclick="window.location.href='customerLoginSuccess.jsp'">Back to Main</button>
            </form>
        </div>
    </div>
</body>
</html>
