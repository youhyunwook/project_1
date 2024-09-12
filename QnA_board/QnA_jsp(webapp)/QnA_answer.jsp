<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Answer</title>
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

        String InquiryId = request.getParameter("inquiry_id");
        String adminId = (String) session.getAttribute("admin_id");
        String post_title = request.getParameter("post");
        String answer = "";

        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);

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

            if ("POST".equalsIgnoreCase(request.getMethod())) {  // 폼이 제출되었을 때 처리
                String newAnswer = request.getParameter("body");

                String updateSQL = "UPDATE posts SET admin_id=?, answer=? WHERE inquiry_id=?";
                pstmt = connection.prepareStatement(updateSQL);
                pstmt.setString(1, adminId);
                pstmt.setString(2, newAnswer);
                pstmt.setString(3, InquiryId);

                int rowsAffected = pstmt.executeUpdate();

                if (rowsAffected > 0) {
                    response.sendRedirect("QnA_main.jsp");
                } else {
                    out.println("<script>alert('답변 등록에 실패했습니다.');</script>");
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

    <form action="" method='post'>
        <h1>문의사항 답변</h1>
        <div id='container'>
            <div class='left'></div>
            <div class='center'>
                <div id='posttitle'>
                    <h2><%= post_title %>에 대한 답변</h2>
                </div><br>
                <textarea class="form-control" id="body" name="body" rows="15" required><%= answer %></textarea>
            </div>
            <div class='right'></div>
        </div>
        <div id='button'>
            <button type="submit" class="btn btn-primary">등록</button>
            <button type="button" class="btn btn-secondary" onclick="window.history.back()">취소</button>
        </div>
    </form>
</body>
</html>
