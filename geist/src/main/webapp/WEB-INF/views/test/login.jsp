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
		아이디 : <input type="text" name="emp_id"><br>
		비밀번호 : <input type="password" name="emp_pw"><br>
		<button type="button" class="loginBtn">로그인</button>
	</div>
	<button type="button" class="registerBtn">회원 가입</button>
	<button type="button" class="idSearchBtn">아이디 찾기</button>
	<button type="button" class="pwSearchBtn">비밀번호 찾기</button>
	
<script type="text/javascript">
	var loginService = (function(){
		function login(param, callback, error){
			$.ajax({
				type : 'post',
				url : '/login/login',
				data : JSON.stringify(param),
				contentType : "application/json; charset=utf-8",
				success : function(result, status, xhr){
					if(callback){
						callback(result);
					}
				},
				error : function(xhr, status, err){
					if(error){
						error(err);
					}
				}
			});
		}
		
		return{
			login : login
		}
	})();

	$(document).ready(function(){
		var loginForm = $("#loginForm");
		var loginBtn = $(".loginBtn");
		var registerBtn = $(".registerBtn");
		var idSearchBtn = $(".idSearchBtn");
		var pwSearchBtn = $(".pwSearchBtn");
		
		loginBtn.on("click", function(){
			if(!loginForm.find("input[name='emp_id']").val()){
				alert("아이디를 입력하세요.");
				return false;
			}
			if(!loginForm.find("input[name='emp_pw']").val()){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			
			var emp_id = $("input[name='emp_id']").val();
			var emp_pw = $("input[name='emp_pw']").val();
			
			loginService.login({
				emp_id : emp_id,
				emp_pw : emp_pw
			}, function(result){
				if(result == 'success'){
					alert("로그인 성공!");
					location.href = "/main";
				}
				else{
					alert("아이디 또는 비밀번호가 잘못되었습니다.");
				}
			});
		});
		
		registerBtn.on("click", function(){
			location.href = "/register";
		});
		
		idSearchBtn.on("click", function(){
			location.href = "/idSearch";
		});
		
		pwSearchBtn.on("click", function(){
			location.href = "/pwSearch";
		});
	});
</script>
</body>
</html>