package mvc.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.bean.Dao;
import test.bean.Dto;

public class modifyAction implements superAction{
	public String executeAction(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		Dao dao = Dao.getInstance();
		String id = (String)session.getAttribute("memid");
		Dto dto = dao.modifiyInfo(id);
		
		request.setAttribute("id", dto.getId());
		request.setAttribute("pass1", dto.getPass1());
		request.setAttribute("birth", dto.getBirth());
		request.setAttribute("sex", dto.getSex());
		request.setAttribute("address", dto.getAddress());
		request.setAttribute("first_number", dto.getFirst_number());
		request.setAttribute("second_number", dto.getSecond_number());
		request.setAttribute("third_number", dto.getThird_number());
		request.setAttribute("email_id", dto.getEmail_id());
		request.setAttribute("email_site_text",dto.getEmail_site_text());
		request.setAttribute("receive",dto.getReceive());
		request.setAttribute("interest",dto.getInterest());
		
		
		return "/home/modify.jsp";
	}
}
