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

<c:if test="${delete == true }">
	<c:redirect url="list.hjh?pageNum=${pageNum}" />
</c:if>
<c:if test="${delete == false }">
	<script type="text/javascript">
		alert("비밀번호를 다시 입력해 주세요");
		history.go(-1);
		</script>
</c:if>

</body>
</html>