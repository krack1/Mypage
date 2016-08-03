package mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class confirmIdAction implements superAction {
	public String executeAction(HttpServletRequest request, HttpServletResponse response) {
		System.out.println(request.getParameter("id"));
		return "/home/confirmId.jsp";
	}
}
