<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--
	비밀번호 찾기 페이지
	담당 : 김호영
-->

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
	<h1>비밀번호 찾기</h1>
	
	<div id="searchForm">
		아이디 : <input type="text" name="emp_id"><br>
		휴대폰 번호 : <input type="text" name="emp_phone"><br>
		이메일 : <input type="text" name="emp_email"><br>
		<button type="button" class="pwSearchBtn">비밀번호 찾기</button>
	</div>
	
	<button type="button" class="idSearchBtn">아이디 찾기</button>
	<button type="button" class="backBtn">돌아가기</button>
	
<script type="text/javascript">
	var pwSearchService = (function(){
		function pwSearch(param, callback, error){
			$.ajax({
				type : 'post',
				url : '/login/pwSearch',
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
			pwSearch : pwSearch
		}
	})();

	$(document).ready(function(){
		var searchForm = $("#searchForm");
		var pwSearchBtn = $(".pwSearchBtn");
		var idSearchBtn = $(".idSearchBtn");
		var backBtn = $(".backBtn");
		
		pwSearchBtn.on("click", function(){
			if(!searchForm.find("input[name='emp_id']").val()){
				alert("아이디를 입력하세요.");
				return false;
			}
			if(!searchForm.find("input[name='emp_phone']").val()){
				alert("휴대폰 번호를 입력하세요.");
				return false;
			}
			if(!searchForm.find("input[name='emp_email']").val()){
				alert("이메일을 입력하세요.");
				return false;
			}
			
			var emp_id = $("input[name='emp_id']").val();
			var emp_phone = $("input[name='emp_phone']").val();
			var emp_email = $("input[name='emp_email']").val();
			
			pwSearchService.pwSearch({
				emp_id : emp_id,
				emp_phone : emp_phone,
				emp_email : emp_email
			}, function(result){
				if(result == 'fail'){
					alert("회원 정보가 없습니다.");
				}
				else{
					alert("회원님의 비밀번호는 " + result + " 입니다.");
				}
			});
		});
		
		idSearchBtn.on("click", function(){
			location.href = "/idSearch";
		});
		
		backBtn.on("click", function(){
			location.href = "/login";
		});
	});
</script>
</body>
</html>