package common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Properties;

@WebServlet("/UserFindIdController")
public class UserFindIdController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao = new UserDao();

    public UserFindIdController() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("customer_user_name");
        String email = request.getParameter("customer_user_email");

        User user = new User();
        user.setCustomer_user_name(name);
        user.setCustomer_user_email(email);

        try {
            String foundId = userDao.findId(user); // 사용자 ID를 반환받음
            
            if (foundId != null) {
            	sendEmail(email, foundId); 
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script type='text/javascript'>");
                out.println("alert('귀하의 ID가 이메일로 전송되었습니다.');");
                out.println("window.location.href='index3.jsp';");
                out.println("</script>");
                  
                
                
            } else {
            	response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script type='text/javascript'>");
                out.println("alert('가입되지 않은 이름과 이메일입니다.');");
                out.println("window.history.back();");
                out.println("</script>");
            }
        } catch (Exception e) {
        	response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script type='text/javascript'>");
            out.println("alert('오류가 발생했습니다. 다시 시도하거나 담당자 문의바랍니다.');");
            out.println("window.history.back();");
            out.println("</script>");
        }
    }


    private void sendEmail(String recipientEmail, String userId) {
    	String host = "smtp.gmail.com";
    	final String user = "evelth4@gmail.com"; // Gmail 주소
    	final String password = "kgpd lone pfby upob"; // 애플리케이션 비밀번호

        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "587"); // SMTP 포트 설정
;
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("귀하의 ID 정보");
            message.setText("귀하의 ID는:   " + userId);

            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
