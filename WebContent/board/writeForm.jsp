<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import = "test.bean.Dao" %>
    <%@page import = "test.bean.Dto" %>
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
<%request.setCharacterEncoding("utf-8"); %>
<%
	Dao dao = Dao.getInstance();
	String id = session.getAttribute("memid").toString();
	String pageNum = request.getParameter("pageNum");
	String re = request.getParameter("re");
	Dto dto = dao.modifiyInfo(id);
	int num = 0, ref = 1, re_step = 0, re_level=0;
	try{
		if(request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
			ref =Integer.parseInt(request.getParameter("ref"));
			re_step =Integer.parseInt(request.getParameter("re_step"));
			re_level =Integer.parseInt(request.getParameter("re_level"));
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
%>
<body>
<form name="orderForm" action="/Mypage/board/writeFormAct.jsp?pageNum=<%=pageNum %>&re=<%=re %>" method="post" onSubmit="return ok()" >
<input type="hidden" name="num" value="<%=num %>">
<input type="hidden" name="ref" value="<%=ref %>">
<input type="hidden" name="re_step" value="<%=re_step %>">
<input type="hidden" name="re_level" value="<%=re_level %>">
<input type="hidden" name="writer" value="<%=dto.getId()%>" >
<input type="hidden" name="email" value="<%=dto.getEmail_id()+"@"+dto.getEmail_site_text()%>" >
<center>
	<table width="800" class="boardtable">
		<tr>
			<td width="200">이름</td>
			<td align="left"><%=dto.getId()%></td>
		</tr>
		<tr>
			<td width="200">제목</td>
			<td align="left">
				<%if(re.equals("1")){ %> 
					<input type="text" name="subject" value="[답변]" style="width:435pt;">
				<%}else{ %>
					<input type="text" name="subject" style="width:435pt;">
				<%}%>
			</td>
		</tr>
		<tr>
			<td width="200">메일</td>
			<td align="left"><%=dto.getEmail_id()+"@"+dto.getEmail_site_text()%></td>
		</tr>
		<tr>
			<td width="200">내용</td>
			<td align="left"><textarea rows="20" cols="70" name="content" class="boardtext"></textarea></td>
		</tr>
		<tr>
			<td width="200">비밀번호</td>
			<td align="left"><input type="password" name="passwd"></td>
		</tr>
		<tr style="border:0px;">
			<td colspan="2" align="right" >
			<input type="submit" value="작성" class ="boardbutton" />
			<input type="reset" value="제거" class ="boardbutton" />
			<input type="button" value="목록" onclick="window.location='/Mypage/board/list.jsp?pageNum=<%=pageNum%>'" class ="boardbutton" /> 
			</td>
		</tr>
	</table>
</center>	
</form>
</body>
<script type="text/javascript">
	function ok() {
		var pw = document.orderForm.passwd.value;
		if(pw == "") {
			alert("비밀번호를 입력하세요");
			return false;
		}
	}
</script>
</html>