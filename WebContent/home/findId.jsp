<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="findIdAct.hjh" method="post" >
	<select name = "first_number" style ="font-size:10pt;">
					<option selected value="010">
					010
					</option>
					<option value="016">
					016
					</option>
					<option value="019">
					019
					</option>
				</select>
				<input type ="text" maxlength="4" name = "second_number"  style="font-size:12pt; width: 50px; border-right:0px; border-left:0px; border-top:0px; border-bottom:0px;"/>
				-&nbsp;&nbsp;<input type ="text" maxlength="4" name = "third_number" style="font-size:12pt; width: 50px; border-right:0px; border-left:0px; border-top:0px; border-bottom:0px;"/>
	<input type="submit" value="확인" />
</form>

</body>
</html>