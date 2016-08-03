package mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class updateFormAction implements superAction{
	public String executeAction(HttpServletRequest request, HttpServletResponse response) {
		return "/home/updateForm.jsp";
	}
}
