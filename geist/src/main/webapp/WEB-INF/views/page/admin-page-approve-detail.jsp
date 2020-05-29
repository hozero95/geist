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
	<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pwdfind.css">
	<meta charset="UTF-8">
	<title>가입 승인 상세 조회</title>
	<style>
	#input-out{
		border : none;
		width : 100%;
		height : 30px;
	}
	#input-in{
		width : 100%;
		height : 30px;
	}
	.dt-button{
		margin : 5px 10px;
	}
	.menu{
		height : 25px;
	}
	.top{
		height : 63px;
	}
	</style>
	
</head>
<body style="overflow:hidden;">
	<div class="wrap">
	    <div id="header">
	        <div class="top">
	            <h1>
	                <a href="javascript:void(0)" class="logo"><span class="logo">GEIST</span></a>
	            </h1>
	        </div>
	        <div class="menu">
	            <ul class="menu_type">
	                
	            </ul>
	        </div>
        </div>
	</div>
	<div id="btnForm">
		<table class="type09">
			<thead>
			    <th scope="row">아이디</th>
				<td><input type="text" id="input-out" name="req_id" value="${req_id}" readonly></td>
			</thead>
			<tbody>
				<tr>
					<th scope="row">이름</th>
					<td><input type="text" id="input-out" name="req_name" readonly></td>
				</tr>
				<tr>
					<th scope="row">생년월일</th>
					<td><input type="text" id="input-out" name="req_birth" readonly></td>
				</tr>
				<tr>
					<th scope="row">개인연락처</th>
					<td><input type="text" id="input-out" name="req_phone" readonly></td>
				</tr>
				<tr>
					<th scope="row">사내연락처</th>
					<td><input type="text" id="input-in" name="emp_tel"></td>
				</tr>
				<tr>
					<th scope="row">주소</th>
					<td><input type="text" id="input-out" name="req_address" readonly></td>
				</tr>
				<tr>
					<th scope="row">직급</th>
					<td><input type="text" id="input-in" name="emp_position"></td>
				</tr>
				<tr>
					<th scope="row">연봉</th>
					<td><input type="text" id="input-in" name="emp_sal"></td>
				</tr>
				<tr>
					<th scope="row">부서</th>
					<td><input type="text" id="input-in" name="dept_name"></td>
				</tr>			
			</tbody>
		</table>
		<p>
		<div class="row justify-content-center">
			<button type="button" class="btn btn-lg dt-button insertBtn">가입 승인</button>
			<button type="button" class="btn btn-lg dt-button deleteBtn">가입 거절</button>
		</div>
	</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/admin-page-approve-detail.js"></script>
</body>
</html>