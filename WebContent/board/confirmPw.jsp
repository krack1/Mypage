<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href = "/Mypage/style/style.css" rel = "stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<center><input type="button" value ="JAEHO" onclick ="location.href='login.hjh'" class="buttontitle"/><br /><br /></center>

<c:if test="${sessionScope.memid == 'krack1' }">
	<c:redirect url="content.hjh?num=${num }&pageNum=${pageNum }&writer=${writer }" />
</c:if>

<c:if test="${writer == sessionScope.memid }">
	<form action="content.hjh?num=${num }&pageNum=${pageNum }&writer=${writer}" method="post">
		비밀번호<input type="password" name="passwd" />
		<input type="submit" value="확인" />
		<input type="button" value="글목록" onclick="document.location.href='/list.hjh?pageNum=${pageNum}'" />	
	</form>
</c:if>
<c:if test="${writer != sessionScope.memid }">
		<script>
			alert("본인만 확인할수 있습니다.");
			history.go(-1);
		</script>
</c:if>

</body>
</html>