package mvc.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.bean.BoardDao;
import test.bean.BoardDto;

public class updateActAction implements superAction{
	public String executeAction(HttpServletRequest request, HttpServletResponse response) {
		
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		String pageNum = request.getParameter("pageNum").toString();
		
		BoardDto boarddto = new BoardDto();
		int num = Integer.parseInt(request.getParameter("num"));
		String writer = request.getParameter("writer");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String passwd = request.getParameter("passwd");
		
		boarddto.setNum(num);
		boarddto.setWriter(writer);
		boarddto.setEmail(email);
		boarddto.setSubject(subject);
		boarddto.setContent(content);
		boarddto.setPasswd(passwd);
		
		request.setAttribute("boarddto", boarddto);
		request.setAttribute("pageNum", pageNum);
		
		BoardDao boarddao = BoardDao.getInstance();		
		int result = boarddao.updateArticle(boarddto);
		
		request.setAttribute("result", result);
		
		
		return "/board/updateAct.jsp";
	}
}
