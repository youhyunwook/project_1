<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 수정</title>
    <link rel="stylesheet" href="Announcement_style.css"/>
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
    	request.setCharacterEncoding("UTF-8");
        String driver = "org.mariadb.jdbc.Driver";
        String DB_IP = "localhost";
        String DB_PORT = "3306";
        String DB_NAME = "project";
        String DB_USER = "root";
        String DB_PASSWORD = "1234";
        String DB_URL1 = "jdbc:mariadb://" + DB_IP + ":" + DB_PORT + "/" + DB_NAME;

        String Ann_id = request.getParameter("Ann_id");  // 수정할 게시글 ID
        String admin_id = (String) session.getAttribute("admin_id"); // 세션에서 관리자 ID 가져오기
        String Ann_title = "";
        String Ann_body = "";

        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
            
            // 게시글 기존 내용 가져오기
            String selectSQL = "SELECT Ann_title, Ann_body FROM announcement WHERE Ann_id = ?";
            pstmt = connection.prepareStatement(selectSQL);
            pstmt.setString(1, Ann_id);            
            rs = pstmt.executeQuery();
			
            if (rs.next()) {
                Ann_title = rs.getString("Ann_title");
                Ann_body = rs.getString("Ann_body");
            } else {
                out.println("<script>alert('게시글을 찾을 수 없습니다.'); history.back();</script>");
                return;
            }

            rs.close();
            pstmt.close();

            // 게시글 수정 폼이 제출되었을 때 처리
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String newTitle = request.getParameter("Ann_title");
                String newBody = request.getParameter("Ann_body");

                String updateSQL = "UPDATE announcement SET Ann_title=?, Ann_body=?,create_date=NOW() WHERE Ann_id=?";
                pstmt = connection.prepareStatement(updateSQL);
                pstmt.setString(1, newTitle);
                pstmt.setString(2, newBody);
                pstmt.setString(3, Ann_id);
                

                int rowsAffected = pstmt.executeUpdate();

                if (rowsAffected > 0) {
                	out.println("<script>alert('게시글 수정이 수정되었습니다.');</script>");
                    response.sendRedirect("AnnouncementMain.jsp");  // 수정 후 메인 페이지로 리다이렉트
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

	<!-- 메인이미지  -->
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
    <div id="content_box" style="position: relative; z-index: 1; margin-top: -200px ; padding: 20px; background-color: rgba(255, 255, 255, 0.8);">
        <h1 class="mb-4" style="text-align: center;">공지사항 수정</h1>
        <form action="" method="post">
            <div class="mb-3">
                <label for="Ann_title" class="form-label">제 목</label>
                <input type="text" class="form-control" id="Ann_title" name="Ann_title" value="<%= Ann_title %>" placeholder="제목을 입력해주세요" style="background-color: rgba(255, 255, 255, 0.8) !important;" required>
            </div>
            <div class="mb-3">
                <label for="Ann_body" class="form-label">내 용</label>
                <textarea class="form-control" id="Ann_body" name="Ann_body" rows="15" placeholder="내용을 입력해주세요" style="background-color: rgba(255, 255, 255, 0.8) !important;" required><%= Ann_body %></textarea>
            </div>
            <div id="button" style="text-align: center;"> <!-- 중앙 정렬 -->
                <button type="submit" style="border-radius: 5px;">등 록</button> <!-- CSS 클래스 적용 -->
            </div>
        </form>
    </div>
        

    <!-- 푸터 바 로딩 -->    
    <jsp:include page="Footer.jsp" />
    <!-- 푸터 바 로딩 -->   
</body>
</html>
