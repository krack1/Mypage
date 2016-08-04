<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import ="java.text.SimpleDateFormat" %>
	<%@page import = "test.bean.BoardDao" %>
	<%@page import = "test.bean.BoardDto" %> 
	<%@page import = "java.util.*" %>
	<%@page import = "java.sql.*" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href = "/Mypage/style/style.css" rel = "stylesheet" type="text/css">
<style>
	tr{
		border-bottom:1px solid #D5D5D5;
		height:20px;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<%request.setCharacterEncoding("utf-8"); %>

<%
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
	
%>
<center>
<input type="button" value ="JAEHO" onclick ="location.href='login.hjh'" class="buttontitle"/><br /><br />
전체글 : <%=count %><br />
<%if(count == 0) {
	if(session.getAttribute("memid") != null) {
%>
	<table>
		<tr>
			<td>
				<a href="/Mypage/board/writeForm.jsp?pageNum=<%=currentPage%>&re=0">글쓰기</a>
			</td>
		</tr>
	</table>
<%} else {%>
	<table>
		<tr>
			<td>
				<a href="login.hjh">로그인</a>
			</td>
		</tr>
	</table>
<%}%>
	<table class="boardtable">
		<tr>
			<td>
				저장된 글이 없습니다.
			</td>
		</tr>
	</table>
<%
}
else{
	if(session.getAttribute("memid") != null) {
%>
<table width = "800">
	<tr>
		<td width="800" align="right">
			<a href="/Mypage/board/writeForm.jsp?pageNum=<%=currentPage%>&re=0">글쓰기</a>
		</td>
	</tr>
</table>
<%} else {%>
	<table width = "800">
		<tr>
			<td width="800" align="right">
				<a href="login.hjh">로그인</a>
			</td>
		</tr>
	</table>
<%}%>
<table width ="800" class="boardtable">
	<tr>
		<td width ="50">
			번호
		</td>
		<td>
			제목
		</td>
		<td width = "100">
			작성자
		</td>
		<td width = "150">
			작성일
		</td>
		<td width = "50">
			조회
		</td>
		<td width = "150">
			IP
		</td>		
	</tr>
	
	<%
	if(id != null) {
		
		for(int i = 0 ; i < articleList.size(); i++) {
			BoardDto boarddto = (BoardDto)articleList.get(i);
		%>
		<tr>
			<td>
				<%= boarddto.getNum() %>
			</td>
			<%int padding = boarddto.getRe_level()*10; %>
			<td style="padding: 0px 0px 0px <%=padding%>px;">
				 <a href = "/Mypage/board/confirmPw.jsp?num=<%=boarddto.getNum()%>&pageNum=<%=currentPage%>&writer=<%= boarddto.getWriter()%>"><%= boarddto.getSubject() %></a>
			</td>
			<td>
				<%= boarddto.getWriter() %>
			</td>
			<td>
				<%= sdf.format(boarddto.getReg_date()) %>
			</td>
			<td>
				<%= boarddto.getReadcount() %>
			</td>
			<td>
				<%= boarddto.getIp() %>
			</td>		
		</tr>
		
		<%}	
	}
	else{
	for(int i = 0 ; i < articleList.size(); i++) {
		BoardDto boarddto = (BoardDto)articleList.get(i);
	%>
	<tr>
		<td>
			<%= boarddto.getNum() %>
		</td>
		<%int padding = boarddto.getRe_level()*10; %>
		<td align="left" style="padding: 0px 0px 0px <%=padding%>px;">
			 <a href = "/Mypage/board/confirmPw.jsp?num=<%=boarddto.getNum()%>&pageNum=<%=currentPage%>&writer=<%= boarddto.getWriter()%>"><%= boarddto.getSubject() %></a>
		</td>
		<td>
			<%= boarddto.getWriter() %>
		</td>
		<td>
			<%= sdf.format(boarddto.getReg_date()) %>
		</td>
		<td>
			<%= boarddto.getReadcount() %>
		</td>
		<td>
			<%= boarddto.getIp() %>
		</td>		
	</tr>
	
	<%}
	}%>	
</table>

<%} %>

<%if(request.getParameter("search") != null) {
	if(count > pageSize) {
		int pageCount = count /pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (currentPage /10)*10+1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock -1;
		if (endPage > pageCount) endPage = pageCount;
		
		if(pageCount > 10 && currentPage > 10) {%>
			<a href="/Mypage/board/list.jsp?pageNum=<%=startPage-10 %>&search=<%=id%>">[이전]</a>
		<%}
		for(int i = startPage ; i <= endPage ; i++) {%>
			<a href="/Mypage/board/list.jsp?pageNum=<%=i %>&search=<%=id%>">[<%=i %>]</a>
		<%}
		if(endPage < pageCount) {%>
			<a href="/Mypage/board/list.jsp?pageNum=<%=startPage+10 %>&search=<%=id%>">[다음]</a>
		<%}
	}
}
else{
	if(count > pageSize) {
		int pageCount = count /pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (currentPage /10)*10+1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock -1;
		if (endPage > pageCount) endPage = pageCount;
		
		if(pageCount > 10 && currentPage > 10) {%>
			<a href="/Mypage/board/list.jsp?pageNum=<%=startPage-10 %>">[이전]</a>
		<%}
		for(int i = startPage ; i <= endPage ; i++) {%>
			<a href="/Mypage/board/list.jsp?pageNum=<%=i %>">[<%=i %>]</a>
		<%}
		if(endPage < pageCount) {%>
			<a href="/Mypage/board/list.jsp?pageNum=<%=startPage+10 %>">[다음]</a>
		<%}
	}
}
%>
<form name="orderForm" action="/Mypage/board/list.jsp" method="get">
<input type="text" name="search" style="width:100px; margin:10px 10px 0px 0px;" /><input type="submit" value="검색" class="boardbutton"/>
</form>
</center>
</body>
</html>