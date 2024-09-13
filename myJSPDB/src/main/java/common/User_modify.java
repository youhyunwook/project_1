package common;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user_modify")
public class User_modify extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (loggedInUser != null) {
            UserDao dao = new UserDao();
            try {
                User user = dao.getUserById(loggedInUser.getCustomer_user_id());
                request.setAttribute("user", user);
                request.getRequestDispatcher("UserModify.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
        } else {
            response.sendRedirect("loginMain.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (loggedInUser != null) {
            UserDao dao = new UserDao();
            User user = new User();
            user.setCustomer_user_id(loggedInUser.getCustomer_user_id());
            user.setCustomer_user_pwd(request.getParameter("customer_user_pwd"));
            user.setCustomer_user_name(request.getParameter("customer_user_name"));
            user.setCustomer_user_company(request.getParameter("customer_user_company"));
            user.setCustomer_user_phoneNumber(request.getParameter("customer_user_phoneNumber"));
            String emailId = request.getParameter("customer_user_email1");
            String emailDomain = request.getParameter("customer_user_email2");
            user.setCustomer_user_email(emailId + "@" + emailDomain);

            try {
                dao.updateUser(user);
                // Update the user information in the session
                session.setAttribute("loggedInUser", user);
                response.sendRedirect("userModify.jsp?success=1");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
        } else {
            response.sendRedirect("loginMain.jsp");
        }
    }
}
