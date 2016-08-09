package mvc.controller;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.bean.Dao;

public class findPwAction implements superAction{
	public String executeAction(HttpServletRequest request, HttpServletResponse response){
	
		String id = request.getParameter("id");
		String email_id = request.getParameter("email_id");
		String email_site_text = request.getParameter("email_site_text");
		
		Dao dao = Dao.getInstance();
		boolean result = dao.findPw_Check(id, email_id, email_site_text);
		
		if(result == true){
			
			try{
				String checknum = Integer.toString((int)(Math.random()*89999 + 10000));
				request.setAttribute("checknum", checknum);
		        String host = "smtp.naver.com";
		        final String username = "krack1@naver.com";
		        final String password = "hyeong5006";
		        int port=465;
		         
		        String recipient = email_id+"@"+email_site_text;
		        String subject = "LEDhouse 비밀번호찾기 인증번호입니다.";
		        
		         
		        Properties props = System.getProperties();
		         
		         
		        props.put("mail.smtp.host", host);
		        props.put("mail.smtp.port", port);
		        props.put("mail.smtp.auth", "true");
		        props.put("mail.smtp.ssl.enable", "true");
		        props.put("mail.smtp.ssl.trust", host);
		          
		        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
		            String un=username;
		            String pw=password;
		            protected PasswordAuthentication getPasswordAuthentication() {
		                return new PasswordAuthentication(un, pw);
		            }
		        });
		        session.setDebug(true); //for debug
		          
		        Message mimeMessage = new MimeMessage(session);
		        mimeMessage.setFrom(new InternetAddress("krack1@naver.com"));
		        mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
		        mimeMessage.setSubject(subject);
		        mimeMessage.setText("인증번호 : " + checknum);
		        Transport.send(mimeMessage);
		        			
			}catch(Exception e){
				e.printStackTrace();
			}
			request.setAttribute("id", id);
			
		}
		request.setAttribute("result", result);
		
		
		return "/home/findPw.jsp";
	}
}
