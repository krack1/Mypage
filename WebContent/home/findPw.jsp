<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	function check() {
		var checknum = document.orderForm.checknum.value;
		var inputnum = document.orderForm.inputnum.value;
			
		if(checknum == inputnum){

			return true;
		}
		else{

			alert("인증번호가 틀렸습니다.");
			return false;
		}
	}
</script>
</head>
<body>
<form method="post" name="orderForm" action = "findPwAct.hjh" onSubmit="return check()">
<input type="hidden" name="checknum" value="${checknum }" />
<input type="text" name="inputnum" />
<input type="submit" value="인증하기" />

</form>

</body>
</html>