<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import = "javax.servlet.http.Cookie" %>
    <%@page import = "javax.servlet.http.HttpServletResponse" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="/Mypage/style/style.css" rel="stylesheet" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	session.invalidate();
	Cookie cookie = new Cookie("cooid", "");
	cookie.setMaxAge(0);
	response.addCookie(cookie);
	
	response.sendRedirect("login.hjh");
	
%>

</body>
</html>