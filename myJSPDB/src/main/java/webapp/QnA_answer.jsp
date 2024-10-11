<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 요청 인코딩 설정
    request.setCharacterEncoding("UTF-8");

    String driver = "org.mariadb.jdbc.Driver";
    String DB_URL = "jdbc:mariadb://localhost:3306/project";
    String DB_USER = "root";
    String DB_PASSWORD = "1234";

    String InquiryId = request.getParameter("inquiry_id");
	String adminId = (String) session.getAttribute("admin_id");
    String post_title = request.getParameter("post");
    String answer = "";

    Connection connection = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName(driver);
        connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        
        // 기존 답변 가져오기
        String selectSQL = "SELECT answer FROM posts WHERE inquiry_id = ?";
        pstmt = connection.prepareStatement(selectSQL);
        pstmt.setString(1, InquiryId);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            answer = rs.getString("answer");
        }

        rs.close();
        pstmt.close();

        // 폼이 제출되었을 때 처리
        if ("POST".equalsIgnoreCase(request.getMethod())) {  
            String newAnswer = request.getParameter("body");

            if (newAnswer != null && !newAnswer.trim().isEmpty()) {
                String updateSQL = "UPDATE posts SET admin_id=?, answer=? WHERE inquiry_id=?";
                pstmt = connection.prepareStatement(updateSQL);
                pstmt.setString(1, adminId);
                pstmt.setString(2, newAnswer);
                pstmt.setString(3, InquiryId);

                int rowsAffected = pstmt.executeUpdate();

                if (rowsAffected > 0) {
                	out.println("<script>alert('답변이 등록되었습니다.');</script>");
                    response.sendRedirect("QnA_main.jsp");
                } else {
                    out.println("<script>alert('답변 등록에 실패했습니다.');</script>");
                }
            } else {
                out.println("<script>alert('답변을 입력해야 합니다.');</script>");
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

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>답변하기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="Announcement_style.css" rel="stylesheet">
    <style>
        #posttitle { text-align: center; }
        #container { text-align: center; height: 500px; display: flex; }
        #button { text-align: center; }
        div.left, div.center, div.right { flex: 1; }
        div.center { flex: 3; }
    </style>
</head>
<body>
<jsp:include page="NavBar.jsp" />

<form action="" method='post'>
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
    <div id='container'>
        <div class='left'></div>
        <div class='center'>
            <div id='posttitle'>
                <h2><%= post_title %>에 대한 답변</h2>
            </div><br>
            <div id="content_box">
            	<textarea class="form-control" name="body" style="border: none;" maxlength="250" placeholder="답변 입력" required></textarea>
            </div>
        </div>
        <div class='right'></div>
    </div>
    <div id='button'>
        <button type="submit" style="border-radius: 5px;">등록</button>
        <button type="button" style="border-radius: 5px;" onclick="window.history.back()">취소</button>
    </div>
</form><br>
<jsp:include page="Footer.jsp" />
</body>
</html>
