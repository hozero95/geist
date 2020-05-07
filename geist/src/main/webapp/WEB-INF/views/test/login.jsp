<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--
	로그인 페이지
	담당 : 김호영
-->

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
	<h1>로그인 페이지</h1>
	
	<div id="loginForm">
		아이디 : <input type="text" name="id"><br>
		비밀번호 : <input type="password" name="password"><br>
		<button type="button" class="loginBtn">로그인</button>
	</div>
	<button type="button" class="registerBtn">회원 가입</button>
	
<script type="text/javascript">
	$(document).ready(function(){
		var registerBtn = $(".registerBtn");
		
		registerBtn.on("click", function(){
			location.href = "/register";
		});
	});
</script>
</body>
</html>