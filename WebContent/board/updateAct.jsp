<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="test.bean.BoardDao" %>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href = "/Mypage/style/style.css" rel = "stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="boarddto" class="test.bean.BoardDto">
<jsp:setProperty property="*" name="boarddto" />
</jsp:useBean>

<%
	BoardDao boarddao = BoardDao.getInstance();
	
	int result = boarddao.updateArticle(boarddto);
	System.out.println(result);
	
	if(result == 1) {
		response.sendRedirect("/Mypage/board/content.jsp?num="+boarddto.getNum()+"&pageNum="+request.getParameter("pageNum").toString()+"&ok=1");
	}else{%>
		<script>
			alert("비밀번호가 틀렸습니다.");
			history.go(-1);
		</script>
	<%}
%>
</body>
</html>