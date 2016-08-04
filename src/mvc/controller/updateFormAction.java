package mvc.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.bean.BoardDao;
import test.bean.BoardDto;

public class updateFormAction implements superAction{
	public String executeAction(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("utf-8");
			
			int num = Integer.parseInt(request.getParameter("num"));
			String pageNum = request.getParameter("pageNum");
			BoardDao boarddao = BoardDao.getInstance();
			BoardDto boarddto = boarddao.updateGetArticle(num);
			
			request.setAttribute("num", num);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("boarddto", boarddto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		return "/board/updateForm.jsp";
	}
}
