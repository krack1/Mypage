<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import = "test.bean.BoardDao" %>
    <%@page import = "test.bean.BoardDto" %>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	tr{
		border-bottom:1px solid #D5D5D5;
		height:20px;
	}
</style>
<link href = "/Mypage/style/style.css" rel = "stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8");%>
<center><input type="button" value ="JAEHO" onclick ="location.href='login.hjh'" class="buttontitle"/><br /><br /></center>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	BoardDao boarddao = BoardDao.getInstance();
	BoardDto boarddto = boarddao.updateGetArticle(num);
	
%>

	<form action = "/Mypage/board/updateAct.jsp?pageNum=<%=pageNum%>" method="post">
	<input type="hidden" name="num" value="<%=num %>" />
	<input type="hidden" name="pageNum" value="<%=pageNum %>" />
	<input type="hidden" name="writer" value="<%=boarddto.getWriter()%>" />
	<input type="hidden" name="email" value="<%=boarddto.getEmail()%>" />
	<center>
	<table class="boardtable" width = "800">
		<tr>
			<td width="200">이름</td>
			<td align="left"><%=boarddto.getWriter()%></td>
		</tr>
		<tr>
			<td width="200">제목</td>
			<td align="left"><input type="text" name="subject" value="<%=boarddto.getSubject() %>" style="width:435pt;" /></td>
		</tr>
		<tr>
			<td width="200">메일</td>
			<td align="left"><%=boarddto.getEmail()%></td>
		</tr>
		<tr>
			<td width="200">내용</td>
			<td align="left"><textarea rows="20" cols="70" name="content" class="boardtext"><%=boarddto.getContent() %></textarea></td>
		</tr>
		<tr>
			<td width="200">비밀번호</td>
			<td align="left"><input type="password" name="passwd" /></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
			<input type="submit" value="수정" class="boardbutton" />
			<input type="reset" value="취소" class="boardbutton" />
			<input type="button" value="목록" onclick="window.location='/Mypage/board/list.jsp?pageNum=<%=pageNum%>'" class="boardbutton" /> 
			</td>
		</tr>
	</table>
	</center>
</form>

</body>
</html>