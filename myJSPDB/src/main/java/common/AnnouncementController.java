package common;

import java.io.IOException;
import java.io.PrintWriter;
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

        // 세션에서 관리자의 ID를 가져옵니다.
        HttpSession session = request.getSession();
        String adminId = (String) session.getAttribute("admin_id");

        // 관리자가 로그인되어 있지 않은 경우 로그인 페이지로 리다이렉트
        if (adminId == null) {
            response.sendRedirect("loginMain.jsp");
            return;
        }

        // 요청에서 공지사항 제목과 내용을 가져옵니다.
        String title = request.getParameter("Ann_title");
        String body = request.getParameter("Ann_body");

        // Announcement 객체를 생성하고 세부 정보를 설정합니다.
        Announcement Ann = new Announcement();
        Ann.setAnn_author_id(adminId); // adminId를 Ann_author_id에 설정
        Ann.setAnn_title(title);
        Ann.setAnn_body(body);

        try {
            // 공지사항을 데이터베이스에 삽입합니다.
            dao.insertAnn(Ann);
            
            // 성공 후 메인 페이지로 리다이렉트
            response.sendRedirect("AnnouncementMain.jsp");

        } catch (Exception e) {
        	response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script type='text/javascript'>");
            out.println("alert('제목(20자), 내용(1000자) 양식에 맞게 입력하세요.');");
            out.println("window.history.back();");
            out.println("</script>");
        }
    }
}
