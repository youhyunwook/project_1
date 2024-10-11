<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 수정</title> 
	<link href="Announcement_style.css" rel='stylesheet'/>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 	
</head>
<body>
    <%
    	request.setCharacterEncoding("UTF-8");
        String driver = "org.mariadb.jdbc.Driver";
        String DB_IP = "localhost";
        String DB_PORT = "3306";
        String DB_NAME = "project";
        String DB_USER = "root";
        String DB_PASSWORD = "1234";
        String DB_URL1 = "jdbc:mariadb://" + DB_IP + ":" + DB_PORT + "/" + DB_NAME;

        String InquiryId = request.getParameter("inquiry_id");  // 수정할 게시글 ID
        String userId = (String) session.getAttribute("id"); // 세션에서 사용자 ID 가져오기
        String postTitle = "";
        String postBody = "";

        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
            
            // 게시글 기존 내용 가져오기
            String selectSQL = "SELECT title, body FROM posts WHERE inquiry_id = ? AND Customer_user_id = ?";
            pstmt = connection.prepareStatement(selectSQL);
            pstmt.setString(1, InquiryId);
            pstmt.setString(2, userId); // 본인 글만 수정 가능하도록
            rs = pstmt.executeQuery();

            if (rs.next()) {
                postTitle = rs.getString("title");
                postBody = rs.getString("body");
            } else {
                out.println("<script>alert('게시글을 찾을 수 없습니다.'); history.back();</script>");
                return;
            }

            rs.close();
            pstmt.close();

            // 게시글 수정 폼이 제출되었을 때 처리
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String newTitle = request.getParameter("title");
                String newBody = request.getParameter("body");

                String updateSQL = "UPDATE posts SET title=?, body=? WHERE inquiry_id=? AND Customer_user_id=?";
                pstmt = connection.prepareStatement(updateSQL);
                pstmt.setString(1, newTitle);
                pstmt.setString(2, newBody);
                pstmt.setString(3, InquiryId);
                pstmt.setString(4, userId);

                int rowsAffected = pstmt.executeUpdate();

                if (rowsAffected > 0) {
                	out.println("<script>alert('게시글 수정이 수정되었습니다.');</script>");
                    response.sendRedirect("QnA_main.jsp");  // 수정 후 메인 페이지로 리다이렉트
                } else {
                    out.println("<script>alert('게시글 수정에 실패했습니다.');</script>");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('오류가 발생했습니다. 다시 시도해주세요.');</script>");
        } finally {
            if (rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace(); }
            if (pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
            if (connection != null) try { connection.close(); } catch (Exception e) { e.printStackTrace(); }
        }
    %>
<!--네비게이션 바 로딩 -->    
<jsp:include page="NavBar.jsp" />
<!-- 네비게이션 바 로딩 -->

    <!-- 메인 이미지 -->
	<div style="position: relative; width: 100%; height: auto; overflow: hidden;">
	    <img src="img/QnAImg.png" style="width: 100%; height: 600px; object-fit: cover;"/>
	    <div style="position: absolute; top: 30%; left: 50%; transform: translate(-50%, -50%); text-align: center; color: white;">
	        <h1 style="font-size: 2.5em; text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);">문의 게시판</h1>
	        <hr style="border: 3px solid white; width: 50%; margin: 10px auto;"/>
	        <p style="font-size: 1.5em; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.7);">데이터 분석의 선두주자로서 고객 문의를 성심성의껏<br>답변해드립니다. </p>
	        <hr style="border: 3px solid white; width: 50%; margin: 10px auto;"/>
	    </div>
	</div>

    <!-- 메인 내용 -->
    <div id="content_box" style="position: relative; z-index: 1; margin-top: -200px ; padding: 20px; background-color: rgba(255, 255, 255, 0.8);">
        <h1 class="mb-4" style="text-align: center;">게시글 수정</h1>
        <form action="" method="post">
            <div class="mb-3">
                <label for="QnA_title" class="form-label">제 목</label>
                <input type="text" class="form-control" id="QnA_title" name="title" value="<%= postTitle %>" placeholder="제목을 입력해주세요" style="background-color: rgba(255, 255, 255, 0.8) !important;" maxlength="20" required>
                <span id="titleCount" class="text-muted">(0 /20) </span> <!-- 카운팅 -->
            </div>
            <div class="mb-3">
                <label for="body" class="form-label">내 용</label>
                <textarea class="form-control" id="body" name="body" rows="15" placeholder="내용을 입력해주세요" style="background-color: rgba(255, 255, 255, 0.8) !important;" maxlength="1000" required><%= postBody %></textarea>
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
        $('#body').on('input', function () {
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
