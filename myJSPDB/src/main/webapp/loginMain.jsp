<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&display=swap" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"> -->
<link rel="stylesheet" href="login_style.css" />
<meta charset="UTF-8">
<title>로그인 화면</title>

</head>
<body>
    <div class="section">
        <div class="container">
            <div class="row full-height justify-content-center">
                <div class="col-12 text-center align-self-center py-5">
                    <div class="section pb-5 pt-10 5-sm-2 text-right">
                        <h6 class="mb-0 pb-3"><span>Customer</span><span>Admin</span></h6>
                        <input class="checkbox" type="checkbox" id="reg-log" name="reg-log"/>
                        <label for="reg-log"></label>
                        <div class="card-3d-wrap mx-auto">
                            <div class="card-3d-wrapper">
                                <div class="card-front">
                                    <div class="center-wrap">
                                        <div class="section text-center">
                                        <form action="login" method="post">
                                        	<img src="http://localhost:8080/myJSPDB/img/login_logo.png" style="margin-bottom: -20px;" onclick="window.location.href='index.jsp'"/>
                                            <h4 class="mb-4 pb-3">Customer Log In</h4>
                                            <div class="form-group">
                                                <input type="text" id="customer_user_id" name="customer_user_id" class="form-style" placeholder="Enter Your Id" required>
                                                <i class="input-icon uil uil-at"></i>
                                            </div>  
                                            <div class="form-group mt-2">
                                                <input type="password" id="customer_user_pwd" name="customer_user_pwd" class="form-style" placeholder="Enter Your Password" required>
                                                <i class="input-icon uil uil-lock-alt"></i>
                                            </div>
                                            <button type="submit" class="btn mt-4" >Submit</button> <button type="button" onclick="window.location.href='signup.jsp'" class="btn mt-5">SignUp</button>
                                            <p class="mb-0 mt-4 text-center"><a href="findId.jsp" class="link">Forgot your id?</a> &nbsp;<span> / </span> &nbsp; <a href="findPw.jsp" class="link">Forgot your password?</a></p>
                                        </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-back">
                                    <div class="center-wrap">
                                        <div class="section text-center">
                                        <form action="adminlogin" method="post">
                                        	<img src="http://localhost:8080/myJSPDB/img/login_logo.png" style="margin-bottom: -20px;" onclick="window.location.href='index.jsp'"/>
                                            <h4 class="mb-4 pb-3">Admin Log In</h4>
                                            <div class="form-group">
                                                <input type="text" name="id" class="form-style" placeholder="Enter Your Id" id="id" autocomplete="off">
                                                <i class="input-icon uil uil-user"></i>
                                            </div>  
                                            <div class="form-group mt-2">
                                                <input type="password" name="pwd" class="form-style" placeholder="Enter Your Password" id="pwd" autocomplete="off">
                                                <i class="input-icon uil uil-at"></i>
                                            </div>  
                                           
                                            <button type="submit" class="btn mt-4">Submit</button> <button type="button" onclick="window.location.href='adminSignup.jsp'" class="btn mt-5">SignUp</button>
                                        </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
