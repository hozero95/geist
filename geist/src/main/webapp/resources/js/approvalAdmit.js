/* *
 * 결재 조회 페이지
 * 담당 : 김현선
 */
console.log("approvalAdmit.js 임포트 됬따~~~~!!");

var approvalAdmitService = (function(){
	function getList(param, callback, error){
		var page = param.page;
		var emp_no = param.emp_no;
		console.log("approvalSearchService.getList() page === " + page);
		console.log("approvalSearchService.getList() emp_no === " + emp_no);
		
		$.getJSON("/approvalAdmit/" + page + "/" + emp_no + ".json", function(data){
			if(callback){
				console.log("data.count === " + data.count)
				console.log("data.page === " + data.page)
				callback(data.count, data.list);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	function getDetail(param, callback, error){
		var app_no = param.app_no;
		var emp_no = param.emp_no;
		console.log("approvalSearchService.getList() app_no === " + app_no);
		console.log("approvalSearchService.getList() emp_no === " + emp_no);
		
		$.getJSON("/approvalAdmit/detail/" +app_no + "/" +  emp_no + ".json", function(data){
			if(callback){
				console.log("data.list === " + data.list)
				callback(data);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	return{
		getList : getList,
		getDetail : getDetail
	};
})();

$(document).ready(function() {
	var testBody = $(".test-body");
	var emp_no = ($("input[name='login_no']").val());
	var tbody = $(".table-body");
	var tpage = $(".table-page");
	var pageNum = 1;
	console.log(emp_no);
	console.log(typeof emp_no);
	
	if(typeof emp_no === 'string'){
		emp_no = parseInt(emp_no);
		
//		return emp_no
	}
	console.log(typeof emp_no);
	showList(1, emp_no);
	
	console.log("showList() 실행전 === " + emp_no);
	function showList(page, emp_no){
		console.log("showList() 실행후 === " + emp_no);
		approvalAdmitService.getList({
			page : page || 1,
			emp_no : emp_no
		}, function(count, list){
			if (page == -1) {
				pageNum = Math.ceil(count / 10.0);
				showList(pageNum);
				return;
			}
			var str = "";
			if(list == null || list.length == 0){
				return;
			}
			for(var i = 0, len = list.length || 0; i < len; i++){
				var status = "";
				switch(list[i].app_status){
				case 1:
					status = "처리중";
					break;
				case 2:
					status = "승인";
					break;
				case 3:
					status = "반려";
					break;
				default:
					status = "알 수 없음";
				}
				str += "<tr>";
				str += "<input type='hidden' name='app_no' value='" + list[i].app_no + "'>";
				console.log(list[i]);
//				console.log(list[i].app_no);
				str += "<td>" + list[i].app_date + "</td>";
				str += "<td><a href='#'>" + list[i].app_title + "</a></td>";
				str += "<td>" + list[i].emp_name + "</td>";
				str += "<td>" + status + "</td>";
				str += "</tr>";
			}
			tbody.html(str);
			showListPage(count);
		});
	}
	
	function showDetail(app_no, emp_no){		
		approvalAdmitService.getDetail({
			app_no : app_no,
			emp_no : emp_no
		}, function(data){
			var str = "";
			if(data == null || data.length == 0){
				return;
			}
			for(var i = 0, len = data.length || 0; i < len; i++){
				str += "<h1>결재 문서 상세조회</h1>";
				str += "<h3>결재 문서 번호 : " + data.app_no + "</h3>";
//				console.log(data.app_no)
				
//				$("input[name='emp_no']").val(data.emp_no);
//				$("input[name='emp_id']").val(data.emp_id);
//				$("input[name='emp_name']").val(data.emp_name);
//				$("input[name='emp_birth']").val(data.emp_birth);
//				$("input[name='emp_phone']").val(data.emp_phone);
//				$("input[name='emp_tel']").val(data.emp_tel);
//				$("input[name='emp_email']").val(data.emp_email);
//				$("input[name='emp_address']").val(data.emp_address);
//				$("input[name='emp_position']").val(data.emp_position);
//				$("input[name='emp_sal']").val(data.emp_sal);
//				$("input[name='emp_date']").val(data.emp_date);
//				$("input[name='dept_name']").val(data.dept_name);
			}
			testBody.html(str);
		})
	}
	
	function showListPage(count) {
		var endNum = Math.ceil(pageNum / 10.0) * 10;
		var startNum = endNum - 9;
		var prev = startNum != 1;
		var next = false;

		if (endNum * 10 >= count) {
			endNum = Math.ceil(count / 10.0);
		}
		if (endNum * 10 < count) {
			next = true;
		}

		var str = "<ul>";
		if (prev) {
			str += "<li><a href='" + (startNum - 1)+ "'>Prev</a></li>";
		}
		for (var i = startNum; i <= endNum; i++) {
			var linkStart = pageNum != i ? "<a href='" + i+ "'>" : "";
			var linkEnd = pageNum != i ? "</a>" : "";
			str += "<li>" + linkStart + i + linkEnd + "</li>";
		}
		if (next) {
			str += "<li><a href='" + (endNum + 1)+ "'>Next</a></li>";
		}
		str += "</ul>";

		tpage.html(str);
	}
	
	
	tpage.on("click", "li a", function(e) {
		e.preventDefault();

		var targetPageNum = $(this).attr("href");
		pageNum = targetPageNum;

		showList(pageNum, emp_no);
	});
	
	tbody.on("click", "tr td a", function(e){
		console.log("a 클릭됨!!!!!");
		e.preventDefault();
		
		var app_no = $("input[name='app_no']").val();
		console.log(app_no);
				
		showDetail(app_no, emp_no);
	});
	
});