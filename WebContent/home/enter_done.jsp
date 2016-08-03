<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.util.*, java.sql.*" %>
    <%@page import="test.bean.Dto" %>
    <%@page import="test.bean.Dao" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="/Mypage/style/style.css" rel="stylesheet" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="dto" class="test.bean.Dto" />
	<jsp:setProperty property="*" name="dto"/>
	
	<%
	Dao dao = Dao.getInstance();
	dao.insert(dto);
	int result = dao.select_id(dto.getId());
	if(result == 1) {%>
		<script>
		alert("회원가입이 성공적으로 이루어졌습니다.");
		location.href='login.hjh';
	</script>
	<%}
	%>
	
	

	

</body>
</html>