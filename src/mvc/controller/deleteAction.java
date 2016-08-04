package mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class deleteAction implements superAction{
	public String executeAction(HttpServletRequest request, HttpServletResponse response) {
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		HttpSession session = request.getSession();
		
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		session.getAttribute("memid");
		
		return "/board/delete.jsp";
	}
}
