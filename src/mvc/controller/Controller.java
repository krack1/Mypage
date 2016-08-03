package mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Controller extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String view = "/home/login.jsp";
		
		if(uri.equals("/Mypage/login.hjh")) {
			view = "/home/login.jsp";
		}
		if(uri.equals("/Mypage/enter.hjh")) {
			view = "/home/enter.jsp";
		}
		if(uri.equals("/Mypage/login_complete.hjh")) {
			view = "/home/login_complete.jsp";
		}
		if(uri.equals("/Mypage/list.hjh")) {
			view = "/board/list.jsp";
		}
		if(uri.equals("/Mypage/logout.hjh")) {
			view = "/home/logout.jsp";
		}
		if(uri.equals("/Mypage/confirmId.hjh")) {
			view = "/home/confirmId.jsp";
		}if(uri.equals("/Mypage/enter_done.hjh")) {
			view = "/home/enter_done.jsp";
		}
		if(uri.equals("/Mypage/modify.hjh")) {
			view = "/home/modify.jsp";
		}
		if(uri.equals("/Mypage/modifyDone.hjh")) {
			view = "/home/modifyDone.jsp";
		}
		if(uri.equals("/Mypage/withdraw.hjh")) {
			view = "/home/withdraw.jsp";
		}
		if(uri.equals("/Mypage/withdrawDone.hjh")) {
			view = "/home/withdrawDone.jsp";
		}
		
		HttpSession session = request.getSession();
		
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

}
