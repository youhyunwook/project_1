package common;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
		String pwd = request.getParameter("pwd");		
				
		Admin admin = new Admin();
		admin.setId(id);
		admin.setPwd(pwd);
		
		
		try {
            boolean exAdmin = adminDao.adminLogin(admin);            
            
            if (exAdmin) {
                // 셔션정보를 저장
            	HttpSession session = request.getSession();
                session.setAttribute("id", admin.getId());
                session.setAttribute("useRole", "admin");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/adminLoginSuccess.jsp");
                dispatcher.forward(request, response);
            } else {
                // 로그인 실패시 페이지처리
                RequestDispatcher dispatcher = request.getRequestDispatcher("/loginFail.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            // 로그인 오류시 페이지 처리
            e.printStackTrace();
            request.setAttribute("errorMessage", "로그인 문제가 발생하였습니다.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/loginFail.jsp");
            dispatcher.forward(request, response);
        }
	}

}
