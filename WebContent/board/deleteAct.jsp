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
<%request.setCharacterEncoding("utf-8");%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String passwd = request.getParameter("passwd");
	BoardDao boarddao = BoardDao.getInstance();
	boolean delete = false;
	
	if(session.getAttribute("memid").equals("krack1")){
		delete = boarddao.deleteArticleAdmin(num);
	}else{
		delete = boarddao.deleteArticle(num, passwd);
	}
	
	
	if(delete == true) {
		response.sendRedirect("/Mypage/board/list.jsp?pageNum="+pageNum);
	}else{%>
		<script type="text/javascript">
		alert("비밀번호를 다시 입력해 주세요");
		history.go(-1);
		</script>
	<%}
	
%>

</body>
</html>