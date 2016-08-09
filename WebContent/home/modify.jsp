<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/Mypage/style/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
	table {
		border-style: none;
		border-width:1px;
	}
	td{
		
		border-style: solid;
		border-color: #D5D5D5;
	}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${id != null}">
	<center>
	<input type="button" value ="JAEHO" onclick ="location.href='login.hjh'" class="buttontitle"/><br /><br />
	<h2>회원정보수정</h2>		
	</center>
	<form method ="post" action = "modifyDone.hjh" name="orderForm" onSubmit="return check_info()">
	<table border = "1" align ="center" style = "width: 420px; height:160px; ">
	<tr style="height:45px;">
		<td>
			<div class="title">아이디</div>
			<div class="content">${ id}</div>
			
		</td>
	</tr>
	<tr style="height:45px;">
		<td>
		<div class="title">비밀번호</div>
		<input type="password" name = "pass1" value="${pass1}" onblur ="check_Same()" style="width: 100px; border-right:0px; border-left:0px; border-top:0px;  border-bottom:0px;"/>
		</td>
	</tr>
	<tr style="height:45px;">
		<td>
		<div class="title">재입력</div>
		<input type="password" name = "pass2" value="${pass1}" onblur = "check_Same()" style="width: 100px; border-right:0px; border-left:0px; border-top:0px;  border-bottom:0px;"/> 
		</td>
	</tr>
	<tr style="height:25px;">
		<td><div id ="pass_ok" class="passcheck"></div></td>
	</tr>

</table>

<table border = "1" align ="center" style = "width: 420px; height:420px;">
	<tr>
		<td>
			<div class="title">이름</div>
			<div class="content">${name }</div>
		</td>
	</tr>
	<tr>
		<td>
		<div class="title">생년월일</div>
		<div class="content">${birth }</div>
		</td>
	</tr>
	<tr>
		<td>
			<div class="title">성별</div>
			<div class="content">${sex }</div>
			
		</td>
	</tr>
	<tr>
		<td>
		<div class="title">주소</div>
		<input type="text" name="address" value="${address}" style="width: 280px; border-right:0px; border-left:0px; border-top:0px;  border-bottom:0px;" ></td>
	</tr>
	<tr>
		<td>
		<div class="title">핸드폰</div>
		<c:if test="${first_number =='010' }">
				<select name = "first_number">
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
		</c:if>
		<c:if test="${first_number =='016' }">
			<select name = "first_number">
					<option value="010">
					010
					</option>
					<option selected value="016">
					016
					</option>
					<option value="019">
					019
					</option>
			</select> 
		</c:if>
		<c:if test="${first_number =='019' }">
			<select name = "first_number">
					<option  value="010">
					010
					</option>
					<option value="016">
					016
					</option>
					<option selected value="019">
					019
					</option>
			</select>
		</c:if>
				&nbsp;&nbsp;<input type ="text" maxlength="4" name = "second_number" value="${second_number }" style="width: 100px; border-right:0px; border-left:0px; border-top:0px; border-bottom:0px;"/>
				<input type ="text" maxlength="4" name = "third_number" value="${third_number }" style="width: 100px; border-right:0px; border-left:0px; border-top:0px; border-bottom:0px;"/>
		</td>
	</tr>
	<tr>
		<td>
			<div class="title">메일</div>
			<input type="text" size="20" name="email_id" value="${email_id }" style="width: 80px; border-right:0px; border-left:0px; border-top:0px;  border-bottom:0px;"/> @ 
			<input type="text" size="20"   name="email_site_text" value="${email_site_text }" style="width: 100px; border-right:0px; border-left:0px; border-top:0px; border-bottom:0px;"/>
			<select  name ="email_site_select" onchange="change_text()">
				<option selected value = "">
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
		</td>
	</tr>
	<tr>
		<td>
			<div class="title">메일수신</div>
			
			<c:if test="${receive == 'yes'}">
				<input type="radio" name="receive" checked value="yes" /> 예 
				<input type="radio" name="receive" value="no" /> 아니오 
			</c:if>
			<c:if test="${receive == 'no'}">
				<input type="radio" name="receive" value="yes" /> 예 
				<input type="radio" name="receive" checked value="no" /> 아니오 
			</c:if>
		</td>
	</tr>
	
	

</table>
<center><input type="submit" value="수정하기" class="buttonin"/></center>	
</form>

</c:if>
<c:if test="${id == null }">
	<script>
		alert("로그인을 해주세요");
		location.href='login.hjh';
	</script>
</c:if>	
</body>

<script type="text/javascript">

var checked_pass = true;
var RegExp = "~!@#$%^&*()_+|{}:\\\"\'<>?`[];,./";
var emailExp = /^[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

	function check_info() {
				
		var sec = document.orderForm.second_number.value;
		var thi = document.orderForm.third_number.value;
		var NumExp = /^[0-9]+$/;
		
		
		if(checked_pass == false) {
			alert("비밀번호 일치확인을 해주세요");
			document.orderForm.pass1.focus();
			return false;
		}
		else if(document.orderForm.pass1.value == "" || document.orderForm.pass2.value == "") {
			alert("암호를 입력하세요");
			document.orderForm.pass1.focus();
			return false;
		}
		else if(document.orderForm.first_number.value == "" || document.orderForm.second_number.value == "" || document.orderForm.third_number.value == ""){
			alert("핸드폰 번호를입력하세요");
			document.orderForm.first_number.focus();
			return false;
		}
		else if(document.orderForm.email_id.value =="" || document.orderForm.email_site_text.value == ""){
			alert("메일 주소를 입력하세요");
			document.orderForm.email_id.focus();
			return false;
		}
		if(emailExp.test(document.orderForm.email_site_text.value) == false) {
			alert("이메일 주소를 확인하세요.");
			document.orderForm.email_site_text.focus();
			return false;
		}
		else if(!NumExp.test(sec) || !NumExp.test(thi)) {
			alert("핸드폰 번호를 제대로 입력하세요");
			document.orderForm.second_number.focus();
			return false;
		}
		
	
	}

	function check_Same() {
		var pass1 = document.getElementsByName("pass1").item(0).value;
		var pass2 = document.getElementsByName("pass2").item(0).value;
		
		
		if(pass1 == "" || pass2 =="") {
			document.getElementById("pass_ok").innerHTML = "비밀번호를 입력하세요";
			checked_pass = false;
		}
		else{
			if(pass1 == pass2) {
				
				for(var i = 0 ; i < pass1.length ; i++){
					if(RegExp.indexOf(pass1.charAt(i)) != -1){
						document.getElementById("pass_ok").innerHTML = "비밀번호가 일치합니다.";
						checked_pass = true;
						return true;
					}								
				}
				document.getElementById("pass_ok").innerHTML = "비밀번호에는 특수문자가 하나 이상 들어가야합니다.";
				checked_pass = false;
				return false;
			}
			else {
				document.getElementById("pass_ok").innerHTML = "비밀번호가 일치하지 않습니다.";
				checked_pass = false;
			}
		}
		
		
		
	}

	function change_text() {
		document.orderForm.email_site_text.value = document.orderForm.email_site_select.value;
	
	}
</script>
</html>