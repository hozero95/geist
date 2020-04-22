<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--
	출결 페이지
	담당 : 김호영
-->

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>출결 페이지</title>
</head>
<body>
	<button type="button" class="att_on">출근</button>
	<button type="button" class="att_off">퇴근</button><br>
	
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
		
		function check(param, callback, error){
			var emp_no = param.emp_no;
			$.getJSON("/attendance/" + emp_no + "/check.json", function(data){
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
		
		function attendanceOff(param, callback, error){
			$.ajax({
				type : 'put',
				url : '/attendance/off',
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
			check : check,
			attendanceOn : attendanceOn,
			attendanceOff : attendanceOff
		};
	})();
	
	$(document).ready(function(){
		var emp_no = 2; // 나중에 현재 로그인 중인 사용자로 변경해야함
		var tbody = $(".table-body");
		var att_on = $(".att_on");
		var att_off = $(".att_off");
		
		showCheck(emp_no);
		showList(emp_no);
		
		function showCheck(emp_no){
			attendanceService.check({
				emp_no : emp_no
			}, function(data){
				if(data.checkOn == 1){
					att_on.prop("disabled", true);
				}else{
					att_on.prop("disabled", false);
				}
				if(data.checkOff == 1){
					att_off.prop("disabled", false);
				}else{
					att_off.prop("disabled", true);
				}
			});
		}
		
		function showList(emp_no){
			attendanceService.getList({
				emp_no : emp_no
			}, function(data){
				var str = "";
				if(data == null || data.length == 0){
					return;
				}
				for(var i = 0, len = data.length || 0; i < len; i++){
					var status = "";
					switch(data[i].att_status){
					case 1:
						status = "출근";
						break;
					case 2:
						status = "퇴근";
						break;
					default:
						status = "알 수 없음";
					}
					str += "<tr>";
					str += "<td>" + data[i].cal_date + "</td>";
					str += "<td>" + data[i].att_on + "</td>";
					str += "<td>" + data[i].att_off + "</td>";
					str += "<td>" + status + "</td>";
					str += "</tr>";
				}
				tbody.html(str);
			});
		}
		
		att_on.on("click", function(e){
			attendanceService.attendanceOn({
				emp_no : emp_no
			}, function(result){
				alert(result);
				showCheck(emp_no);
				showList(emp_no);
			});
		});
		
		att_off.on("click", function(e){
			attendanceService.attendanceOff({
				emp_no : emp_no
			}, function(result){
				alert(result);
				showCheck(emp_no);
				showList(emp_no);
			});
		});
	});
</script>
</body>
</html>