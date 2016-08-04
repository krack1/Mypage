package mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class writeFormActAction implements superAction{
	public String executeAction(HttpServletRequest request, HttpServletResponse response) {
		return "/board/writeFormAct.jsp";
	}
}
