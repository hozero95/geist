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
	<link href="/resources/css/main.css" rel="stylesheet" />
	<link rel="stylesheet" href="/resources/css/pwdfind.css">
	<meta charset="UTF-8">
	<title>사원 상세 조회</title>
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
			    <th scope="row">사원번호</th>
			    <td><input type="text" id="input-out" name="emp_no" value="${emp_no}" readonly></div></td>
			</thead>
			<tbody>
				<tr>
					<th scope="row">아이디</th>
					<td><input type="text" id="input-out" name="emp_id" readonly></td>
				</tr>
				<tr>
					<th scope="row">이름</th>
					<td><input type="text" id="input-out" name="emp_name" readonly></td>
				</tr>
				<tr>
					<th scope="row">생년월일</th>
					<td><input type="text" id="input-out" name="emp_birth" readonly></td>
				</tr>
				<tr>
					<th scope="row">개인연락처</th>
					<td><input type="text" id="input-out" name="emp_phone" readonly></td>
				</tr>
				<tr>
					<th scope="row">사내연락처</th>
					<td><input type="text" id="input-out" name="emp_tel" readonly></td>
				</tr>
				<tr>
					<th scope="row">이메일</th>
					<td><input type="text" id="input-out" name="emp_email" readonly></td>
				</tr>
				<tr>
					<th scope="row">주소</th>
					<td><input type="text" id="input-out" name="emp_address" readonly></td>
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
					<th scope="row">입사일</th>
					<td><input type="text" id="input-out" name="emp_date" readonly></td>
				</tr>
				<tr>
					<th scope="row">부서</th>
					<td><input type="text" id="input-in" name="dept_name"></td>
				</tr>			
			</tbody>
		</table>
	</div>
	<div class="row justify-content-center">
		<button type="button" class="btn btn-lg dt-button" id="modifyBtn">수정</button>
		<button type="button" class="btn btn-lg dt-button" id="deleteBtn">삭제</button>
	</div>
	
	<!-- js -->
	<script type="text/javascript" src="/resources/js/empManageDetail.js"></script>
	
</body>
</html>