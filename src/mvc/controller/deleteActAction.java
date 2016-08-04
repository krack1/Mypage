package mvc.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.bean.BoardDao;

public class deleteActAction implements superAction{
	public String executeAction(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		String passwd = request.getParameter("passwd");
		BoardDao boarddao = BoardDao.getInstance();
		boolean delete = false;
		
		if(session.getAttribute("memid").equals("krack1")){
			delete = boarddao.deleteArticleAdmin(num);
		}else{
			delete = boarddao.deleteArticle(num, passwd);
		}
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("delete", delete);
		return "/board/deleteAct.jsp";
	}
}
