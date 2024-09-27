<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*, org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>업로드 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>  
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="Main_page.js"></script>
    <style>
.loading {
    display: none; /* 기본적으로 숨김 */
    position: fixed;
    top: 50%;
    left: 50%; /* 왼쪽을 50%로 설정 */
    transform: translate(-50%, -50%); /* 중앙 정렬 */
    width: auto; /* 너비를 자동으로 조정 */
    height: auto; /* 높이를 자동으로 조정 */
    background-color: transparent; /* 배경을 투명하게 설정 */
    text-align: center;
    padding: 20px; /* 패딩 조정 */
    font-size: 18px; /* 글자 크기 조정 */
    border: none; /* 경계 제거 */
    box-shadow: none; /* 그림자 제거 */
}


.spinner-border {
    animation: spin 1s linear infinite; /* 애니메이션 효과 */
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}

    </style>
</head>
<body>
    <!-- 네비게이션 바 로딩 -->    
    <jsp:include page="NavBar.jsp" />
    <!-- 네비게이션 바 로딩 -->
    <div class="container mt-4">
        <h1 class="mb-4">게시글 작성</h1>
        <form id="uploadForm" action="upload_test.jsp" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="requestTitle" class="form-label">Title</label>
                <input type="text" class="form-control" id="requestTitle" name="request_title" placeholder="제목을 입력해주세요" required>
            </div>
            <div class="mb-3">
                <label for="requestBody" class="form-label">Contents</label>
                <textarea class="form-control" id="requestBody" name="request_body" rows="15" placeholder="내용을 입력해주세요" required></textarea>
            </div>
            <div class="mb-3">
                <label for="fileUpload" class="form-label">파일 업로드</label>
                <input class="form-control" type="file" id="fileUpload" name="request_file" accept=".csv" required />
                <p id="fileError" style="color: red;"></p>
            </div>
            <button id="submit-button" type="submit" class="btn btn-outline-dark">Upload</button>
        </form>
        <A href="listPosts.jsp"><button>리스트</button></A>
        <div id="loading" class="loading">
            <button class="btn btn-info" type="button" disabled>
                <span class="spinner-border spinner-border-sm" aria-hidden="true"></span>
                <span role="status">파일을 업로드하는 동안 잠시만 기다려 주세요...</span>
            </button>
        </div>

        <%
     
        String C_id = (String) session.getAttribute("id");

        // 서버 측 처리
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            try {
                List<FileItem> items = upload.parseRequest(request);
                String requestTitle = null;
                String requestBody = null;
                InputStream fileContent = null;

                for (FileItem item : items) {
                    if (item.isFormField()) {
                        if ("request_title".equals(item.getFieldName())) {
                            requestTitle = item.getString("UTF-8");
                        } else if ("request_body".equals(item.getFieldName())) {
                            requestBody = item.getString("UTF-8");
                        }
                    } else {
                        if ("request_file".equals(item.getFieldName())) {
                            fileContent = item.getInputStream();
                        }
                    }
                }

                if (requestTitle != null && requestBody != null && fileContent != null) {
                    Connection connection = null;
                    PreparedStatement statement = null;

                    try {
                        // 데이터베이스 연결
                        Class.forName("org.mariadb.jdbc.Driver");
                        connection = DriverManager.getConnection("jdbc:mariadb://localhost:3306/project?useUnicode=true&characterEncoding=UTF-8", "root", "1234");

                        // SQL 쿼리 준비
                        String sql = "INSERT INTO analysis_request (Customer_user_id, request_title, request_body, request_file, create_date) VALUES (?, ?, ?, ?, NOW())";
                        statement = connection.prepareStatement(sql);
                        statement.setString(1, C_id);
                        statement.setString(2, requestTitle);
                        statement.setString(3, requestBody);
                        statement.setBinaryStream(4, fileContent);

                        // 쿼리 실행
                        statement.executeUpdate();

                        // Python 스크립트 실행 
                        String pythonScriptPath = "C:\\Users\\LEE\\Desktop\\ml_model.py";
                        ProcessBuilder processBuilder = new ProcessBuilder("python", pythonScriptPath);
                        processBuilder.redirectErrorStream(true);
                        Process process = processBuilder.start();

                        try (BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()))) {
                            String line;
                            StringBuilder output = new StringBuilder();
                            while ((line = reader.readLine()) != null) {
                                output.append("<p>").append(line).append("</p>");
                            }
                            // 이 부분은 response.getWriter() 대신 로깅 또는 다른 방법으로 처리할 수 있습니다.
                        }

                        process.waitFor(); // 스크립트 실행이 끝날 때까지 대기

                        response.sendRedirect("listPosts.jsp"); // 리다이렉트 호출

                    } catch (Exception e) {
                        e.printStackTrace();
                        // 에러 메시지를 로깅하거나 다른 처리
                    } finally {
                        if (statement != null) statement.close();
                        if (connection != null) connection.close();
                    }
                } else {
                   
                    response.sendRedirect("errorPage.jsp"); 
                }
            } catch (Exception e) {
                e.printStackTrace();
             
            }
        }
      
        %>

    </div><br>
    <!-- 푸터 바 로딩 -->    
    <jsp:include page="Footer.jsp" />
    <!-- 푸터 바 로딩 -->  
</body>
</html>
