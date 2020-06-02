/* *
 * 결재 페이지
 * 담당 : 김현선
 */

console.log("approvalAgree.js")

var approvalAdmitService = (function(){
	function getList(param, callback, error){
		var page = param.page;
		var emp_no = param.emp_no;
		
		$.getJSON("/approvalAgree/" + page + "/" + emp_no + ".json", function(data){
			if(callback){
				callback(data.count, data.list);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
		
	function getAllList(param, callback, error){
		var page = param.page;
		
		$.getJSON("/approvalAgree/allList/" + page + ".json", function(data){
			if(callback){
				console.log(data.list)
				callback(data.count, data.list);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	return{
		getList : getList,
		getAllList : getAllList
	};
})();

$(document).ready(function() {
	var admin_sys = ($("input[name='admin_sys']").val());
	var emp_no = ($("input[name='login_no']").val());
	var tbody = $(".table-body");
	var tpage = $(".table-page");
	var pageNum = 1;
	
	if(typeof emp_no === 'string'){
		emp_no = parseInt(emp_no);
	}

	function showAllList(page){
		approvalAdmitService.getAllList({
			page : page || 1
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
				switch(list[i].agr_status){
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
				
				var finalStatus = "";
				switch(list[i].app_status){
				case 1:
					finalStatus = "처리중";
					break;
				case 2:
					finalStatus = "승인";
					break;
				case 3:
					finalStatus = "반려";
					break;
				default:
					finalStatus = "알 수 없음";
				}
				
				str += "<tr>";
				str += "<td>" + list[i].app_date + "</td>";
				str += "<td><a href='#'>" + list[i].app_title 
					+ "<input type='hidden' name='app_no' value='" + list[i].app_no + "'>" 
					+ "<input type='hidden' name='app_class' value='" + list[i].app_class + "'></a></td>";
				str += "<td>" + list[i].emp_name + "</td>";
				str += "<td>" + status + "</td>";
				str += "<td style='background-color:#F5F9FC'>" + finalStatus + "</td>";
				str += "</tr>";
			}
			tbody.html(str);
			showListPage(count);
		});
	}
	
	function showList(page, emp_no){
		approvalAdmitService.getList({
			page : page || 1,
			emp_no : emp_no
		}, function(count, list){			
			console.log(list)
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
				switch(list[i].agr_status){
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
				
				var finalStatus = "";
				switch(list[i].app_status){
				case 1:
					finalStatus = "처리중";
					break;
				case 2:
					finalStatus = "승인";
					break;
				case 3:
					finalStatus = "반려";
					break;
				default:
					finalStatus = "알 수 없음";
				}
				
				str += "<tr>";
				str += "<td>" + list[i].app_date + "</td>";
				str += "<td><a href='#'>" + list[i].app_title 
					+ "<input type='hidden' name='app_no' value='" + list[i].app_no + "'>" 
					+ "<input type='hidden' name='app_class' value='" + list[i].app_class + "'></a></td>";
				str += "<td>" + list[i].emp_name + "</td>";
				str += "<td>" + status + "</td>";
				str += "<td style='background-color:#F5F9FC'>" + finalStatus + "</td>";
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
		
		console.log(count)

		if (endNum * 10 >= count) {
			endNum = Math.ceil(count / 10.0);
		}
		if (endNum * 10 < count) {
			next = true;
		}

		var str = "<ul class='pagination justify-content-end'>";
	    if(prev){
	        str += "<li class='page-item'><a href='" + (startNum - 1) + "'class='page-link'>Prev</a></li>";
	    }
	    for(var i = startNum; i <= endNum; i++){
	        var linkStart = pageNum != i ? "'><a href='" + i + "'>" : "active'><a href='" + i + "'>";
	        var linkEnd = pageNum != i ? "</a>" : "</a>" ;
	        str += "<li class='page-item " + linkStart + i + linkEnd + "</a></li>";
	    }
	    if(next){
	        str += "<li class='page-item'><a href='" + (endNum + 1) + "'>Next</a></li>";
	    }
	    str += "</ul>";
	    
	    tpage.html(str);
	}
	
	if(admin_sys === "sys"){
		console.log("login_sys === " + admin_sys);
		showAllList(1)
	}else{
		console.log("로그인 정보 안 넘어옴")
		showList(1, emp_no);
	}	
	
	tpage.on("click", "li a", function(e) {
		e.preventDefault();

		var targetPageNum = $(this).attr("href");
		pageNum = targetPageNum;

		if(admin_sys === "sys"){
			console.log("login_sys === " + admin_sys);
			showAllList(pageNum)
		}else{
			console.log("로그인 정보 안 넘어옴")
			showList(pageNum, emp_no);
		}		
	});
	
	tbody.on("click", "tr td a", function(e){
		e.preventDefault();	
		
		var app_no = $(this).children().eq(0).val();
		var app_class = $(this).children().eq(1).val();
		
		if(app_class === "1"){			
			location.href = "/approval/detail/1?app_no=" + app_no + "&emp_no=" + emp_no;
		}else if(app_class === "2"){
			location.href = "/approval/detail/2?app_no=" + app_no + "&emp_no=" + emp_no;
		}else if(app_class === "3"){
			location.href = "/approval/detail/3?app_no=" + app_no + "&emp_no=" + emp_no;
		}
	});
});