package common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


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
                // �α��� ���� ó��
                request.setAttribute("id", user.getCustomer_user_id());
                request.setAttribute("name", user.getCustomer_user_name());  // �α��� �� �̸��� �����ֱ� ���� name �Ӽ��� ��������
                RequestDispatcher dispatcher = request.getRequestDispatcher("/loginSuccess.jsp");
                dispatcher.forward(request, response);
            } else {
                // �α��� ���� ó��
                RequestDispatcher dispatcher = request.getRequestDispatcher("/loginFail.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            // ���� ó��
            e.printStackTrace();
            request.setAttribute("errorMessage", "�α��� ó�� �� ������ �߻��߽��ϴ�.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/loginFail.jsp");
            dispatcher.forward(request, response);
        }
	}
}


