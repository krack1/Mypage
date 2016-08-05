package mvc.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.bean.BoardDao;
import test.bean.BoardDto;

public class contentAction implements superAction {
	public String executeAction(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		try {
			request.setCharacterEncoding("utf-8");
			
			int num = Integer.parseInt(request.getParameter("num"));
			String pageNum = request.getParameter("pageNum");
			String writer = request.getParameter("writer");
			String passwd = request.getParameter("passwd");
			String ok = request.getParameter("ok");
			
			
			BoardDao boarddao = BoardDao.getInstance();
			BoardDto boarddto = boarddao.getArticle(num);
			
			int ref=boarddto.getRef();
			int re_step=boarddto.getRe_step();
			int re_level=boarddto.getRe_level();
			
			String content = boarddto.getContent().replace("\r\n", "<br />");
			boarddto.setContent(content);
			
			request.setAttribute("ref", ref);
			request.setAttribute("re_step", re_step);
			request.setAttribute("re_level", re_level);
			request.setAttribute("boarddto", boarddto);
			session.getAttribute("memid");
			
			request.setAttribute("num", num);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("writer", writer);
			request.setAttribute("passwd", passwd);
			request.setAttribute("ok", ok);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return "/board/content.jsp";
	}
}
