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
	<!-- main Css-->
    <link href="/resources/css/document.css" rel="stylesheet" />
    <link href="/resources/css/main.css" rel="stylesheet" />
   	<!-- Bootstrap -->
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
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
		사내연락처: <input type="text" name="emp_tel"><br>
		<br>
		<button type="button" class="insertBtn">가입 승인</button>
		<button type="button" class="deleteBtn">가입 거절</button>
	</div>

<script type="text/javascript" src="/resources/js/admin-page-approve-detail.js"></script>
</body>
</html>