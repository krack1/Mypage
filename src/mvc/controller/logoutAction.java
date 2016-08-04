package mvc.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class logoutAction implements superAction{
	public String executeAction(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		Cookie cookie = new Cookie("cooid", "");
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		
		return "/home/logout.jsp";
	}
}
