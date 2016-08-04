<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import ="test.bean.Dto"%>
<%@ page import ="test.bean.Dao"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="/Mypage/style/style.css" rel="stylesheet" type="text/css">
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="dto" class="test.bean.Dto" />
<jsp:setProperty property="*" name="dto"/>	
	
<%
	Dao dao = Dao.getInstance();
	dto.setId((String)session.getAttribute("memid"));
	dao.updateInfo(dto);
%>
<script>
	alert("회원정보가 수정되었습니다");
	location.href="login.hjh";
</script>
