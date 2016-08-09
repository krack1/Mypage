<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String p = request.getParameter("page");
		System.out.println(p);
	%>
	<header style="height:80px; border-bottom:1px solid gray;">
		<jsp:include page="top.jsp" flush="false" />
	</header>
	
	<div style="width:100%; height:70%;">
	<c:set var = "page" value="<%=p %>" />
	
	<c:if test="${page == null }" >
		<jsp:include page="index1.jsp" flush="false" />
	</c:if>
	<c:if test="${page != null }" >
		<jsp:include page="index${page}.jsp" flush="false" />
	</c:if>
	
		
	</div>

</body>
</html>