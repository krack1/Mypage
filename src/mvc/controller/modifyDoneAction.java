package mvc.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.bean.Dao;
import test.bean.Dto;

public class modifyDoneAction implements superAction{
	public String executeAction(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Dto dto = new Dto();
		
		String pass1 = request.getParameter("pass1");
		String pass2 = request.getParameter("pass2");
		String address = request.getParameter("address");
		String first_number = request.getParameter("first_number");
		String second_number = request.getParameter("second_number");
		String third_number = request.getParameter("third_number");
		String email_id = request.getParameter("email_id");
		String email_site_text = request.getParameter("email_site_text");
		String receive = request.getParameter("receive");
		String interest = request.getParameter("interest");
		

		dto.setPass1(pass1);
		dto.setPass2(pass2);
		dto.setAddress(address);
		dto.setFirst_number(first_number);
		dto.setSecond_number(second_number);
		dto.setThird_number(third_number);
		dto.setEmail_id(email_id);
		dto.setEmail_site_text(email_site_text);
		dto.setReceive(receive);
		dto.setInterest(interest);
		
		HttpSession session = request.getSession();
		dto.setId((String)session.getAttribute("memid"));
		
		Dao dao = Dao.getInstance();
		dao.updateInfo(dto);
		
		return "/home/modifyDone.jsp";
	}
}
