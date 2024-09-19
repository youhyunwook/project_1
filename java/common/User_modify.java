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
        String loggedInUserId = (String) session.getAttribute("id"); // 사용자 ID 가져오기
        System.out.println(loggedInUserId);
        
        if (loggedInUserId != null) {
            UserDao dao = new UserDao();
            try {
                User user = dao.getUserById(loggedInUserId); // ID로 사용자 정보 조회
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
    	request.setCharacterEncoding("UTF-8");
    	HttpSession session = request.getSession();
        String loggedInUserId = (String) session.getAttribute("id"); // 사용자 ID 가져오기
        System.out.println(loggedInUserId);
        
        if (loggedInUserId != null) {
            UserDao dao = new UserDao();
            User user = new User();
            user.setCustomer_user_id(loggedInUserId); // 가져온 ID로 사용자 ID 설정
            user.setCustomer_user_pwd(request.getParameter("customer_user_pwd"));
            user.setCustomer_user_name(request.getParameter("customer_user_name"));
            user.setCustomer_user_company(request.getParameter("customer_user_company"));
            user.setCustomer_user_phoneNumber(request.getParameter("customer_user_phoneNumber"));
            String emailId = request.getParameter("customer_user_email1");
            String emailDomain = request.getParameter("customer_user_email2");
            user.setCustomer_user_email(emailId + "@" + emailDomain);

            try {
                dao.updateUser(request, user);
                // 세션에 사용자 정보 업데이트
                session.setAttribute("user", user); // User 객체를 "user"로 저장
                response.sendRedirect("index3.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
        } else {
            response.sendRedirect("UserModify.jsp");
        }
    }
}

