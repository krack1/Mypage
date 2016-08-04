package mvc.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Controller extends HttpServlet {

	Map map = new HashMap();
	
	public void init(ServletConfig config) throws ServletException {
		String path = config.getInitParameter("propertiesPath");
		InputStream is = null;
		Properties p = new Properties();
		try{
			is = new FileInputStream(path);
			p.load(is);
			Iterator it = p.keySet().iterator();
			while(it.hasNext()){
				String key = it.next().toString();
				String value = p.getProperty(key);
				
				Class className = Class.forName(value);
				Object obj = className.newInstance();
				
				map.put(key, obj);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String view = "";
		superAction action = null;
		action = (superAction)map.get(uri);
		view = action.executeAction(request, response);
		
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

	
	
	
}



/*
 Map map = new HashMap();

	public void init(ServletConfig config) throws ServletException { //server실행하면 처음에만 한번 실행함
		String path = config.getInitParameter("propertiesPath"); //web.xml에 설정해놓은 init-param의 경로를 가져온다.
		InputStream is = null;
		Properties p = new Properties();  //util package에 있는 객체 파일정보를 로딩시킬 수 있다는 장점이 있다.
		try{
			is = new FileInputStream(path); //InputStream에 해당 파일 경로를 저장한다.
			p.load(is); // command.properties에 저장한 정보들이 key와 value로 만들어진다.
			Iterator it = p.keySet().iterator(); //p에 있는 모든 key값을 iterator에 저장 =을 기준으로 왼쪽이 key 오른쪽이 value
			while(it.hasNext()){
				String key = (String)it.next();
				String value = p.getProperty(key);
				
				Class className = Class.forName(value);  //저장되어있는 value를 객체화 시키는 작업
				Object obj = className.newInstance();
				map.put(key, obj);
			}
		}catch(Exception e){e.printStackTrace();}
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String uri = request.getRequestURI();
		String view = "";
			
		superAction action = null;
		action = (superAction)map.get(uri);
		view = action.executeAction(request, response);
		
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	} 
 */


