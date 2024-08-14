package common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class SignupController
 */
@WebServlet("/signup")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao = new UserDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupController() {
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
//		doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("customer_user_id");
		String password = request.getParameter("customer_user_pwd");
		String name = request.getParameter("customer_user_name");
		String address = request.getParameter("customer_user_address");
		String phoneNumber = request.getParameter("customer_user_phoneNumber");
		String email = request.getParameter("customer_user_email");
		// �� ��ü ���� �� ������ ����
		User user = new User();
		user.setCustomer_user_id(id);
		user.setCustomer_user_pwd(password);
		user.setCustomer_user_name(name);
		user.setCustomer_user_address(address);
		user.setCustomer_user_phoneNumber(phoneNumber);
		user.setCustomer_user_email(email);
		
		try {
			// ȸ������ ó��
			userDao.insertUser(user);			
		} catch(Exception e) {
			// ȸ�� ���� ���� ó��
			request.setAttribute("errorMessage", e.getMessage());
			RequestDispatcher dispatcher = request.getRequestDispatcher("/fail.jsp");
			dispatcher.forward(request, response);
			return;
		}
		
		// ���� ����� ���� ������ ��� �̵�
		request.setAttribute("id", user.getCustomer_user_id());
		RequestDispatcher dispatcher = request.getRequestDispatcher("/success.jsp");
		dispatcher.forward(request, response);
	}

}
