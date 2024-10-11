<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="common.User" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="java.util.ArrayList" %>

<%
    HttpSession userSession = request.getSession();
    String customerUserId = (String) userSession.getAttribute("id"); 

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("org.mariadb.jdbc.Driver"); 
        conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/project", "root", "1234");

        String userInfoQuery = "SELECT Customer_user_name, Customer_user_company, Customer_user_phoneNumber, Customer_user_email FROM user WHERE Customer_user_id = ?";
        pstmt = conn.prepareStatement(userInfoQuery);
        pstmt.setString(1, customerUserId);
        rs = pstmt.executeQuery();

        String customerUserName = "";
        String customerUserCompany = "";
        String customerUserPhoneNumber = "";
        String customerUserEmail = "";

        if (rs.next()) {
            customerUserName = rs.getString("Customer_user_name");
            customerUserCompany = rs.getString("Customer_user_company");
            customerUserPhoneNumber = rs.getString("Customer_user_phoneNumber");
            customerUserEmail = rs.getString("Customer_user_email");
        }

        String postsQuery = "SELECT title FROM posts WHERE Customer_user_id = ?";
        pstmt = conn.prepareStatement(postsQuery);
        pstmt.setString(1, customerUserId);
        rs = pstmt.executeQuery();

        ArrayList<String> postTitles = new ArrayList<>();
        while (rs.next()) {
            postTitles.add(rs.getString("title"));
        }

        String analysisQuery = "SELECT request_title FROM analysis_request WHERE Customer_user_id = ?";
        pstmt = conn.prepareStatement(analysisQuery);
        pstmt.setString(1, customerUserId);
        rs = pstmt.executeQuery();

        ArrayList<String> requestTitles = new ArrayList<>();
        while (rs.next()) {
            requestTitles.add(rs.getString("request_title"));
        }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <link rel="stylesheet" href="MyPageStyle.css">
    <script>
    function toggleInfo(type) {
        const sections = {
            user: document.getElementById("user-info"),
            posts: document.getElementById("post-info"),
            requests: document.getElementById("request-info"),
            modify: document.getElementById("modify-info"),
            statistics: document.getElementById("User_statistics-info") // 새로운 섹션 추가
        };
        
        // 모든 섹션을 숨기기
        Object.values(sections).forEach(section => section.style.display = 'none');
        
        // 선택한 섹션만 표시
        if (sections[type]) {
            sections[type].style.display = 'block';
        }
    }

    toggleInfo('statistics'); // 'User_statistics-info'를 표시
        </script>

</head>
<body>
    <!-- 네비게이션 바 로딩 -->    
    <jsp:include page="NavBar.jsp" />
    <!-- 네비게이션 바 로딩 -->
   	<!-- 메인이미지  -->
	<div style="position: relative; width: 100%; height: 230px; overflow: hidden;">
	    <img src="img/MyPageImg.png" style="width: 100%; height: 230px; object-fit: cover;"/>
	    <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center; color: white;">
	        <h1 style="font-size: 2.5em; text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);">마이페이지</h1>

	    </div>
	</div>
		<div id="main_box">
		    <div id="buttons">
		        <button class="button-mypage" onclick="toggleInfo('user')">사용자 정보</button>
		        <button class="button-mypage" onclick="toggleInfo('modify')">개인정보수정</button>
		        <button class="button-mypage" onclick="toggleInfo('posts')">게시물 제목</button>
		        <button class="button-mypage" onclick="toggleInfo('requests')">분석 요청</button>		        
		       <button class="button-mypage" onclick="toggleInfo('statistics')">유저 통계</button>
		    </div>
		    <div id="info">
			    <div id="user-info" class="info" style="display: none;">
			        <h2>사용자 정보</h2>
			        <div class="user-details">
			            <p><strong>이름:</strong> <span><%= customerUserName %></span></p>
			            <p><strong>회사:</strong> <span><%= customerUserCompany %></span></p>
			            <p><strong>전화번호:</strong> <span><%= customerUserPhoneNumber %></span></p>
			            <p><strong>이메일:</strong> <span><%= customerUserEmail %></span></p>
			        </div>
			    </div>
			
			    <div id="post-info" class="info" style="display: none;">
			        <h2>게시물 제목</h2>
			        <ul class="info-list">
			            <% for (String title : postTitles) { %>
			                <li><%= title %></li>
			            <% } %>
			        </ul>
			    </div>
			
			    <div id="request-info" class="info" style="display: none;">
			        <h2>분석 요청</h2>
			        <ul class="info-list">
			            <% for (String requestTitle : requestTitles) { %>
			                <li><%= requestTitle %></li>
			            <% } %>
			        </ul>
			    </div>
			

		        
	        <div id="modify-info" class="info" style="display: none;">
			    <div class="card-front" style="position:relative; max-height:700px;">
			        <%
			            String userId = (String) session.getAttribute("id");
			            String userPassword = "", userName = "", userCompany = "", userPhoneNumber = "", userEmail = "";
			
			            if (userId != null) {
			                try {
			                    Class.forName("org.mariadb.jdbc.Driver");
			                    conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/project?useUnicode=true&characterEncoding=UTF-8", "root", "1234");
			
			                    String sql = "SELECT customer_user_pwd, customer_user_name, customer_user_company, customer_user_phoneNumber, customer_user_email FROM user WHERE customer_user_id = ?";
			                    pstmt = conn.prepareStatement(sql);
			                    pstmt.setString(1, userId);
			                    rs = pstmt.executeQuery();
			                    
			                    if (rs.next()) {
			                        userPassword = rs.getString("customer_user_pwd");
			                        userName = rs.getString("customer_user_name");
			                        userCompany = rs.getString("customer_user_company");
			                        userPhoneNumber = rs.getString("customer_user_phoneNumber");
			                        userEmail = rs.getString("customer_user_email");
			                    }
			                } catch (Exception e) {
			                    e.printStackTrace();
			                } finally {
			                    if (rs != null) rs.close();
			                    if (pstmt != null) pstmt.close();
			                    if (conn != null) conn.close();
			                }
			            }
			
			            String emailId = userEmail.split("@").length > 0 ? userEmail.split("@")[0] : "";
			            String emailDomain = userEmail.split("@").length > 1 ? userEmail.split("@")[1] : "";
			        %>
			
			        <form action="user_modify" method="post" class="modify-form">
			            <h2>정보 수정</h2>
			
			            <div class="form-group">
			                <label for="customer_user_pwd">비밀번호</label>
			                <input type="password" id="customer_user_pwd" name="customer_user_pwd" placeholder="비밀번호를 입력하세요" class="form-style" value="<%= userPassword %>" required>
			            	<p id="pwdError" style="color: red; margin-left:30px;"></p>
			            </div>
			
			            <div class="form-group">
			                <label for="customer_user_name">이름</label>
			                <input type="text" id="customer_user_name" name="customer_user_name" placeholder="이름을 입력하세요" class="form-style" value="<%= userName %>" required>
			            	<p id="nameError" style="color: red; margin-left:30px;"></p>
			            </div>
			
			            <div class="form-group">
			                <label for="customer_user_company">회사명</label>
			                <input type="text" id="customer_user_company" name="customer_user_company" placeholder="회사명을 입력하세요" class="form-style" value="<%= userCompany %>" required>
			            	<p id="companyError" style="color: red; margin-left:30px;"></p>
			            </div>
			
			            <div class="form-group">
			                <label for="customer_user_phoneNumber">전화번호</label>
			                <input type="text" id="customer_user_phoneNumber" name="customer_user_phoneNumber" placeholder="전화번호 입력 (- 제외)" class="form-style" value="<%= userPhoneNumber %>" required>
			                <p class="note">전화번호는 '-' 없이 입력하세요.</p>
			            	<p id="phoneError" style="color: red; margin-left:30px;"></p>
			            </div>
			
			            <div class="form-group">
			                <label for="customer_user_email">이메일</label>
			                <div class="email-inputs">
			                    <input type="text" id="customer_user_email1" name="customer_user_email1" class="form-style" placeholder="이메일 ID" value="<%= emailId %>" required>
			                    @
			                    <input type="text" id="customer_user_email2" name="customer_user_email2" class="form-style" placeholder="도메인 입력" value="<%= emailDomain %>" required>
			                </div>
			                <p class="note">이메일을 정확히 입력하세요 (ID/PW 분실 시 필요).</p>
			            </div>
			
			            <button type="submit" class="modify-btn">제출</button>
			        </form>
			    </div>		              
			</div>

		       
		    <div id="User_statistics-info" class="info" style="width:700px; height:500px;">
			    	  <div style="text-align: center">유저 통계
			    	  	 <canvas id="myChart" width="200px" height="200px" style="display: inline-block;"></canvas>
			    	  	 </div>
			</div>
	    </div>
	</div>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
		<%
    // 세션에서 사용자 ID를 가져옴
    String customerId = (String) session.getAttribute("id");
    
    // 데이터베이스 연결 및 쿼리 실행
    int postCount = 0;
    int requestCount = 0;

    // 데이터베이스 연결을 위한 Connection 객체 (중복 선언 방지)
   	conn = null;
    PreparedStatement stmt = null;
    rs = null;

    try {
    	   Class.forName("org.mariadb.jdbc.Driver");
           conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/project?useUnicode=true&characterEncoding=UTF-8", "root", "1234");

        String query = "SELECT " +
                        "(SELECT COUNT(*) FROM posts WHERE Customer_user_id = ?) AS post_count, " +
                        "(SELECT COUNT(*) FROM analysis_request WHERE Customer_user_id = ?) AS request_count";
        
        stmt = conn.prepareStatement(query);
        stmt.setString(1, customerId); 
        stmt.setString(2, customerId);

        rs = stmt.executeQuery();

        if (rs.next()) {
            postCount = rs.getInt("post_count");
            requestCount = rs.getInt("request_count");
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace(); }
        if (stmt != null) try { stmt.close(); } catch (Exception e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace(); }
    }
%>
<script>
const ctx = document.getElementById('myChart').getContext('2d');
const postCount = <%= postCount %>; // JSP에서 postCount를 JavaScript로 전달
const requestCount = <%= requestCount %>; // JSP에서 requestCount를 JavaScript로 전달

// 차트 생성
const myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['문의사항', '의뢰사항'], // X축 라벨
        datasets: [{
            label: '횟수',
            data: [postCount, requestCount], // 게시물 및 의뢰 횟수
            backgroundColor: [
                'rgba(75, 192, 192, 0.2)', // 문의사항 색상
                'rgba(153, 102, 255, 0.2)'  // 의뢰사항 색상
            ],
            borderColor: [
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    min: 0,           
                    max: 25,         
                    stepSize: 5,      
                    fontSize: 14     
                }
            }]
        }
    }
});
</script>
    <!-- 푸터 바 로딩 -->    
    <jsp:include page="Footer.jsp" />
    <!-- 푸터 바 로딩 -->  
    <script src="UserModifyVal.js"></script>
</body>

   
</html>

<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>