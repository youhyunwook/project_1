<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="Announcement_style.css" />
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 
</head>
<body>
    <!-- 네비게이션 바 로딩 -->    
    <jsp:include page="NavBar.jsp" />
    <!-- 네비게이션 바 로딩 -->

    <!-- 메인 이미지 -->
    <div style="position: relative; width: 100%; height: auto; overflow: hidden;">
        <img src="img/AnnouncementImg.png" style="width: 100%; height: 600px; object-fit: cover;"/>
        <div style="position: absolute; top: 30%; left: 50%; transform: translate(-50%, -50%); text-align: center; color: white;">
            <h1 style="font-size: 2.5em; text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);">공지사항</h1>
            <hr style="border: 3px solid white; width: 50%; margin: 10px auto;"/>
            <p style="font-size: 1.5em; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.7);">BBA의 최신 뉴스</p>
            <hr style="border: 3px solid white; width: 50%; margin: 10px auto;"/>
        </div>
    </div>

    <!-- 메인 내용 -->
    <div id="content_box" style="position: relative; z-index: 1; margin-top: -200px; padding: 20px; background-color: rgba(255, 255, 255, 0.8);">
        <h1 class="mb-4" style="text-align: center;">공지사항 작성</h1>
        <form action="AnnController" method="post">
            <div class="mb-3">
                <label for="Ann_title" class="form-label">제 목</label>
                <input type="text" class="form-control" id="Ann_title" name="Ann_title" placeholder="제목을 입력해주세요" style="background-color: rgba(255, 255, 255, 0.8) !important;" maxlength="20" required>
                <span id="titleCount" class="text-muted">(0 /20) </span> <!-- 카운팅 -->
            </div>
            <div class="mb-3">
                <label for="Ann_body" class="form-label">내 용</label>
                <textarea class="form-control" id="Ann_body" name="Ann_body" rows="15" placeholder="내용을 입력해주세요" style="background-color: rgba(255, 255, 255, 0.8) !important;" maxlength="1000"required></textarea>
                <span id="bodyCount" class="text-muted">(0 /1000) </span> <!-- 카운팅 -->
            </div>
            <div id="button" style="text-align: center;"> <!-- 중앙 정렬 -->
                <button type="submit" style="border-radius: 5px;">등 록</button> <!-- CSS 클래스 적용 -->
            </div>
        </form>
    </div>
    <!-- 푸터 바 로딩 -->    
    <jsp:include page="Footer.jsp" />
    <!-- 푸터 바 로딩 -->  
    
    <script>
    $(document).ready(function () {
        // 제목 글자 수 카운팅
        $('#Ann_title').on('input', function () {
            var content = $(this).val();
            $('#titleCount').html("("+content.length+" / 20)"); // 글자수 실시간 카운팅

            if (content.length > 20) {
                alert("최대 20자까지 입력 가능합니다.");
                $(this).val(content.substring(0, 20));
                $('#titleCount').html("(20 / 20)");
            }
        });

        // 내용 글자 수 카운팅
        $('#Ann_body').on('input', function () {
            var content = $(this).val();
            $('#bodyCount').html("("+content.length+" / 1000)"); // 글자수 실시간 카운팅

            if (content.length > 1000) {
                alert("최대 1000자까지 입력 가능합니다.");
                $(this).val(content.substring(0, 1000));
                $('#bodyCount').html("(1000 / 1000)");
            }
        });
    });
    </script>
</body>
</html>
