package mail;

import java.util.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * 
 * @author Tuấn Anh
 */
public class Mail {

	public static void sendMail(String smtpServer, String toMail, String username,
			String pass, String subject, String body) throws Exception {
		/*
		 * smtpServer: smtp.gmail.com
		 * toMail: mail nhận
		 * username: mail của mình
		 * psw: password
		 * subject: tiêu đề
		 * body: nội dung;
		 * 
		 */
		
		/*
		 * khai báo Properties thông tin server
		 */
		Properties props = System.getProperties();
		props.put("mail.smtp.host", smtpServer);
		props.put("mail.smtp.port", "25");
		props.put("mail.smtp.starttls.enable", "true");
		final String login = username;
		final String password = pass;
		Authenticator pa = null;
		
		/*
		 * kiểm tra username và password và chứng thực
		 */
		if (login != null && password != null) {
			props.put("mail.smtp.auth", "true");
			pa = new Authenticator() {

				public PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(login, password);
				}
			};
		}
		Session session = Session.getInstance(props, pa);

		Message msg = new MimeMessage(session);

		msg.setFrom(new InternetAddress(username,"Nguyễn Tuấn Anh"));
		msg.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse(toMail, false));

		msg.setSubject(subject);
		//msg.setText(body);		
		msg.setContent(body, "text/html;charset=utf-8");
		
		msg.setHeader("X-Mailer", "LOTONtechEmail");
		msg.setSentDate(new Date());
		msg.saveChanges();
		
		Transport.send(msg);
		System.out.println("Mail da duoc gui");

	}
	public static void main(String[] args) {
		try {
			sendMail("smtp.gmail.com", "ntatvr1@gmail.com", "ntatvr@gmail.com", "01653164732", "Thông Báo!", "Đăng ký thành công");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}