<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="NavBar.jsp" />
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="Announcement_style.css" />
    <title>BoardMain</title>
</head>
<script>
    function check_user_login() {
        var customerUserId = '<%= session.getAttribute("id") %>';  
        if (!customerUserId || customerUserId == "null") {
            alert("로그인이 필요합니다. \n로그인 페이지로 넘어갑니다.");
            window.location.href = "loginMain.jsp";
        } else {
            window.location.href = "QnA_upload.jsp";
        }
    }
</script>
<body>
    <!-- 게시판 제목 -->
    <div id='title'>
        <h1>문의사항</h1>
    </div>
    
    <!-- DB에서 게시글의 제목을 가져와 목록으로 나열 -->
    <div id='content_box'>    
        <ul>
        <%
            String driver = "org.mariadb.jdbc.Driver";
            String DB_IP = "localhost";
            String DB_PORT = "3306";
            String DB_NAME = "project";
            String DB_USER = "root";
            String DB_PASSWORD = "1234";
            String DB_URL1 = "jdbc:mariadb://" + DB_IP + ":" + DB_PORT + "/" + DB_NAME;
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName(driver);
                conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);
                stmt = conn.createStatement();
                String sql = "SELECT * FROM posts;";
                rs = stmt.executeQuery(sql);
                
                while (rs.next()) {
                    String inquiry_id = rs.getString("inquiry_id");
                    String Customer_user_id = rs.getString("Customer_user_id");
                    String title = rs.getString("title");
                    String create_date = rs.getString("create_date");
                    String answer = rs.getString("answer");
        %>
                    <li>
                        <a href='QnA_detail.jsp?inquiry_id=<%= inquiry_id %>'><%= title %><br></a>
                        <small>작성자: <%= Customer_user_id %> | 게시일: <%= create_date %></small>
                        
                        <%
                            if (answer != null && !answer.isEmpty()) {
                        %>
                            <div style="margin-top: 10px;">
                                <strong>답변:</strong>
                                <a href='QnA_answer_detail.jsp?inquiry_id=<%= inquiry_id %>'>답변 보기</a>
                            </div>
                        <%
                            } else {
                        %>
                            <small>답변 상태: 처리중</small>
                        <%
                            }
                        %>
                    </li>
                   
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace(); }
                if (stmt != null) try { stmt.close(); } catch (Exception e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace(); }
            }
        %>
        </ul>
    </div>
    
    <!-- 문의사항 작성 버튼 -->
    <div id='button'>
        <button onclick='check_user_login()'>문의사항 작성</button>
    </div>
</body>
</html>
