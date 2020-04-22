<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--
	메인 페이지
	담당 : 김호영
-->

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
	<button type="button" class="attendanceBtn">출결 페이지</button><br>
	<button type="button" class="empManageBtn">사원 관리 페이지</button><br>

<script type="text/javascript">
	$(document).ready(function(){
		var attendance = $(".attendanceBtn");
		var empManage = $(".empManageBtn");
		
		attendance.on("click", function(){
			location.href = "attendance";
		});
		
		empManage.on("click", function(){
			location.href = "empManage";
		});
	});
</script>
</body>
</html>