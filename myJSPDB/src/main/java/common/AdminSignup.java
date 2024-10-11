package common;

import java.io.IOException;
import java.io.PrintWriter;
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
	    request.setCharacterEncoding("UTF-8");
	    String id = request.getParameter("id");
	    String pwd = request.getParameter("pwd");
	    String name = request.getParameter("name");
	    String em_code = request.getParameter("Em_code");
	    System.out.println(em_code);
	    
	    Admin admin = new Admin();
	    admin.setId(id);
	    admin.setPwd(pwd);
	    admin.setName(name);
	    admin.setEm_code(em_code);

	    // em_code가 "AA001"일 때만 회원가입 진행
	    if ("AA001".equals(em_code)) {
	        try {
	          
	            adminDao.insertAdmin(admin);
	            
	            response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            request.setAttribute("id", admin.getId());
	            out.println("<script type='text/javascript'>");
	            out.println("alert('가입이 완료되었습니다. 로그인 하세요.');");
	            out.println("window.location.href='index3.jsp';");
	            out.println("</script>");
	        } catch (Exception e) {
	            response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script type='text/javascript'>");
	            out.println("alert('양식에 맞게 작성하거나 이미 가입된 ID입니다.');");
	            out.println("window.history.back();");
	            out.println("</script>");
	        }
	    } else {
	        // em_code가 다른 경우에 대한 처리
	        response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script type='text/javascript'>");
	        out.println("alert('유효하지 않은 코드입니다.');");
	        out.println("window.history.back();");
	        out.println("</script>");
	    }
	}
}
