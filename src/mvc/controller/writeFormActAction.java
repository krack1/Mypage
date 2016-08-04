package mvc.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.bean.BoardDao;
import test.bean.BoardDto;

public class writeFormActAction implements superAction{
	public String executeAction(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("utf-8");
			int num = Integer.parseInt(request.getParameter("num"));
			int ref = Integer.parseInt(request.getParameter("ref"));
			int re_step = Integer.parseInt(request.getParameter("re_step"));
			int re_level = Integer.parseInt(request.getParameter("re_level"));
			String writer = request.getParameter("writer");
			String email = request.getParameter("email");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String passwd = request.getParameter("passwd");
			
			BoardDto boarddto = new BoardDto();
			boarddto.setNum(num);
			boarddto.setRef(ref);
			boarddto.setRe_step(re_step);
			boarddto.setRe_level(re_level);
			boarddto.setWriter(writer);
			boarddto.setEmail(email);
			boarddto.setSubject(subject);
			boarddto.setContent(content);
			boarddto.setPasswd(passwd);		
			boarddto.setReg_date(new Timestamp(System.currentTimeMillis()));
			boarddto.setIp(request.getRemoteAddr());
			
			BoardDao boarddao = BoardDao.getInstance();
			boarddao.insertArticle(boarddto);
			String re = request.getParameter("re");
			
			request.setAttribute("re", re);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "/board/writeFormAct.jsp";
	}
}
