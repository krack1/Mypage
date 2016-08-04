package mvc.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.bean.Dao;
import test.bean.Dto;

public class writeFormAction implements superAction {
	public String executeAction(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			
			Dao dao = Dao.getInstance();
			String id = session.getAttribute("memid").toString();
			String pageNum = request.getParameter("pageNum");
			String re = request.getParameter("re");
			Dto dto = dao.modifiyInfo(id);
			int num = 0, ref = 1, re_step = 0, re_level=0;
			
			if(request.getParameter("num") != null) {
				num = Integer.parseInt(request.getParameter("num"));
				ref =Integer.parseInt(request.getParameter("ref"));
				re_step =Integer.parseInt(request.getParameter("re_step"));
				re_level =Integer.parseInt(request.getParameter("re_level"));
			}
			request.setAttribute("id", id);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("re", re);
			request.setAttribute("dto", dto);
			request.setAttribute("num", num);
			request.setAttribute("ref", ref);
			request.setAttribute("re_step", re_step);
			request.setAttribute("re_level", re_level);
			
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/board/writeForm.jsp";
	}
}
