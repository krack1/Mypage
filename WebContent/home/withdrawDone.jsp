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

<c:if test="${result == true }">
	<script>
		alert("탈퇴가 정상적으로 이루어 졌습니다.");
		location.href="login.hjh";
	</script>	
</c:if>
<c:if test="${result == false }">
	<script>
		alert("비밀번호가 틀렸습니다. 다시 입력해주세요");
		location.href="withdraw.hjh";
	</script>
</c:if>


</body>
</html>