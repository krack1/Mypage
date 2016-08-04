package mvc.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.bean.Dao;
import test.bean.Dto;

public class enter_doneAction implements superAction{
	public String executeAction(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		Dto dto = new Dto();
		
		String id = request.getParameter("id");
		String pass1 = request.getParameter("pass1");
		String pass2 = request.getParameter("pass2");
		String birth = request.getParameter("birth");
		String sex = request.getParameter("sex");
		String address = request.getParameter("address");
		String first_number = request.getParameter("first_number");
		String second_number = request.getParameter("second_number");
		String third_number = request.getParameter("third_number");
		String email_id = request.getParameter("email_id");
		String email_site_text = request.getParameter("email_site_text");
		String receive = request.getParameter("receive");
		String interest = request.getParameter("interest");
		
		dto.setId(id);
		dto.setPass1(pass1);
		dto.setPass2(pass2);
		dto.setBirth(birth);
		dto.setSex(sex);
		dto.setAddress(address);
		dto.setFirst_number(first_number);
		dto.setSecond_number(second_number);
		dto.setThird_number(third_number);
		dto.setEmail_id(email_id);
		dto.setEmail_site_text(email_site_text);
		dto.setReceive(receive);
		dto.setInterest(interest);
		
		Dao dao = Dao.getInstance();
		
		dao.insert(dto);
		int result = dao.select_id(dto.getId());
		request.setAttribute("result", result);
		
		
		return "/home/enter_done.jsp";
	}
}
