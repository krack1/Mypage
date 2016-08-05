<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/Mypage/style/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr style="height:45px;">
		<td>
		<div class="title">비밀번호</div>
		<input type="password" name = "pass1"  onblur ="check_Same()" style="width: 100px; border-right:0px; border-left:0px; border-top:0px;  border-bottom:0px;"/>
		</td>
	</tr>
	<tr style="height:45px;">
		<td>
		<div class="title">재입력</div>
		<input type="password" name = "pass2"  onblur = "check_Same()" style="width: 100px; border-right:0px; border-left:0px; border-top:0px;  border-bottom:0px;"/> 
		</td>
	</tr>
	<tr style="height:25px;">
		<td><div id ="pass_ok" class="passcheck"></div></td>
	</tr>
</table>
</body>

<script>

	
var checked_pass = true;
var RegExp =  "~!@#$%^&*()_+|{}:\\\"\'<>?`[];,./";
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
		
		if(emailExp.test(document.getElementsByName(email_site_text).item(0).value) == false) {
			alert("이메일 주소를 확인하세요.");
			document.orderForm.email_site_text.focus();
		}
		
	}

	function change_text() {
		document.orderForm.email_site_text.value = document.orderForm.email_site_select.value;
	
	}
</script>
</html>