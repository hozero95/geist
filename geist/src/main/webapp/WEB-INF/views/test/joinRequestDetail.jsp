<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 
	가입 승인 상세 조회 페이지
	담당 : 김호영
 -->

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>가입 승인 상세 조회</title>
</head>
<body>
	<div id="btnForm">
		아이디 : <input type="text" name="req_id" value="${req_id}" readonly><br>
		이름 : <input type="text" name="req_name" readonly><br>
		생년월일 : <input type="text" name="req_birth" readonly><br>
		개인 연락처 : <input type="text" name="req_phone" readonly><br>
		이메일 : <input type="text" name="req_email" readonly><br>
		주소 : <input type="text" name="req_address" readonly><br>
		<hr>
		직급 : <input type="text" name="emp_position"><br>
		연봉 : <input type="text" name="emp_sal"><br>
		부서 : <input type="text" name="dept_name"><br>
		<br>
		<button type="button" class="insertBtn">가입 승인</button>
		<button type="button" class="deleteBtn">가입 거절</button>
	</div>

<script type="text/javascript">
	var joinRequestDetailService = (function(){
		function detailView(param, callback, error){
			var req_id = param.req_id;
			$.getJSON("/joinRequest/detailView/" + req_id + ".json", function(data){
				if(callback){
					callback(data);
				}
			}).fail(function(xhr, status, err){
				if(error){
					error();
				}
			});
		}
		
		function insertEmp(param, callback, error){
			$.ajax({
				type : 'post',
				url : '/joinRequest/detailView',
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
		
		function deleteRequest(req_id, callback, error){
			$.ajax({
				type : 'delete',
				url : '/joinRequest/detailView/' + req_id,
				success : function(deleteResult, status, xhr){
					if(callback){
						callback(deleteResult);
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
			detailView : detailView,
			insertEmp : insertEmp,
			deleteRequest : deleteRequest
		}
	})();
	
	$(document).ready(function(){
		var btnForm = $("#btnForm");
		var insertBtn = $(".insertBtn");
		var deleteBtn = $(".deleteBtn");
		
		detailView($("input[name='req_id']").val());
		
		function detailView(req_id){
			joinRequestDetailService.detailView({
				req_id : req_id
			}, function(data){
				$("input[name='req_id']").val(data.req_id);
				$("input[name='req_name']").val(data.req_name);
				$("input[name='req_birth']").val(data.req_birth);
				$("input[name='req_phone']").val(data.req_phone);
				$("input[name='req_email']").val(data.req_email);
				$("input[name='req_address']").val(data.req_address);
			});
		}
		
		insertBtn.on("click", function(e){
			if(!btnForm.find("input[name='emp_position']").val()){
				alert("직급을 작성하세요.");
				return false;
			}
			if(!btnForm.find("input[name='emp_sal']").val()){
				alert("연봉을 작성하세요.");
				return false;
			}
			if(!btnForm.find("input[name='dept_name']").val()){
				alert("부서를 작성하세요.");
				return false;
			}
			
			var req_id = $("input[name='req_id']").val();
			var emp_position = $("input[name='emp_position']").val();
			var emp_sal = $("input[name='emp_sal']").val();
			var dept_name = $("input[name='dept_name']").val();
			
			if(emp_position != "사원" && emp_position != "대리" && emp_position != "차장" && emp_position != "과장" && emp_position != "부장" && emp_position != "사장"){
				alert("없는 직급입니다.");
				return false;
			}
			
			joinRequestDetailService.insertEmp({
				req_id : req_id,
				emp_position : emp_position,
				emp_sal : emp_sal,
				dept_name : dept_name
			}, function(result){
				joinRequestDetailService.deleteRequest(req_id, function(result2){
					alert(result2);
					self.close();
				});
			});
		});
		
		deleteBtn.on("click", function(e){
			var req_id = $("input[name='req_id']").val();
			joinRequestDetailService.deleteRequest(req_id, function(result){
				alert(result);
				self.close();
			});
		});
	});
</script>
</body>
</html>