<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 
	가입 승인 상세 조회 
	담당 : 김현선
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
		주소 : <input type="text" name="req_address" readonly><br>
		<hr>
		직급 : <input type="text" name="emp_position"><br>
		연봉 : <input type="text" name="emp_sal"><br>
		부서 : <input type="text" name="dept_name"><br>
		<br>
		<button type="button" class="insertBtn">가입 승인</button>
		<button type="button" class="deleteBtn">가입 거절</button>
	</div>

<script type="text/javascript" src="/resources/js/admin-page-approve-detail.js"></script>
</body>
</html>