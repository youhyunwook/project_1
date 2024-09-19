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
    <form action="" method='post'>
        <div id='container'>
            <div class='left'></div>
            <div class='center'>
                <div id='posttitle'>
                    <label for="title" class="form-label">Title</label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요" required>
                </div><br>
                <label for="body" class="form-label">Contents</label>
                <textarea class="form-control" id="body" name="body" rows="15" placeholder="내용을 입력해주세요" required></textarea>
            </div>
            <div class='right'></div>
        </div>
        <div id='button'>
            <button type="submit" class="btn btn-primary">등록</button>
            <button type="button" class="btn btn-secondary" onclick="window.history.back()">취소</button>
        </div>
    </form>

    <%
        // 폼이 제출된 경우
        if ("POST".equalsIgnoreCase(request.getMethod())) {
        	request.setCharacterEncoding("UTF-8");
            HttpSession currentSession = request.getSession(); // 세션 변수를 다른 이름으로 선언
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

                    // SQL 쿼리 (admin_id와 answer 제외)
                    String sql = "INSERT INTO posts (Customer_user_id, title, body, create_date) VALUES (?, ?, ?, NOW())";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, userId); // 작성자 ID
                    pstmt.setString(2, title);
                    pstmt.setString(3, body);

                    pstmt.executeUpdate();
                    out.println("<script>alert('문의가 등록되었습니다.'); window.location.href='QnA_main.jsp';</script>"); // 성공 시 알림
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<script>alert('문의 등록 중 오류가 발생했습니다.'); window.location.href='error.jsp';</script>"); // 에러 발생 시 알림
                } finally {
                    if (pstmt != null) try { pstmt.close(); } catch (Exception e) { }
                    if (conn != null) try { conn.close(); } catch (Exception e) { }
                }
            } else {
                out.println("<script>alert('로그인이 필요합니다.'); window.location.href='login.jsp';</script>"); // 세션이 없을 경우 로그인 페이지로 리다이렉트
            }
        }
    %>
</body>
</html>
