<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var emailExp = /^[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	
	function go() {
		 
		 if(emailExp.test(document.orderForm.email_site_text.value) == false) {
				alert("이메일 주소를 확인하세요.");
				document.orderForm.email.focus();
				return false;
			}
	}
	
	function change_text() {
        document.orderForm.email_site_text.value = document.orderForm.email_site_select.value;

	}
</script>
</head>
<body>
<form method="post" action="findPw.hjh" name="orderForm" onSubmit="return go()">
	ID : <input type="text" name="id" /><br />
	이메일 : <input type="text" name="email_id" style="font-size:10pt; width: 80px; border-right:0px; border-left:0px; border-top:0px;  border-bottom:0px;"/> @ 
			<input type="text" name="email_site_text" style="font-size:10pt; width: 100px; border-right:0px; border-left:0px; border-top:0px;  border-bottom:0px;"/>
			<select  name ="email_site_select" onchange="change_text()" style ="font-size:10pt;">
				<option value = "">
					직접입력 
				</option>
				<option value = "google.com">
					google.com
				</option>
				<option value = "naver.com">
					naver.com
				</option>
				<option value = "hanmail.net">
					hanmail.net
				</option>
				<option value = "yahoo.com">
					yahoo.com
				</option>
			</select>
	<input type="submit" value="확인" />
</form>

</body>
</html>