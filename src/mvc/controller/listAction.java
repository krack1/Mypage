package mvc.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.bean.BoardDao;

public class listAction implements superAction{
	public String executeAction(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			
			int pageSize = 6;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String pageNum = request.getParameter("pageNum");
			String id = request.getParameter("search");
				if(pageNum == null) {
					pageNum = "1";
				}
				
				int currentPage = Integer.parseInt(pageNum);
				int startRow = (currentPage - 1)* pageSize +1;
				int endRow = currentPage*pageSize;
				int count = 0;
				int number = 0;
				
				
				List articleList = null;
				BoardDao boarddao = BoardDao.getInstance();
				
				if(id != null){
					count = boarddao.getSearchArticleCount(id);
				}else{
					count = boarddao.getArticleCount();
				}
				number = count - (currentPage - 1)*pageSize; 
				if(count > 0) {
					if(id != null){
						articleList = boarddao.getSearchArticles(startRow, endRow, id);
					}else{
						articleList = boarddao.getArticles(startRow, endRow);
					}
				}
				
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("id", id);
				request.setAttribute("pageSize", pageSize);
				request.setAttribute("currentPgae", currentPage );
				request.setAttribute("startRow", startRow );
				request.setAttribute("endRow", endRow );
				request.setAttribute("count", count);
				request.setAttribute("number", number );
				request.setAttribute("articleList", articleList);
				
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return "/board/list.jsp";
	}
}
