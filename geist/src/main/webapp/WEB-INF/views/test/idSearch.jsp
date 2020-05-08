<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--
	아이디 찾기 페이지
	담당 : 김호영
-->

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>아이디 찾기 페이지</title>
</head>
<body>
	<h1>아이디 찾기</h1>
	
	<div id="searchForm">
		휴대폰 번호 : <input type="text" name="emp_phone"><br>
		이메일 : <input type="text" name="emp_email"><br>
		<button type="button" class="idSearchBtn">아이디 찾기</button>
	</div>
	
	<button type="button" class="pwSearchBtn">비밀번호 찾기</button>
	<button type="button" class="backBtn">돌아가기</button>
	
<script type="text/javascript">
	var idSearchService = (function(){
		function idSearch(param, callback, error){
			$.ajax({
				type : 'post',
				url : '/login/idSearch',
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
			idSearch : idSearch
		}
	})();
	
	$(document).ready(function(){
		var searchForm = $("#searchForm");
		var idSearchBtn = $(".idSearchBtn");
		var pwSearchBtn = $(".pwSearchBtn");
		var backBtn = $(".backBtn");
		
		idSearchBtn.on("click", function(){
			if(!searchForm.find("input[name='emp_phone']").val()){
				alert("휴대폰 번호를 입력하세요.");
				return false;
			}
			if(!searchForm.find("input[name='emp_email']").val()){
				alert("이메일을 입력하세요.");
				return false;
			}
			
			var emp_phone = $("input[name='emp_phone']").val();
			var emp_email = $("input[name='emp_email']").val();
			
			idSearchService.idSearch({
				emp_phone : emp_phone,
				emp_email : emp_email
			}, function(result){
				if(result == 'fail'){
					alert("회원 정보가 없습니다.");
				}
				else{
					alert("회원님의 아이디는 " + result + " 입니다.");
				}
			});
		});
		
		pwSearchBtn.on("click", function(){
			location.href = "/pwSearch";
		});
		
		backBtn.on("click", function(){
			location.href = "/login";
		});
	});
</script>
</body>
</html>