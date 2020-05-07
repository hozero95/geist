<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--
	회원가입 페이지
	담당 : 김호영
-->

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
	<h1>회원가입 페이지</h1>
	
	<div id="registerForm">
		아이디 : <input type="text" name="req_id"><button type="button" class="checkBtn">중복확인</button><br>
		비밀번호 : <input type="password" name="req_pw"><br>
		이름 : <input type="text" name="req_name"><br>
		생년월일 : <input type="text" name="req_birth"><br>
		개인 연락처 : <input type="text" name="req_phone"><br>
		이메일 : <input type="text" name="req_email"><br>
		주소 : <input type="text" name="req_address"><br>
		<button type="button" class="registerBtn">회원 가입</button>
	</div>
	<button type="button" class="backBtn">돌아가기</button>

<script type="text/javascript">
	var registerService = (function(){
		function checkId(param, callback, error){
			var req_id = param.req_id;
			$.getJSON("/register/" + req_id + ".json", function(data){
				if(callback){
					callback(data);
				}
			}).fail(function(xhr, status, err){
				if(error){
					error();
				}
			});
		}
		
		function joinRequest(param, callback, error){
			$.ajax({
				type : 'post',
				url : '/register/regist',
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
			checkId : checkId,
			joinRequest : joinRequest
		}
	})();

	$(document).ready(function(){
		var registerForm = $("#registerForm");
		var checkBtn = $(".checkBtn");
		var registerBtn = $(".registerBtn");
		var backBtn = $(".backBtn");
		var idCheck = true;
		
		checkBtn.on("click", function(e){
			if(!registerForm.find("input[name='req_id']").val()){
				alert("아이디를 입력하세요.");
				return false;
			}
			
			var req_id = $("input[name='req_id']").val();
			
			registerService.checkId({
				req_id : req_id
			}, function(data){
				if(data){
					checkBtn.prop("disabled", true);
					idCheck = false;
					alert("사용할 수 있는 아이디입니다.");
				}
				else{
					alert("사용할 수 없는 아이디입니다.");
				}
			});
		});
		
		registerBtn.on("click", function(e){
			if(!registerForm.find("input[name='req_id']").val()){
				alert("아이디를 입력하세요.");
				return false;
			}
			if(!registerForm.find("input[name='req_pw']").val()){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			if(!registerForm.find("input[name='req_name']").val()){
				alert("이름을 입력하세요.");
				return false;
			}
			if(!registerForm.find("input[name='req_birth']").val()){
				alert("생년월일을 입력하세요.");
				return false;
			}
			if(!registerForm.find("input[name='req_phone']").val()){
				alert("연락처를 입력하세요.");
				return false;
			}
			if(!registerForm.find("input[name='req_email']").val()){
				alert("이메일을 입력하세요.");
				return false;
			}
			if(!registerForm.find("input[name='req_address']").val()){
				alert("주소를 입력하세요.");
				return false;
			}
			if(idCheck){
				alert("아이디 중복확인을 해주세요.");
				return false;
			}
			
			var req_id = $("input[name='req_id']").val();
			var req_pw = $("input[name='req_pw']").val();
			var req_name = $("input[name='req_name']").val();
			var req_birth = $("input[name='req_birth']").val();
			var req_phone = $("input[name='req_phone']").val();
			var req_email = $("input[name='req_email']").val();
			var req_address = $("input[name='req_address']").val();
			
			registerService.joinRequest({
				req_id : req_id,
				req_pw : req_pw,
				req_name : req_name,
				req_birth : req_birth,
				req_phone : req_phone,
				req_email : req_email,
				req_address : req_address
			}, function(result){
				alert(result);
				location.href = "/login";
			});
		});
		
		backBtn.on("click", function(){
			location.href = "/login";
		});
	});
</script>
</body>
</html>