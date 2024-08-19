package common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserFindPwdController
 */
@WebServlet("/UserFindPwdController")
public class UserFindPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao = new UserDao();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserFindPwdController() {
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
		String name = request.getParameter("customer_user_name");
		String email = request.getParameter("customer_user_email");
		
		User user = new User();
		user.setCustomer_user_id(id);
		user.setCustomer_user_name(name);
		user.setCustomer_user_email(email);
		
		try {
			boolean exUser = userDao.findPwd(user);
			
			if(exUser) {
				request.setAttribute("pwd", user.getCustomer_user_pwd());
			
				request.setAttribute("errorMessage", "��й�ȣ�� ã�� �� �����ϴ�. \n ���̵�, �̸�, �̸����� ��Ȯ�� �����ϼ���. ");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/findPwsucess.jsp");
				dispatcher.forward(request, response);
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/findPwfail.jsp");
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
	            // ���� ó��
	            e.printStackTrace();
	            request.setAttribute("errorMessage", "��й�ȣ�� ã�� �� ������ �߻��߽��ϴ�.");
	            RequestDispatcher dispatcher = request.getRequestDispatcher("/findPwfail.jsp");
	            dispatcher.forward(request, response);
	    }		
		
	}
}
