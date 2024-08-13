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
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao = new UserDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
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
				
		User user = new User();
		user.setId(id);
		user.setPassword(password);
		
		
		try {
            boolean exUser = userDao.login(user);            

            if (exUser) {
                // 로그인 성공 처리
                request.setAttribute("id", user.getId());
                request.setAttribute("name", user.getName());  // 로그인 후 이름을 보여주기 위해 name 속성값 가져오기
                RequestDispatcher dispatcher = request.getRequestDispatcher("/loginSuccess.jsp");
                dispatcher.forward(request, response);
            } else {
                // 로그인 실패 처리
                RequestDispatcher dispatcher = request.getRequestDispatcher("/loginFail.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            // 예외 처리
            e.printStackTrace();
            request.setAttribute("errorMessage", "로그인 처리 중 오류가 발생했습니다.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/loginFail.jsp");
            dispatcher.forward(request, response);
        }
	}
}


