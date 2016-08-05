
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
	
	<c:if test="${boarddto.passwd == passwd || sessionScope.memid == 'krack1' || ok == '1'}">
		<center>
			<form action = "" method="post">
				<table width ="800" class="boardtable">
					<tr>
						<td width="200">글번호</td>
						<td width="200">${num }</td>
						<td width="200">조회수</td>
						<td width="200">${boarddto.readcount}</td>
					</tr>
					<tr>
						<td width="200">작성자</td>
						<td width="200">${boarddto.writer}</td>
						<td width="200">작성일</td>
						<td width="200">${boarddto.reg_date} </td>
					</tr>
					<tr>
						<td width="200">제목</td>
						<td width="800" colspan="3" align="left">${boarddto.subject }</td>
					</tr>
					<tr>
						<td colspan="4">내용</td>
					</tr>
					<tr>
						<td colspan="4" height="150" align="left" style="padding:0px 0px 0px 50px">${boarddto.content }</td>
					</tr>
					<tr>
						<td colspan="4" align="right">
						
						<c:if test="${sessionScope.memid != null }">
							<input type="button" value="수정" onclick="document.location.href='updateForm.hjh?num=${num }&pageNum=${pageNum }'" class="boardbutton" />
							<input type="button" value="삭제" onclick="document.location.href='delete.hjh?num=${num }&pageNum=${pageNum }'" class="boardbutton" />
							<c:if test="${session.memid == 'krack1' }">
								<input type="button" value="답글" onclick="document.location.href='writeForm.hjh?num=${num }&ref=${ref }&re_step=${re_step }&re_level=${re_level }&pageNum=${pageNum }&re=1'" class="boardbutton" />
							</c:if>
						</c:if>
						
						<input type="button" value="목록" onclick="document.location.href='list.hjh?pageNum=${pageNum}'" class="boardbutton" />
						</td>		
					</tr>
				</table>
			</form>
		</center>
	</c:if>
	<c:if test="${boarddto.passwd != passwd && sessionScope.memid != 'krack1' && ok != '1'} ">
		<script>
			alert("비밀번호를 다시입력해주세요.");
			history.go(-1);
		</script>
	</c:if>


</body>
</html>