<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import = "test.bean.Dao" %>
    <%@page import = "test.bean.Dto" %>
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

<center><input type="button" value ="JAEHO" onclick ="location.href='login.hjh'" class="buttontitle"/><br /><br /></center>

<body>
<form name="orderForm" action="writeFormAct.hjh?pageNum=${pageNum }&re=${re}" method="post" onSubmit="return ok()" >
<input type="hidden" name="num" value="${num }">
<input type="hidden" name="ref" value="${ref }">
<input type="hidden" name="re_step" value="${re_step }">
<input type="hidden" name="re_level" value="${re_level }">
<input type="hidden" name="writer" value="${dto.id }" >
<input type="hidden" name="email" value="${dto.email_id}@${dto.email_site_text }" >
<center>
	<table width="800" class="boardtable">
		<tr>
			<td width="200">이름</td>
			<td align="left">${dto.id }</td>
		</tr>
		<tr>
			<td width="200">제목</td>
			<td align="left">
			
			<c:if test="${re == '1' }">
				<input type="text" name="subject" value="[답변]" style="width:435pt;">
			</c:if>
			<c:if test="${re != '1' }">
				<input type="text" name="subject" style="width:435pt;">
			</c:if>
			</td>
		</tr>
		<tr>
			<td width="200">메일</td>
			<td align="left">${dto.email_id}@${dto.email_site_text }</td>
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
			<input type="button" value="목록" onclick="window.location='list.hjh?pageNum=${pageNum}'" class ="boardbutton" /> 
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