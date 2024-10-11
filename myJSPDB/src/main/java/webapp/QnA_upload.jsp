<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Upload</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link href="Announcement_style.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 
</head>
<body>
    <!-- 네비바 -->
    <jsp:include page="NavBar.jsp" />
    <!-- 메인 이미지 -->
    <div style="position: relative; width: 100%; height: 230px; overflow: hidden;">
        <img src="img/QnAImg.png" style="width: 100%; height: 230px; object-fit: cover;"/>
        <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center; color: white;">
            <h1 style="font-size: 2.5em; text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);">문의 게시판</h1>
            <hr style="border: 3px solid white; width: 50%; margin: 10px auto;"/>
            <p style="font-size: 1.5em; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.7);">데이터 분석의 선두주자로서 고객 문의를 성심성의껏<br>답변해드립니다. </p>
            <hr style="border: 3px solid white; width: 50%; margin: 10px auto;"/>
        </div>
    </div>

    <form action="" method='post'>
    <div id="content_box" class="container mt-4">
        <div id='container mt-4'>
            <div class="mb-3">
                <label class="form-label">Title</label>
                <input id="QnA_title" type="text" class="form-control" name="title" placeholder="제목을 입력해주세요" maxlength="20" required oninput="updateTitleCount()">
                <span id="titleCount" class="text-muted">(0 /20) </span> <!-- 카운팅 -->
            </div>
            <div class="mb-3">
                <label class="form-label">Contents</label>
                <textarea id="QnA_body" class="form-control" id="body" name="body" rows="15" placeholder="내용을 입력해주세요" maxlength="1000" required oninput="updateBodyCount()"></textarea>
                <span id="bodyCount" class="text-muted">(0 /1000) </span> <!-- 카운팅 -->
            </div>
            <div class='right'></div>
        </div>
    </div>

        <div id='button' style="text-align: center;"> <!-- 중앙 정렬 -->
            <button type="submit" style="border-radius: 5px;">등록</button> <!-- CSS 클래스 적용 -->
            <button type="button" onclick="window.history.back()" style="border-radius: 5px;">취소</button>
        </div>
    </form>

    <%
        // 폼이 제출된 경우
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            request.setCharacterEncoding("UTF-8");
            HttpSession currentSession = request.getSession();
            String userId = (String) currentSession.getAttribute("id");

            if (userId != null) {
                String title = request.getParameter("title");
                String body = request.getParameter("body");

                // 데이터베이스 연결
                Connection conn = null;
                PreparedStatement pstmt = null;

                try {
                    Class.forName("org.mariadb.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/project?useUnicode=true&characterEncoding=UTF-8", "root", "1234");

                    // SQL 쿼리
                    String sql = "INSERT INTO posts (Customer_user_id, title, body, create_date) VALUES (?, ?, ?, NOW())";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, userId);
                    pstmt.setString(2, title);
                    pstmt.setString(3, body);

                    pstmt.executeUpdate();
                    out.println("<script>alert('문의가 등록되었습니다.'); window.location.href='QnA_main.jsp';</script>");
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<script>alert('문의 등록 중 오류가 발생했습니다.'); window.location.href='error.jsp';</script>");
                } finally {
                    if (pstmt != null) try { pstmt.close(); } catch (Exception e) { }
                    if (conn != null) try { conn.close(); } catch (Exception e) { }
                }
            } else {
                out.println("<script>alert('로그인이 필요합니다.'); window.location.href='login.jsp';</script>");
            }
        }
    %>
    <script>
    $(document).ready(function () {
        // 제목 글자 수 카운팅
        $('#QnA_title').on('input', function () {
            var content = $(this).val();
            $('#titleCount').html("("+content.length+" / 20)"); // 글자수 실시간 카운팅

            if (content.length > 20) {
                alert("최대 20자까지 입력 가능합니다.");
                $(this).val(content.substring(0, 20));
                $('#titleCount').html("(20 / 20)");
            }
        });

        // 내용 글자 수 카운팅
        $('#QnA_body').on('input', function () {
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
    <!-- 푸터 바 로딩 -->    
    <jsp:include page="Footer.jsp" />
    <!-- 푸터 바 로딩 -->  
</body>
</html>
