/**
 * 
 */

console.log("approvalSearch.js")

var approvalSearchService = (function(){
	function getList(param, callback, error){
		var page = param.page;
		var emp_no = param.emp_no;
		console.log("approvalSearchService.getList() page === " + page);
		console.log("approvalSearchService.getList() emp_no === " + emp_no);
		
		$.getJSON("/approvalSearch/" + page + "/" + emp_no + ".json", function(data){
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
	
	return{
		getList : getList
	};
})();

$(document).ready(function() {
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
		approvalSearchService.getList({
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
				str += "<td>" + list[i].app_date + "</td>";
				str += "<td>" + list[i].app_title + "</td>";
				str += "<td>" + list[i].emp_name + "</td>";
				str += "<td>" + status + "</td>";
				str += "</tr>";
			}
			tbody.html(str);
			showListPage(count);
		});
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
});