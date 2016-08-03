<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import = "java.util.*" %>
    <%@page import = "java.sql.*" %>
    <%@page import = "test.bean.Dto" %>
    <%@page import = "test.bean.Dao" %>
    <%@page import = "javax.servlet.http.Cookie" %>
    <%@page import = "javax.servlet.http.HttpServletResponse" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="/Mypage/style/style.css" rel="stylesheet" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="dto" class="test.bean.Dto" />
<jsp:setProperty property="*" name="dto" />

<%
	Dao dao = Dao.getInstance();
	int result = dao.loginCheck(dto);
	if(result == 1) {%>
	<script>
		alert("아이디를 다시 입력해 주세요");
		history.go(-1);
	</script>
	<%
	}else if(result == 2) {%>
		<script>
		alert("비밀번호가 틀렸습니다.");
		history.go(-1);
	</script>
	<%
	
	}else if(result == 3) {
		
	if(request.getParameter("keeplogin") != null){
		Cookie cookie = new Cookie("cooid", dto.getLogin_id());
		cookie.setMaxAge(300);
		response.addCookie(cookie);
	}
	session.setAttribute("memid", dto.getLogin_id());
	response.sendRedirect("login.hjh");
	}
%>
	

</body>

</html>