package mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class confirmPwAction implements superAction {
	public String executeAction(HttpServletRequest request, HttpServletResponse response) {
		return "/home/confirmPw.jsp";
	}
}
