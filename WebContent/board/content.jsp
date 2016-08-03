
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import = "test.bean.BoardDao" %>
    <%@page import = "test.bean.BoardDto" %>
    <%@page import = "java.util.*" %>
    <%@page import = "java.sql.*" %>
    <%@page import="java.text.SimpleDateFormat"%>
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
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String writer = request.getParameter("writer");
	String passwd = request.getParameter("passwd");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	try{
		BoardDao boarddao = BoardDao.getInstance();
		BoardDto boarddto = boarddao.getArticle(num);
		
		int ref=boarddto.getRef();
		int re_step=boarddto.getRe_step();
		int re_level=boarddto.getRe_level();
%>
	<%if(boarddto.getPasswd().equals(passwd) || session.getAttribute("memid").equals("krack1") || request.getParameter("ok").equals("1")){ %>
	<center>
	<form action = "" method="post">
	<table width ="800" class="boardtable">
		<tr>
			<td width="200">글번호</td>
			<td width="200"><%=boarddto.getNum() %></td>
			<td width="200">조회수</td>
			<td width="200"><%=boarddto.getReadcount() %></td>
		</tr>
		<tr>
			<td width="200">작성자</td>
			<td width="200"><%=boarddto.getWriter() %></td>
			<td width="200">작성일</td>
			<td width="200"><%=sdf.format(boarddto.getReg_date())%></td>
		</tr>
		<tr>
			<td width="200">제목</td>
			<td width="800" colspan="3" align="left"><%=boarddto.getSubject() %></td>
		</tr>
		<tr>
			<td colspan="4">내용</td>
		</tr>
		<tr>
			<td colspan="4" height="150" align="left" style="padding:0px 0px 0px 50px"><%=boarddto.getContent().replace("\r\n", "<br />") %></td>
		</tr>
		<tr>
			<td colspan="4" align="right">
			<%if(session.getAttribute("memid") != null) { %>
			<input type="button" value="수정" onclick="document.location.href='/Mypage/board/updateForm.jsp?num=<%=num%>&pageNum=<%=pageNum%>'" class="boardbutton" />
			<input type="button" value="삭제" onclick="document.location.href='/Mypage/board/delete.jsp?num=<%=num%>&pageNum=<%=pageNum%>'" class="boardbutton" />
				<%if(session.getAttribute("memid").equals("krack1")) {%>
					<input type="button" value="답글" onclick="document.location.href='/Mypage/board/writeForm.jsp?num=<%=num %>&ref=<%=ref %>&re_step=<%=re_step %>&re_level=<%=re_level %>&pageNum=<%=pageNum %>&re=1'" class="boardbutton" />
				<%} %>
			<%}%>
			<input type="button" value="목록" onclick="document.location.href='/Mypage/board/list.jsp?pageNum=<%=pageNum %>'" class="boardbutton" />
			</td>		
		</tr>
	</table>
	</form>
	<%}else{ %>
		<script>
			alert("비밀번호를 다시입력해주세요.");
			history.go(-1);
		</script>
	<%} %>
	
<%}catch(Exception e){}%>
</center>
</body>
</html>