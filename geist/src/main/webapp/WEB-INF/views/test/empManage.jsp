<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--
	사원 관리 페이지
	담당 : 김호영
-->

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>사원 관리 페이지</title>
</head>
<body>
	<button type="button" class="request">가입 승인 페이지</button><br>
	
	<form id="searchForm" action="/empManage" method="get">
		<select name="type">
			<option value="">--</option>
			<option value="N">이름</option>
			<option value="P">직급</option>
			<option value="D">부서</option>
		</select>
		<input type="text" name="keyword" value="">
		<button class="search">Search</button>
	</form><br>
	
	<table border="1">
		<thead>
			<tr>
				<th>사원 번호</th>
				<th>이름</th>
				<th>직급</th>
				<th>입사일</th>
				<th>부서</th>
			</tr>
		</thead>
		<tbody class="table-body">
		
		</tbody>
	</table>
	
	<div class="table-page">
	
	</div>

<script type="text/javascript">
	var empManageService = (function(){
		function getList(param, callback, error){
			var page = param.page;
			$.getJSON("/empManage/" + page + ".json", function(data){
				if(callback){
					callback(data.count, data.list);
				}
			}).fail(function(xhr, status, err){
				if(error){
					error();
				}
			});
		}
		
		function searchList(param, callback, error){
			var page = param.page;
			var type = param.type;
			var keyword = param.keyword;
			$.getJSON("/empManage/" + page + "/" + type + "/" + keyword + ".json", function(data){
				if(callback){
					callback(data.count, data.list, data.type, data.keyword);
				}
			}).fail(function(xhr, status, err){
				if(error){
					error();
				}
			});
		}
		
		return{
			getList : getList,
			searchList : searchList
		};
	})();
	
	$(document).ready(function(){
		var request = $(".request");
		var searchForm = $("#searchForm");
		var search = $(".search");
		var tbody = $(".table-body");
		var tpage = $(".table-page");
		var pageNum = 1;
		
		showList(1);
		
		function showList(page){
			empManageService.getList({
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
					str += "<td>" + list[i].emp_no + "</td>";
					str += "<td>" + list[i].emp_name + "</td>";
					str += "<td>" + list[i].emp_position + "</td>";
					str += "<td>" + list[i].emp_date + "</td>";
					str += "<td>" + list[i].dept_name + "</td>";
					str += "</tr>";
				}
				tbody.html(str);
				showListPage(count);
			});
		}
		
		function showSearchList(page, type, keyword){
			console.log(type + " " + keyword);
			empManageService.searchList({
				page : page || 1,
				type : type,
				keyword : keyword
			}, function(count, list, type, keyword){
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
					str += "<td>" + list[i].emp_no + "</td>";
					str += "<td>" + list[i].emp_name + "</td>";
					str += "<td>" + list[i].emp_position + "</td>";
					str += "<td>" + list[i].emp_date + "</td>";
					str += "<td>" + list[i].dept_name + "</td>";
					str += "</tr>";
				}
				
				$("select[name='type']").find("option[value='" + type + "']").attr("selected", true);
				$("input[name='keyword']").val(keyword);
				tbody.html(str);
				showListPage(count);
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
				str += "<li><a href='" + (startNum - 1) + "'>Prev</a></li>"
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
		
		search.on("click", function(e){
			if(!searchForm.find("option:selected").val()){
				alert("검색 종류를 선택하세요.");
				return false;
			}
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요.");
				return false;
			}
			
			var type = $("select[name='type'] option:selected").val();
			var keyword = $("input[name='keyword']").val();
			
			e.preventDefault();
			showSearchList(1, type, keyword);
		});
	});
</script>
</body>
</html>