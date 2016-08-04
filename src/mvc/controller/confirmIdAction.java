package mvc.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.bean.Dao;

public class confirmIdAction implements superAction {
	public String executeAction(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String id = request.getParameter("id");
		
		Dao dao = Dao.getInstance();
		int result = dao.select_id(id);
		
		request.setAttribute("result", result);
		request.setAttribute("id", id);
		return "/home/confirmId.jsp";
	}
}
