<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href = "/Mypage/style/style.css" rel = "stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String writer = request.getParameter("writer");
%>
<%if(session.getAttribute("memid").equals("krack1")){
	response.sendRedirect("/Mypage/board/content.jsp?num="+num+"&pageNum="+pageNum+"&writer="+writer);
}
%>
<%if(writer.equals(session.getAttribute("memid"))){ %>
<form action="/Mypage/board/content.jsp?num=<%=num%>&pageNum=<%=pageNum%>&writer=<%=writer%>" method="post">
비밀번호<input type="password" name="passwd" />
<input type="submit" value="확인" />
<input type="button" value="글목록" onclick="document.location.href='/Mypage/board/list.jsp?pageNum=<%=pageNum %>'" />

</form>
<%}else{%>
		<script>
		alert("본인만 확인할수 있습니다.");
		history.go(-1);
		</script>
<%}%>

</body>
</html>