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

public class findPwAction implements superAction{
	public String executeAction(HttpServletRequest request, HttpServletResponse response){
	
	
		try{
			String checknum = Integer.toString((int)(Math.random()*89999 + 10000));
			request.setAttribute("checknum", checknum);
	        String host = "smtp.naver.com";
	        final String username = "krack1@naver.com";
	        final String password = "hyeong5006";
	        int port=465;
	         
	        String recipient = "hyungjh1@gmail.com";
	        String subject = "제목테스트";
	        String body = "내용테스트";
	         
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
	        mimeMessage.setText("인증번호는 : " + checknum);
	        Transport.send(mimeMessage);
	        
	       
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "/home/findPw.jsp";
	}
}
