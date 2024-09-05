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
    <!-- 자바스크립트 파일 참조 -->
  
</head>
<body>
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

        <%
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
                                requestTitle = item.getString("UTF-8");  // 인코딩 설정
                            } else if ("request_body".equals(item.getFieldName())) {
                                requestBody = item.getString("UTF-8");  // 인코딩 설정
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
                            String sql = "INSERT INTO analysis_request (request_title, request_body, request_file, cereate_date) VALUES (?, ?, ?, NOW())";
                            statement = connection.prepareStatement(sql);
                            statement.setString(1, requestTitle);
                            statement.setString(2, requestBody);
                            statement.setBinaryStream(3, fileContent, (int) fileContent.available());

                            // 쿼리 실행
                            statement.executeUpdate();
                            out.println("<p>게시글과 CSV 파일이 성공적으로 저장되었습니다!</p>");

                            // Python 스크립트 실행 및 진행 상황 모니터링
                            String pythonScriptPath = getServletContext().getRealPath("/ml_model.py");
                            ProcessBuilder processBuilder = new ProcessBuilder("python", pythonScriptPath);
                            processBuilder.redirectErrorStream(true); // 에러 스트림을 출력 스트림과 합침
                            Process process = processBuilder.start();

                            // 읽기 스레드로 진행 상황 모니터링
                            try (BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()))) {
                                String line;
                                while ((line = reader.readLine()) != null) {
                                    out.println("<p>" + line + "</p>");
                                }a
                            }

                            process.waitFor(); // 스크립트 실행이 끝날 때까지 대기

                            // 리다이렉트
                            response.sendRedirect("listPosts.jsp");
                        } catch (Exception e) {
                            e.printStackTrace();
                            out.println("<p>오류 발생: " + e.getMessage() + "</p>");
                        } finally {
                            if (statement != null) statement.close();
                            if (connection != null) connection.close();
                        }
                    } else {
                        out.println("<p>모든 필드를 채워주세요.</p>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<p>파일 업로드 실패: " + e.getMessage() + "</p>");
                }
            }
        %>
    </div>
<script src="Main_page.js"></script>
</body>
</html>
