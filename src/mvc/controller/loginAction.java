package mvc.controller;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.bean.Dao;
import test.bean.Dto;

public class loginAction implements superAction {
	public String executeAction(HttpServletRequest request, HttpServletResponse response) {
		
		Dao dao = Dao.getInstance();
		
		boolean result = false;
		try{
			HttpSession session = request.getSession();
			Cookie[] cookie = request.getCookies();
			
			if(cookie != null) {
				for(Cookie coo : cookie) {
					result = dao.findId(coo.getValue());
					if(result) {
						session.setAttribute("memid", coo.getValue());
					}
				}
			}
		
		if(session.getAttribute("memid") != null){
			if(session.getAttribute("memid").equals("krack1")){
				ArrayList<Dto> list = dao.select();
				request.setAttribute("list", list);
			}
		}

		}catch(Exception e){e.printStackTrace();}
		
		return "/home/login.jsp";
	}
}
