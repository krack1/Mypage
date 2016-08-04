<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.util.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import = "test.bean.BoardDao" %>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href = "/Mypage/style/style.css" rel = "stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="boarddto" class="test.bean.BoardDto" />
<jsp:setProperty property="*" name="boarddto"/> 
<%
	boarddto.setReg_date(new Timestamp(System.currentTimeMillis()));
	boarddto.setIp(request.getRemoteAddr());
	
	BoardDao boarddao = BoardDao.getInstance();
	boarddao.insertArticle(boarddto);
	
	if(request.getParameter("re").equals("1")){
		response.sendRedirect("list.hjh?pageNum="+request.getParameter("pageNum").toString());
	}
	else{
		response.sendRedirect("list.hjh");
	}
	
%>
<title>Insert title here</title>
</head>
<body>

</body>
</html>