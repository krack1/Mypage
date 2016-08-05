package mvc.controller;


import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class findIdAction implements superAction{

	public String executeAction(HttpServletRequest request, HttpServletResponse response){		
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return "/home/findId.jsp";
	}
	
}
