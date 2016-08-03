<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import ="test.bean.Dto" %>
    <%@page import ="test.bean.Dao" %>
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
int result = dao.select_id(dto.getId());

if(result == 1) {%>
	<center><b><font color="red"><jsp:getProperty property="id" name="dto"/></font>는 이미 사용중인 <br />
	아이디 입니다.</b><br /></center>
	<form name="checkForm" method="post" action="confirmId.hjh">
		<center><input type="text" name = "id" /><input type ="submit" value="중복확인" /></center>
	</form>
<%	
}else{%>
	<center><b>입력하신<font color="red"><jsp:getProperty property="id" name="dto"/></font>는<br />
	사용할수 있는 아이디입니다.</b><br /><br />
	<input type="button" value="닫기" onclick="setid()" class="button2"/></center>
<%	
}
%>

</body>

<script type="text/javascript">
	
		function setid() {
			opener.document.orderForm.id.value="<%=dto.getId()%>";
			opener.checked_id = true;
			self.close();
		}
		
	
</script>
</html>