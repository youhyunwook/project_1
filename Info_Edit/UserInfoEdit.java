package common;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

@WebServlet("/UserInfoEdit")
public class UserInfoEdit extends HttpServlet {
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao userDAO = new UserDao();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            rs = userDAO.getUserData(); // DAO를 사용해 DB에서 데이터 가져옴

            if (rs.next()) {
                // 가져온 데이터를 request 객체에 저장
                request.setAttribute("userid", rs.getString("Customer_user_id"));
                request.setAttribute("password", rs.getString("Customer_user_pwd"));
                request.setAttribute("name", rs.getString("Customer_user_name"));
                request.setAttribute("company", rs.getString("Customer_user_company"));
                request.setAttribute("phoneNumber", rs.getString("Customer_user_phoneNumber"));
                request.setAttribute("email", rs.getString("Customer_user_email"));
            }

            // JSP로 요청을 포워딩
            RequestDispatcher dispatcher = request.getRequestDispatcher("test.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 자원 해제
            userDAO.closeConnection(conn, pstmt, rs);
        }
    }
}
