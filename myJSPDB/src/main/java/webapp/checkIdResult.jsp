<%@ page import="java.sql.*" %>
<%
    String customer_user_id = request.getParameter("customer_user_id");
    boolean exists = false;

    if (customer_user_id != null) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/project", "root", "1234");
            String query = "SELECT COUNT(*) FROM user WHERE Customer_user_id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, customer_user_id);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                exists = rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    response.setContentType("application/json");
    response.getWriter().write("{\"exists\": " + exists + "}");
%>
