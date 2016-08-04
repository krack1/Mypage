<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<center><input type="button" value ="JAEHO" onclick ="location.href='login.hjh'" class="buttontitle"/><br /><br /></center>

	<form action = "updateAct.hjh?pageNum=${pageNum }" method="post">
	<input type="hidden" name="num" value="${num }" />
	<input type="hidden" name="pageNum" value="${pageNum }" />
	<input type="hidden" name="writer" value="${boarddto.writer }" />
	<input type="hidden" name="email" value="${boarddto.email }" />
	<center>
	<table class="boardtable" width = "800">
		<tr>
			<td width="200">이름</td>
			<td align="left">${boarddto.writer }</td>
		</tr>
		<tr>
			<td width="200">제목</td>
			<td align="left"><input type="text" name="subject" value="${boarddto.subject }" style="width:435pt;" /></td>
		</tr>
		<tr>
			<td width="200">메일</td>
			<td align="left">${boarddto.email }</td>
		</tr>
		<tr>
			<td width="200">내용</td>
			<td align="left"><textarea rows="20" cols="70" name="content" class="boardtext">${boarddto.content }</textarea></td>
		</tr>
		<tr>
			<td width="200">비밀번호</td>
			<td align="left"><input type="password" name="passwd" /></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
			<input type="submit" value="수정" class="boardbutton" />
			<input type="reset" value="취소" class="boardbutton" />
			<input type="button" value="목록" onclick="window.location='list.hjh?pageNum=${pageNum}'" class="boardbutton" /> 
			</td>
		</tr>
	</table>
	</center>
</form>

</body>
</html>