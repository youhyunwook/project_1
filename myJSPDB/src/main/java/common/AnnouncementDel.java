package common;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AnnouncementDel
 */
@WebServlet("/AnnouncementDel")
public class AnnouncementDel extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private AnnouncementDao dao = new AnnouncementDao();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnnouncementDel() {
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
		String postId = request.getParameter("postId");

        try {
            dao.AnnouncementDel(Integer.parseInt(postId));
            response.setStatus(HttpServletResponse.SC_OK); // 성공
            response.sendRedirect("AnnouncementMain.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 실패
        }
    }
		
}


