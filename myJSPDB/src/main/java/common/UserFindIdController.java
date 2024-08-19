package common;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserFindController
 */
@WebServlet("/UserFindIdController")
public class UserFindIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao = new UserDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserFindIdController() {
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
		String name = request.getParameter("customer_user_name");
		String email = request.getParameter("customer_user_email");
		
		User user = new User();
		user.setCustomer_user_name(name);
		user.setCustomer_user_email(email);
		
		try {
			boolean exUser = userDao.findId(user);
			
			if(exUser) {
				request.setAttribute("id", user.getCustomer_user_id());
			
				request.setAttribute("errorMessage", "ID를 찾을 수 없습니다.");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/findIdsucess.jsp");
				dispatcher.forward(request, response);
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/findIdfail.jsp");
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
	            // 예외 처리
	            e.printStackTrace();
	            request.setAttribute("errorMessage", "로그인 처리 중 오류가 발생했습니다.");
	            RequestDispatcher dispatcher = request.getRequestDispatcher("/findIdfail.jsp");
	            dispatcher.forward(request, response);
	    }		
		
	}
}
