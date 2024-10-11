<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.PreparedStatement" %>
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

    <!-- 게시판 제목 -->
    <div id='content_box' style="position: relative; z-index: 1; margin-top: -180px; padding: 20px; background-color: rgba(255, 255, 255, 0.8);"> 
        <ul>        	
            <!-- 검색창 -->
            <div id='search_box' style="display: flex; justify-content: center; margin-bottom: 20px;">
                <form action="QnA_main.jsp" method="get" style="position: relative; width: 500px;">
                    <input type="text" name="searchQuery" placeholder="작성자 또는 제목을 입력하세요" style="width: 100%; height: 45px; padding-right: 50px; box-sizing: border-box;" />
                    <button type="submit" style="position: absolute; right: 0px; top: 50%; transform: translateY(-50%); height: 45px;">검색</button>
                </form>
            </div>
            
            <%
            String searchQuery = request.getParameter("searchQuery"); // 검색창    
            String driver = "org.mariadb.jdbc.Driver";
            String DB_URL = "jdbc:mariadb://localhost:3306/project";
            String DB_USER = "root";
            String DB_PASSWORD = "1234";
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName(driver);
                conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                String sql = "SELECT * FROM posts";
                
                // 검색어가 있는 경우에만 WHERE 구문을 추가
                if (searchQuery != null && !searchQuery.isEmpty()) {
                    sql += " WHERE title LIKE ? OR Customer_user_id LIKE ?";
                }
                sql += " ORDER BY create_date DESC";

                pstmt = conn.prepareStatement(sql);
                
                // 검색어가 있는 경우 PreparedStatement에 값 설정
                if (searchQuery != null && !searchQuery.isEmpty()) {
                    pstmt.setString(1, "%" + searchQuery + "%");
                    pstmt.setString(2, "%" + searchQuery + "%");
                }

                rs = pstmt.executeQuery();
                boolean hasResults = false; // 결과가 있는지 체크

                while (rs.next()) {
                    hasResults = true; // 결과가 있음
                    String inquiry_id = rs.getString("inquiry_id");
                    String Customer_user_id = rs.getString("Customer_user_id");
                    String title = rs.getString("title");
                    String create_date = rs.getString("create_date");
                    String answer = rs.getString("answer");
            %>
                
                <li>
                    <a style="font-size:20px;" href='QnA_detail.jsp?inquiry_id=<%= inquiry_id %>'><%= title %><br></a>
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
                if (!hasResults) {
            %>
                    <li>검색 결과가 없습니다.</li>
            <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace(); }
                if (pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace(); }
            }
            %>
        </ul>
    </div>
    
    <!-- 문의사항 작성 버튼 -->
    <div id='button'>
        <button onclick='check_user_login()'>문의사항 작성</button>
    </div>
    
    <!-- 푸터 바 로딩 -->    
    <jsp:include page="Footer.jsp" />
</body>
</html>
