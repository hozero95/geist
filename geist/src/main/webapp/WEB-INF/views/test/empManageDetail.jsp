<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--
	사원 상세 조회 페이지
	담당 : 김호영
-->

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>사원 상세 조회</title>
</head>
<body>
	<div id="btnForm">
		사원 번호 : <input type="text" name="emp_no" value="${emp_no}" readonly><br>
		아이디 : <input type="text" name="emp_id" readonly><br>
		이름 : <input type="text" name="emp_name" readonly><br>
		생일 : <input type="text" name="emp_birth" readonly><br>
		개인 연락처 : <input type="text" name="emp_phone" readonly><br>
		사내 연락처 : <input type="text" name="emp_tel" readonly><br>
		이메일 : <input type="text" name="emp_email" readonly><br>
		주소 : <input type="text" name="emp_address" readonly><br>
		직급 : <input type="text" name="emp_position"><br>
		연봉 : <input type="text" name="emp_sal"><br>
		입사일 : <input type="text" name="emp_date" readonly><br>
		부서 : <input type="text" name="dept_name"><br>
		<br>
		<button type="button" class="modifyBtn">수정</button>
		<button type="button" class="deleteBtn">삭제</button>
	</div>
	
<script type="text/javascript">
	var empManageDetailService = (function(){
		function detailView(param, callback, error){
			var emp_no = param.emp_no;
			$.getJSON("/empManage/detailView/" + emp_no + ".json", function(data){
				if(callback){
					callback(data);
				}
			}).fail(function(xhr, status, err){
				if(error){
					error();
				}
			});
		}
		
		function modifyEmp(param, callback, error){
			$.ajax({
				type : 'put',
				url : '/empManage/detailView/modify',
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
			detailView : detailView,
			modifyEmp : modifyEmp
		};
	})();

	$(document).ready(function(){
		var btnForm = $("#btnForm");
		var modifyBtn = $(".modifyBtn");
		var deleteBtn = $(".deleteBtn");
		
		detailView($("input[name='emp_no']").val());
		
		function detailView(emp_no){
			empManageDetailService.detailView({
				emp_no : emp_no
			}, function(data){
				$("input[name='emp_no']").val(data.emp_no);
				$("input[name='emp_id']").val(data.emp_id);
				$("input[name='emp_name']").val(data.emp_name);
				$("input[name='emp_birth']").val(data.emp_birth);
				$("input[name='emp_phone']").val(data.emp_phone);
				$("input[name='emp_tel']").val(data.emp_tel);
				$("input[name='emp_email']").val(data.emp_email);
				$("input[name='emp_address']").val(data.emp_address);
				$("input[name='emp_position']").val(data.emp_position);
				$("input[name='emp_sal']").val(data.emp_sal);
				$("input[name='emp_date']").val(data.emp_date);
				$("input[name='dept_name']").val(data.dept_name);
			});
		}
		
		modifyBtn.on("click", function(e){
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
			
			var emp_no = $("input[name='emp_no']").val();
			var emp_position = $("input[name='emp_position']").val();
			var emp_sal = $("input[name='emp_sal']").val();
			var dept_name = $("input[name='dept_name']").val();
			
			if(emp_position != "사원" && emp_position != "대리" && emp_position != "차장" && emp_position != "과장" && emp_position != "부장" && emp_position != "사장"){
				alert("없는 직급입니다.");
				return false;
			}
			
			empManageDetailService.modifyEmp({
				emp_no : emp_no,
				emp_position : emp_position,
				emp_sal : emp_sal,
				dept_name : dept_name
			}, function(result){
				alert(result);
				self.close();
			});
		});
	});
</script>
</body>
</html>