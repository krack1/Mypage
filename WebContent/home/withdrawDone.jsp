<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import = "test.bean.Dto" %>
    <%@page import = "test.bean.Dao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="/Mypage/style/style.css" rel="stylesheet" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<%
String pw = request.getParameter("pw");
Dao dao = Dao.getInstance();
boolean result = dao.delete(session.getAttribute("memid").toString(), pw);
if(result == true) {
session.invalidate();%>
	<script>
	alert("탈퇴가 정상적으로 이루어 졌습니다.");
	location.href="login.hjh";
	</script>	
<%
}else{%>
	<script>
	alert("비밀번호가 틀렸습니다. 다시 입력해주세요");
	location.href="withdraw.hjh";
	</script>
<%	
}
%>


</body>
</html>