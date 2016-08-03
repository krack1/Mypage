<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/Mypage/style/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body> 
    <div id="container" style="width:180px; height:60px;">
    <div id="login" style="width:60px; height:61px; float:right; border-top:1px solid #747474; border:1px solid #747474;">
    <input type="button" value="로그인" class="login"/>
    </div>
    <div id="id" style="width:117px; height:30px; float:left; border-top:1px solid #747474; border-left:1px solid #747474;">
    <input type="text" placeholder="아이디"  class="loginid"/>
    </div>
    <div id="pass" style="width:117px; height:30px; float:left; border-top:1px solid #747474; border-left:1px solid #747474; border-bottom:1px solid #747474;">
    <input type="password" placeholder="패스워드"  class="loginpass"/>
    </div>
    </div>
 	<div id = "div1" onclick="ok()" class="title">MAIL</div>
</body>

<script>
	function ok() {
		document.getElementById("div1").innerHTML = "메일";
	}
</script>
</html>