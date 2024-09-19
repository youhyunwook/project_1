package common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login")
public class UserLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao = new UserDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("customer_user_id");
		String password = request.getParameter("customer_user_pwd");		
				
		User user = new User();
		user.setCustomer_user_id(id);
		user.setCustomer_user_pwd(password);
		
		
		try {
            boolean exUser = userDao.login(user);            

            if (exUser) {
                // 로그인 성공 처리
            	HttpSession session = request.getSession();
            	session.setAttribute("id", user.getCustomer_user_id());                
                
                // 로그인 유지 체크박스가 선택된 경우 쿠키를 생성
				/*
				 * if (rememberMe != null && rememberMe.equals("on")) { Cookie userCookie = new
				 * Cookie("user", id); userCookie.setMaxAge(30 * 24 * 60 * 60); // 쿠키 유효 기간을
				 * 30일로 설정 response.addCookie(userCookie); }
				 */
                RequestDispatcher dispatcher = request.getRequestDispatcher("/customerLoginSuccess.jsp");
                dispatcher.forward(request, response);
            } else {
            	 response.setContentType("text/html; charset=UTF-8");
                 PrintWriter out = response.getWriter();
                 out.println("<script type='text/javascript'>");
                 out.println("alert('로그인 실패. 다시 시도해 주세요.');");
                 out.println("window.history.back();");
                 out.println("</script>");
            }
        } catch (Exception e) {
            // 예외 처리
            e.printStackTrace();
            request.setAttribute("errorMessage", "로그인 처리 중 오류가 발생했습니다.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
            dispatcher.forward(request, response);
        }
	}
}


