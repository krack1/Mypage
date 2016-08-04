<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="/Mypage/style/style.css" rel="stylesheet" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%%>

<c:if test="${result == 1}">
	<script>
		alert("아이디를 다시 입력해 주세요");
		history.go(-1);
	</script>
</c:if>
<c:if test="${result == 2}">
	<script>
		alert("비밀번호가 틀렸습니다.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${result == 3}">
		<c:redirect url="login.hjh" />	
</c:if>

</body>

</html>