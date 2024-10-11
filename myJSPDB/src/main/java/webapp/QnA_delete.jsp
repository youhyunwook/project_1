<%@ page import="java.sql.*" %>
<%
    String inquiryId = request.getParameter("inquiry_id");

    String driver = "org.mariadb.jdbc.Driver";
    String DB_URL1 = "jdbc:mariadb://localhost:3306/project";
    String DB_USER = "root";
    String DB_PASSWORD = "1234";

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        Class.forName(driver);
        conn = DriverManager.getConnection(DB_URL1, DB_USER, DB_PASSWORD);

        String sql = "DELETE FROM posts WHERE inquiry_id = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, inquiryId);

        int result = stmt.executeUpdate();
        if (result > 0) {
           
            response.sendRedirect("QnA_main.jsp");
            
        } else {
           
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
