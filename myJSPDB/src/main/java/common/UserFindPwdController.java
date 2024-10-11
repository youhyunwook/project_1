package common;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserFindPwdController
 */
@WebServlet("/UserFindPwdController")
public class UserFindPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao = new UserDao();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserFindPwdController() {
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
        String id = request.getParameter("customer_user_id");
        String name = request.getParameter("customer_user_name");
        String email = request.getParameter("customer_user_email");
        
        User user = new User();
        user.setCustomer_user_id(id);
        user.setCustomer_user_name(name);
        user.setCustomer_user_email(email);
        
        try {
            String foundPwd = userDao.findPwd(user); // 비밀번호를 반환받음
            
            if (foundPwd != null) {
                // 비밀번호를 이메일로 전송
                sendEmail(email, foundPwd);
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script type='text/javascript'>");
                out.println("alert('귀하의 Password가 이메일로 전송되었습니다.');");
                out.println("window.location.href='index3.jsp';");
                out.println("</script>");
            } else {
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script type='text/javascript'>");
                out.println("alert('ID와 이름, Email이 잘못 입력되었습니다.');");
                out.println("window.history.back();");
                out.println("</script>");
            }
        } catch (Exception e) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script type='text/javascript'>");
            out.println("alert('오류가 발생했습니다. 다시 시도하거나 담당자에게 문의 바랍니다.');");
            out.println("window.history.back();");
            out.println("</script>");
        }
    }

    private void sendEmail(String recipientEmail, String userPwd) {
        String host = "smtp.gmail.com";
        final String user = "evelth4@gmail.com"; // Gmail 주소
        final String password = "kgpd lone pfby upob"; // 애플리케이션 전용 비밀번호

        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "587"); // SMTP 포트 설정

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("귀하의 비밀번호 정보");
            message.setText("귀하의 비밀번호는:   " + userPwd);

            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
