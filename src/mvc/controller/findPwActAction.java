package mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.bean.Dao;

public class findPwActAction implements superAction{
	public String executeAction(HttpServletRequest request, HttpServletResponse response){
		
		String id = request.getParameter("id");
		
		Dao dao = Dao.getInstance();
		String pw = dao.findPw(id);
		
		request.setAttribute("pw", pw);
		return "/home/findPwAct.jsp";
	}
}
