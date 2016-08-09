package mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.bean.Dao;

public class findPwFormAction implements superAction {
	public String executeAction(HttpServletRequest request, HttpServletResponse response){

		return "/home/findPwForm.jsp";
	}
}
