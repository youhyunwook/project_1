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
                // 현재 실행 중인 디렉토리 경로 가져오기
                String realPath = getServletContext().getRealPath("/");
                String pythonScriptPath = realPath + "ml_model.py";  // 현재 디렉토리 내에 있는 스크립트 경로

                // Python 스크립트 실행 
                ProcessBuilder processBuilder = new ProcessBuilder("python", pythonScriptPath);
                processBuilder.redirectErrorStream(true);
                Process process = processBuilder.start();

                try (BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()))) {
                    String line;
                    StringBuilder output = new StringBuilder();
                    while ((line = reader.readLine()) != null) {
                        output.append("<p>").append(line).append("</p>");
                    }
                }

                int exitCode = process.waitFor(); // 스크립트 실행이 끝날 때까지 대기

                if (exitCode == 0) {
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

                    response.sendRedirect("listPosts.jsp"); // 리다이렉트 호출
                } else {
                    throw new Exception("Python script failed with exit code " + exitCode);
                }

            } catch (Exception e) {
                e.printStackTrace();
                // 오류가 발생하면 alert 띄우고 index3.jsp로 리다이렉트
                out.println("<script>alert('오류가 발생했습니다. 관리자에 문의해주세요.'); location.href='index3.jsp';</script>");
            } finally {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            }
        } else {
            response.sendRedirect("index3.jsp"); // 예시로 에러 페이지로 리다이렉트
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('오류가 발생했습니다. 관리자에 문의해주세요.'); location.href='index3.jsp';</script>");
    }
}
