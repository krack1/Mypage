package mvc.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.bean.Dao;

public class withdrawDoneAction implements superAction{
	public String executeAction(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String pw = request.getParameter("pw");
		Dao dao = Dao.getInstance();
		boolean result = dao.delete(session.getAttribute("memid").toString(), pw);
		
		request.setAttribute("result", result);
		
		if(result == true){
			session.invalidate();
			
			Cookie cookie = new Cookie("cooid", "");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		return "/home/withdrawDone.jsp";
	}
}
