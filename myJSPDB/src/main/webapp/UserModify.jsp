<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
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
            
            <%
                // 세션에서 로그인한 사용자의 ID 가져오기
                String userId = (String) session.getAttribute("id");
                
                // 데이터베이스 연결
                String userPassword = "";
                String userName = "";
                String userCompany = "";
                String userPhoneNumber = "";
                String userEmail = "";
                
                if (userId != null) {
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("org.mariadb.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/project?useUnicode=true&characterEncoding=UTF-8", "root", "1234");

                        // 사용자 정보 조회 SQL 쿼리
                        String sql = "SELECT customer_user_pwd, customer_user_name, customer_user_company, customer_user_phoneNumber, customer_user_email FROM user WHERE customer_user_id = ?";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, userId);
                        rs = pstmt.executeQuery();
                        
                        if (rs.next()) {
                            userPassword = rs.getString("customer_user_pwd");
                            userName = rs.getString("customer_user_name");
                            userCompany = rs.getString("customer_user_company");
                            userPhoneNumber = rs.getString("customer_user_phoneNumber");
                            userEmail = rs.getString("customer_user_email");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                        if (conn != null) conn.close();
                    }
                }
                
                // 이메일 아이디와 도메인 분리
                String emailId = userEmail.split("@").length > 0 ? userEmail.split("@")[0] : "";
                String emailDomain = userEmail.split("@").length > 1 ? userEmail.split("@")[1] : "";
            %>

            <form action="user_modify" method="post">

                <div class="form-group">
                    <label for="customer_user_pwd">PASSWORD</label><br>
                    <input type="text" id="customer_user_pwd" name="customer_user_pwd" placeholder="Enter UserPassword to use" class="form-style_b1" value="<%= userPassword %>" required>
                </div>
                
                <div class="form-group">
                    <label for="customer_user_name">NAME</label><br>
                    <input type="text" id="customer_user_name" name="customer_user_name" placeholder="Enter your Name" class="form-style_b1" value="<%= userName %>" required>
                </div>
                
                <div class="form-group">
                    <label for="customer_user_company">COMPANY NAME</label><br>
                    <input type="text" id="customer_user_company" name="customer_user_company" placeholder="Enter your Company Name" class="form-style_b1" value="<%= userCompany %>" required>
                </div>
                
                <div class="form-group">
                    <label for="customer_user_phoneNumber">PHONE NUMBER</label><br>
                    <input type="text" id="customer_user_phoneNumber" name="customer_user_phoneNumber" placeholder="Enter your PhoneNumber without '-'" class="form-style_b1" value="<%= userPhoneNumber %>" required>
                    <p>전화번호는 - 를 빼고 적어주세요</p>
                </div>
                
                <div class="form-group">
                    <label for="customer_user_email">EMAIL</label><br>
                    <input type="text" id="customer_user_email1" name="customer_user_email1" class="form-style_b2" placeholder="Enter your Email Id" value="<%= emailId %>" required>
                    @
                    <input type="text" id="customer_user_email2" name="customer_user_email2" class="form-style_b2" placeholder="Choose OR Enter your Domain" value="<%= emailDomain %>" required>
                    <select id="customer_user_email3" name="customer_user_email3" class="form-style_b3">
                        <option value="">직접입력</option>
                        <option value="gmail.com" <%= "gmail.com".equals(emailDomain) ? "selected" : "" %>>gmail.com</option>
                        <option value="naver.com" <%= "naver.com".equals(emailDomain) ? "selected" : "" %>>naver.com</option>
                        <option value="daum.net" <%= "daum.net".equals(emailDomain) ? "selected" : "" %>>daum.net</option>
                        <option value="kakao.com" <%= "kakao.com".equals(emailDomain) ? "selected" : "" %>>kakao.com</option>
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