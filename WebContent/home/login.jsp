<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="/Mypage/style/style.css" rel="stylesheet" type="text/css">
<style>
	table {
		border-width:0px;
	}
	
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<fmt:requestEncoding value="utf-8" />



<%--세션이 없으면 기본 로그인 창을 띄운다. --%>
<c:if test="${sessionScope.memid == null }">

<form method="post" name="login_order" action="login_complete.hjh">

<div id="container" style="width:180px; height:60px; padding: 0px 0px 10px 0px">
    <div id="login" style="width:60px; height:61px; float:right; border-top:1px solid #747474; border:1px solid #747474;">
    <input type="submit" value="로그인" class="login" />
    </div>
    <div id="id"  onclick="go_id()" style="width:117px; height:30px; float:left; border-top:1px solid #747474; border-left:1px solid #747474; ">
    <input type="text" name ="login_id" placeholder="아이디" class="loginid" />
    </div>
    <div id="pass" onclick="go_pw()" style="width:117px; height:30px; float:left; border-top:1px solid #747474;  border-left:1px solid #747474; border-bottom:1px solid #747474;">
    <input type="password" name ="login_pw" placeholder="패스워드" class="loginpass" />
    </div>
    </div>
    <input type="button" value="회원가입" onclick="location.href='enter.hjh'" class="button" />
    <input type="button" value="게시판" onclick="location.href='list.hjh'" class="button" /><br />
    <input type="checkbox" name="keeplogin" value="on"><font size="2">로그인상태 유지하기</font>
</form>
<%--세션이 있으면 로그인완료 페이지를 띄운다. --%>
</c:if>
<c:if test="${sessionScope.memid != null }">
	id : ${sessionScope.memid}
	<c:if test="${sessionScope.memid == 'krack1'}">

		<table border="1">
		<tr >
			<td>ID</td>
			<td>PW</td>
			<td>BIRTH</td>
			<td>SEX</td>
			<td>ADDRESS</td>
			<td>FIRST</td>
			<td>SECOND</td>
			<td>THIRD</td>
			<td>EMAIL_ID</td>
			<td>SITE</td>
			<td>RECEIVE</td>
			<td>INTEREST</td>
			<td>REG_DATE</td>
		</tr>
		
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.id }</td>
				<td>${dto.pass1}</td>
				<td>${dto.birth}</td>
				<td>${dto.sex}</td>
				<td>${dto.address}</td>
				<td>${dto.first_number}</td>
				<td>${dto.second_number}</td>
				<td>${dto.third_number}</td>
				<td>${dto.email_id}</td>
				<td>${dto.email_site_text}</td>
				<td>${dto.receive}</td>
				<td>${dto.interest}</td>
				<td>${dto.reg_date}</td>
			</tr>
		</c:forEach>
		
		</table>
	
	</c:if>

	<jsp:useBean id="dto" class="test.bean.Dto" />
	<jsp:setProperty property="*" name="dto" />

	<table width="180" height="100">
		<tr align="center">
			<td><font color="red">로그인 되었습니다.</font></td>
		</tr>
		<tr>
			<td><input type="button" value="회원탈퇴" onclick="location.href='withdraw.hjh'" class="button"/>
		<input type="button" value="로그아웃" onclick="location.href= 'logout.hjh'" class="button" /><input type="button" value="정보수정" onclick="location.href='modify.hjh'" class="button"/>
		<input type="button" value="게시판" onclick="location.href='list.hjh'" class="button" /><br />
		</td>
		</tr>
	</table>
</c:if>



</body>

<script type="text/javascript">
	function go_id() {
		document.login_order.login_id.focus();
	}
	function go_pw() {
		document.login_order.login_pw.focus();
	}
</script>

</html>