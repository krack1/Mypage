package mvc.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.bean.Dao;

public class findIdActAction implements superAction{
public String executeAction(HttpServletRequest request, HttpServletResponse response){		
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String first_number = request.getParameter("first_number");
		String second_number = request.getParameter("second_number");
		String third_number = request.getParameter("third_number");
		
		Dao dao = Dao.getInstance();
		ArrayList<String> list = dao.checkId(first_number, second_number, third_number);
		
		
		request.setAttribute("list", list);
		
		return "/home/findIdAct.jsp";
	}
}
