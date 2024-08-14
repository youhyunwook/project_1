package common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminSignup
 */
@WebServlet("/AdminSignup")
public class AdminSignup extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminDao adminDao = new AdminDao();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSignup() {
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
		String name = request.getParameter("name");
		String scode = request.getParameter("scode");
		// �� ��ü ���� �� ������ ����
		Admin admin = new Admin();
		admin.setId(id);
		admin.setPassword(password);
		admin.setName(name);
		admin.setScode(scode);
		
		try {
			// ȸ������ ó��
			adminDao.insertAdmin(admin);			
		} catch(Exception e) {
			// ȸ�� ���� ���� ó��
			request.setAttribute("errorMessage", e.getMessage());
			RequestDispatcher dispatcher = request.getRequestDispatcher("/fail.jsp");
			dispatcher.forward(request, response);
			return;
		}
		
		// ���� ����� ���� ������ ��� �̵�
		request.setAttribute("id", admin.getId());
		RequestDispatcher dispatcher = request.getRequestDispatcher("/success.jsp");
		dispatcher.forward(request, response);
	}

}
