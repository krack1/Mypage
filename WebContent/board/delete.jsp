<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href = "/Mypage/style/style.css" rel = "stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<center><input type="button" value ="JAEHO" onclick ="location.href='login.hjh'" class="buttontitle"/><br /><br /></center>
<c:if test="${sessionScope.memid == 'krack1' }">
	<c:redirect url="deleteAct.hjh?num=${num }&pageNum=${pageNum }" />
</c:if>
<c:if test="${sessionScope.memid != 'krack1' }">
	<form action="deleteAct.hjh?pageNum=${pageNum }" method="post">
		암호를 입력하세요<input type="password" name="passwd"/>
		<input type="hidden" name="num" value="${num }" />
		<input type="submit" value="삭제" /><input type="button" value="글목록" onclick="document.location.href='list.hjh?pageNum=${pageNum}'"/>
	</form>
</c:if>

</body>
</html>