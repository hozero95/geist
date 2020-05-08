<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--
	가입 승인 페이지
	담당 : 김호영
-->

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>가입 승인 페이지</title>
</head>
<body>
	<h1>사원번호 : ${member.emp_no}</h1>
	<input type="hidden" name="login_no" value="${member.emp_no}">
	<button type="button" class="logoutBtn">로그아웃</button>
	<hr>
	
	<table border="1">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>연락처</th>
				<th>이메일</th>
				<th>주소</th>
				<th>조회</th>
			</tr>
		</thead>
		<tbody class="table-body">
		
		</tbody>
	</table>
	
	<div class="table-page">
	
	</div>

	<button type="button" class="empManageBtn">사원 관리 페이지</button>
	<button type="button" class="mainBtn">메인으로 돌아가기</button>
	
<script type="text/javascript">
	var joinRequestService = (function(){
		function getList(param, callback, error){
			var page = param.page;
			$.getJSON("/joinRequest/" + page + ".json", function(data){
				if(callback){
					callback(data.count, data.list);
				}
			}).fail(function(xhr, status, err){
				if(error){
					error();
				}
			});
		}
		
		return{
			getList : getList
		};
	})();

	$(document).ready(function(){
		var tbody = $(".table-body");
		var tpage = $(".table-page");
		var empManage = $(".empManageBtn");
		var main = $(".mainBtn");
		var pageNum = 1;
		
		showList(1);
		
		function showList(page){
			joinRequestService.getList({
				page : page || 1
			}, function(count, list){
				if(page == -1){
					pageNum = Math.ceil(count / 10.0);
					showList(pageNum);
					return;
				}
				var str = "";
				if(list == null || list.length == 0){
					return;
				}
				for(var i = 0, len = list.length || 0; i < len; i++){
					str += "<tr>";
					str += "<td>" + list[i].req_id + "</td>";
					str += "<td>" + list[i].req_name + "</td>";
					str += "<td>" + list[i].req_birth + "</td>";
					str += "<td>" + list[i].req_phone + "</td>";
					str += "<td>" + list[i].req_email + "</td>";
					str += "<td>" + list[i].req_address + "</td>";
					str += "<td><button type='button' class='detailBtn'>조회</button></td>";
					str += "</tr>";
				}
				
				tbody.html(str);
				showListPage(count);
				
				$(".detailBtn").on("click", function(){
					var tr = $(this).parent().parent();
					var td = tr.children();
					var req_id = td.eq(0).text();
					
					var popWindow = window.open("/joinRequest/detailView?req_id=" + req_id, "가입 승인 상세 보기", "width=500, height=600");
					
					location.reload();
				});
			});
		}
		
		function showListPage(count){
			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum - 9;
			var prev = startNum != 1;
			var next = false;
			
			if(endNum * 10 >= count){
				endNum = Math.ceil(count / 10.0);
			}
			if(endNum * 10 < count){
				next = true;
			}
			
			var str = "<ul>";
			if(prev){
				str += "<li><a href='" + (startNum - 1) + "'>Prev</a></li>";
			}
			for(var i = startNum; i <= endNum; i++){
				var linkStart = pageNum != i ? "<a href='" + i + "'>" : "";
				var linkEnd = pageNum != i ? "</a>" : "";
				str += "<li>" + linkStart + i + linkEnd + "</li>";
			}
			if(next){
				str += "<li><a href='" + (endNum + 1) + "'>Next</a></li>";
			}
			str += "</ul>";
			
			tpage.html(str);
		}
		
		tpage.on("click", "li a", function(e){
			e.preventDefault();
			
			var targetPageNum = $(this).attr("href");
			pageNum = targetPageNum;
			
			showList(pageNum);
		});
		
		empManage.on("click", function(){
			location.href = "/empManage";
		});
		
		main.on("click", function(){
			location.href = "/main";
		});
	});
</script>
</body>
</html>