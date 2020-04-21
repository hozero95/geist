<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<button type="button" class="att_on">출근</button>
	<button type="button" class="att_off">퇴근</button>
	<br>
	<table border="1">
		<thead>
			<tr>
				<th>날짜</th>
				<th>출근 시간</th>
				<th>퇴근 시간</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody class="table-body">
		
		</tbody>
	</table>

<script type="text/javascript">
	var attendanceService = (function(){
		function getList(param, callback, error){
			var emp_no = param.emp_no;
			$.getJSON("/attendance/" + emp_no + ".json", function(data){
				if(callback){
					callback(data);
				}
			}).fail(function(xhr, status, err){
				if(error){
					error();
				}
			});
		}
		
		function attendanceOn(param, callback, error){
			$.ajax({
				type : 'post',
				url : '/attendance/on',
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
		
		return {
			getList : getList,
			attendanceOn : attendanceOn
		};
	})();
	
	$(document).ready(function(){
		var emp_no = 2; // 나중에 현재 로그인 중인 사용자로 변경해야함
		var tbody = $(".table-body");
		var att_on = $(".att_on");
		var att_off = $(".att_off");
		
		showList(emp_no);
		
		function showList(emp_no){
			attendanceService.getList({
				emp_no : emp_no
			}, function(data){
				var str = "";
				if(data == null || data.length == 0){
					return;
				}
				for(var i = 0, len = data.length || 0; i < len; i++){
					str += "<tr>"
					str += "<td>" + data[i].cal_date + "</td>";
					str += "<td>" + data[i].att_on + "</td>";
					str += "<td>" + data[i].att_off + "</td>";
					str += "<td>" + data[i].att_status + "</td>";
					str += "</tr>"
				}
				tbody.html(str);
			});
		}
		
		att_on.on("click", function(e){
			attendanceService.attendanceOn({
				emp_no : emp_no
			}, function(result){
				alert(result);
				showList(emp_no);
			});
		});
	});
</script>
</body>
</html>