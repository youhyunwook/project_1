<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style>
        #posttitle {
            text-align: center;
        }
        #container {
            text-align: center;
            height: 500px;
            display: flex;
        }
        #button {
            text-align: center;
        }
        div.left {
            flex: 1;
        }
        div.center {
            flex: 3;
        }
        div.right {
            flex: 1;
        }
    </style>
</head>
<body>
    <%
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

    <form action="" method="post">
        <h1>게시글 수정</h1>
        <div id="container">
            <div class="left"></div>
            <div class="center">
                <div id="posttitle">
                    <h2>게시글 수정</h2>
                </div><br>
                <label for="title">제목:</label>
                <input type="text" class="form-control" id="title" name="title" value="<%= postTitle %>" required><br>

                <label for="body">내용:</label><br>
                <textarea class="form-control" id="body" name="body" rows="15" required><%= postBody %></textarea>
            </div>
            <div class="right"></div>
        </div>
        <div id="button">
            <button type="submit" class="btn btn-primary">수정</button>
            <button type="button" class="btn btn-secondary" onclick="window.history.back()">취소</button>
        </div>
    </form>
</body>
</html>
