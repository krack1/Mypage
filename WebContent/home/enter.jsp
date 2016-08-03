<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import = "test.bean.Dao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>

<body>
<center>
	<input type="button" value ="JAEHO" onclick ="location.href='login.hjh'" class="buttontitle"/><br /><br />
	<h2>회원가입</h2>		
	</center>
<form method ="post" action = "enter_done.hjh" name="orderForm" onSubmit="return check_info()">
<table border = "1" align ="center" style = "width: 420px; height:160px; ">
	<tr style="height:45px;">
		<td>	
			&nbsp;&nbsp;<input type="text" name="id"  placeholder ="아이디" onkeyup = "chagekey()" style="font-family:고딕; font-size:14pt; width: 290px; border-right:0px; border-left:0px; border-top:0px; border-bottom:0px;"/> 		
			<input type="button" value = "중복확인"  onclick="check_id(this.form)" class="button" />
		</td>
	</tr>
	<tr style="height:45px;">
		<td>&nbsp;&nbsp;<input type="password" name = "pass1" placeholder ="비밀번호" onblur ="check_Same()" style="font-family:고딕; font-size:14pt; width: 300px; border-right:0px; border-left:0px; border-top:0px; border-bottom:0px;"/></td>
	</tr>
	<tr style="height:45px;">
		<td>&nbsp;&nbsp;<input type="password" name = "pass2" placeholder ="재입력" onblur = "check_Same()" style=" font-family:고딕; font-size:14pt; width: 300px; border-right:0px; border-left:0px; border-top:0px; border-bottom:0px;"/></td>
	</tr>
	<tr style="height:25px;">
		<td><div id ="pass_ok" class="passcheck"></div></td>
	</tr>

</table>

<table border = "1" align ="center" style = "width: 420px; height:420px;">
	<tr>
		<td>&nbsp;&nbsp;<input type="text" name="birth" placeholder ="생년월일" maxlength="6" style="font-size:14pt; width: 200px; border-right:0px; border-left:0px; border-top:0px; border-bottom:0px;"/>
		<font color = "blue" size="2">※주민등록번호 앞번호 6자리</font></td>
		</td>
				
	</tr>
	<tr>
		<td>
			<input type="radio" name="sex" value="male" /> 남
			<input type="radio" name="sex" value="female"/> 여
		</td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;<input type="text" name="address" placeholder ="주소" maxlength="6" style="font-size:14pt; width: 200px; border-right:0px; border-left:0px; border-top:0px; border-bottom:0px;"/></td>
	</tr>
	<tr>
		<td>
		&nbsp;&nbsp;
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
		</td>
	</tr>
	<tr>
		<td>
			
			<div class="title">메일</div>
			<input type="text" name="email_id" style="font-size:10pt; width: 80px; border-right:0px; border-left:0px; border-top:0px;  border-bottom:0px;"/> @ 
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
		</td>
	</tr>
	<tr>
		<td>
			<div class="title">메일수신</div>
			<input type="radio" name="receive" value="yes" /> 예 
			<input type="radio" name="receive" value="no" /> 아니오 
		</td>
	</tr>
	<tr>
		<td>
			<div class="title">취미</div>
			<select name="interest" style ="font-size:10pt;">
					<option selected value="">
						목록
					</option>
					<option value="패션">
						패션
					</option>
					<option value="운동">
						운동
					</option>
					<option value="게임">
						게임
					</option>
					<option value="영화">
						영화
					</option>
					<option value="여행">
						여행
					</option>
				</select>
		</td>
	</tr>
	

</table>
<center><input type="submit" value="가입하기" class="buttonin"/></center>	
</form>	
</body>


<script type="text/javascript">
	var checked_pass = false;
	var checked_id = false;
	var RegExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
	var emailExp = /^[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	var hanExp = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/;
	<%--아이디에 한글 특수문자 사용 여부 확인--%>
	function check_id(inputid) {
		if(inputid.id.value =="") {
			alert("아이디를 입력하세요");
			checked_id = false;
			return;
		}
		else if (inputid.id.value.search(hanExp) != -1) {
			alert("한글 사용 금지");
			document.orderForm.id.value = "";
			checked_id = false;
			return;
		 }
		else if(RegExp.test(inputid.id.value)) {
			alert("특수문자 사용 금지");
			document.orderForm.id.value = "";
			checked_id = false;
			return;				
		}		
		checked_id = true;
		url = "confirmId.jsp?id=" + inputid.id.value;
		open(url, "confirm", "toolbar=no, location=no, scrollbars=no, resizeable=no,width=300, height=180");
	}
	
	function chagekey() {
		checked_id = false;
	}
	
	function check_Same() {
		var pass1 = document.orderForm.pass1.value;
		var pass2 = document.orderForm.pass2.value;
		
		if(pass1 == "" || pass2 =="") {
			document.getElementById("pass_ok").innerHTML = "비밀번호를 입력하세요";
			return;
		}
		else if(pass1 == pass2 && RegExp.test(pass1)) {
			document.getElementById("pass_ok").innerHTML = "비밀번호가 일치합니다.";
			checked_pass = true;
			return;
		}
		else if(pass1 == pass2 && !RegExp.test(pass1)) {
			document.getElementById("pass_ok").innerHTML = "비밀번호에는 특수문자가 하나 이상 들어가야합니다.";
			return;
		}
		else if(pass1 != pass2) {
			document.getElementById("pass_ok").innerHTML = "비밀번호가 일치하지 않습니다.";
			return;
		}
		
		
	}
	
	function change_text() {
        document.orderForm.email_site_text.value = document.orderForm.email_site_select.value;

	}
	
	function check_info() {
		var sec = document.orderForm.second_number.value;
		var thi = document.orderForm.third_number.value;
		var bir = document.orderForm.birth.value;
		var NumExp = /^[0-9]+$/;
		
		if(document.orderForm.id.value == "") {
			alert("id를 입력하세요");
			document.orderForm.id.focus();
			return false;
		}
		if(document.orderForm.pass1.value == ""){
			alert("암호를 입력하세요");
			document.orderForm.pass1.focus();
			return false;
		}
		if(document.orderForm.birth.value == ""){
			alert("생년월일을 입력하세요");
			document.orderForm.birth.focus();
			return false;
		}
		if(document.orderForm.sex.value == ""){
			alert("성별을 입력하세요");
			document.orderForm.sex.focus();
			return false;
		}
		if(document.orderForm.first_number.value == "" || document.orderForm.second_number.value == "" || document.orderForm.third_number.value == ""){
			alert("핸드폰 번호를입력하세요");
			document.orderForm.first_number.focus();
			return false;
		}
		if(document.orderForm.email_id.value =="" || document.orderForm.email_site_text.value == ""){
			alert("메일 주소를 입력하세요");
			document.orderForm.email_id.focus();
			return false;
		}
		if(checked_pass == false) {
			alert("비밀번호 일치확인을 해주세요");
			document.orderForm.pass1.focus();
			return false;
		}
		if(checked_id == false) {
			alert("id 중복을 확인해 주세요");
			document.orderForm.id.focus();
			return false;
		}
		if(!NumExp.test(sec) || !NumExp.test(thi)) {
			alert("핸드폰 번호를 제대로 입력하세요");
			document.orderForm.second_number.focus();
			return false;
		}
		if(!NumExp.test(bir)) {
			alert("생년월일을 제대로 입력하세요");
			document.orderForm.birth.focus();
			return false;
		}
		if(emailExp.test(document.orderForm.email_site_text.value) == false) {
			alert("이메일 주소를 확인하세요.");
			document.orderForm.email_site_text.focus();
			return false;
		}
	}
</script>
</html>