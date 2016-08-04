package mvc.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.bean.Dao;
import test.bean.Dto;

public class login_completeAction implements superAction{
	
	public String executeAction(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String login_id = request.getParameter("login_id");
		String login_pw = request.getParameter("login_pw");
		
		Dto dto = new Dto();
		dto.setLogin_id(login_id);
		dto.setLogin_pw(login_pw);
		
		Dao dao = Dao.getInstance();
		int result = dao.loginCheck(dto);
		
		if(result == 3) {
			if(request.getParameter("keeplogin") != null){
				Cookie cookie = new Cookie("cooid", dto.getLogin_id());
				cookie.setMaxAge(300);
				response.addCookie(cookie);
			}
				HttpSession session = request.getSession();
				session.setAttribute("memid", dto.getLogin_id());
			
		}
		
			
		request.setAttribute("result", result);
		
		return "/home/login_complete.jsp";
	}
}
