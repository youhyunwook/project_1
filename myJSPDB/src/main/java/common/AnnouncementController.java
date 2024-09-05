package common;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class announcementController
 */
@WebServlet("/AnnController")
public class AnnouncementController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AnnouncementDao dao = new AnnouncementDao();
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnnouncementController() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // 세션에서 관리자의 ID를 가져옵니다. Ann_id, Ann_author_id, Ann_title, Ann_body, create_date
        HttpSession session = request.getSession();
        String adminId = (String) session.getAttribute("id");
        String title = (String) request.getParameter("Ann_title");
        String body = (String) request.getParameter("Ann_body");        

        // 관리자가 로그인되어 있지 않은 경우 로그인 페이지로 리다이렉트
        if (adminId == null) {
        	response.sendRedirect("loginMain.jsp");
            return;
        }

        // 요청에서 공지사항 세부 정보를 가져옵니다.
        // Announcement 객체를 생성하고 세부 정보를 설정합니다.
        Announcement Ann = new Announcement();        
        Ann.setAnn_title(title);
        Ann.setAnn_body(body);
        Ann.setAnn_author_id(adminId);
        
        try {
            // 공지사항을 데이터베이스에 삽입합니다.
            dao.insertAnn(Ann);
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("AnnouncementMain.jsp");
            dispatcher.forward(request, response);  
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "공지사항 처리 중 오류가 발생했습니다.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/findPwfail.jsp");
            dispatcher.forward(request, response);
        }
    }
}
