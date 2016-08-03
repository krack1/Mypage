package mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface superAction {
	public String executeAction(HttpServletRequest request, HttpServletResponse response);
}
