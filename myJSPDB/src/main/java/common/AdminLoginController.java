package common;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

/**
 * Servlet implementation class AdminLoginController
 */
@WebServlet("/adminlogin")
public class AdminLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminDao adminDao = new AdminDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginController() {
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
		String id = request.getParameter("id");
		String password = request.getParameter("password");		
				
		Admin admin = new Admin();
		admin.setId(id);
		admin.setPassword(password);
		
		
		try {
            boolean exAdmin = adminDao.adminLogin(admin);            

            if (exAdmin) {
                // �α��� ���� ó��
                request.setAttribute("id", admin.getId());
                request.setAttribute("name", admin.getName());  // �α��� �� �̸��� �����ֱ� ���� name �Ӽ��� ��������
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
