package common;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class sumitPost
 */
@WebServlet("/submitPost")
public class submitPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private boardDao dao = new boardDao();
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public submitPost() {
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
		doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
        String title = request.getParameter("title");
        String body = request.getParameter("body");
        String userId = (String) session.getAttribute("userid");
        
        board board = new board();
        board.setTitle(title);
        board.setBody(body);
        board.setCustomer_user_id(userId);
        
        try {
            dao.insertintoboard(board);
            response.sendRedirect("boardMain.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
	
}
