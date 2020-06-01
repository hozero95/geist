/**
 * 
 */

console.log("approvalAdmitDetail.js");
console.log("3333123")

var approvalDetailService = (function(){
	//결재 상세 조회일 경우
	function searchDetail(param, callback, error){
		var app_no = param.app_no;
		var emp_no = param.emp_no;
		$.getJSON("/approvalSearch/detail/" + app_no + "/" + emp_no + ".json", function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	//결재 승인 상세 조회일 경우
	function detail(param, callback, error){
		var app_no = param.app_no;
		var emp_no = param.emp_no;
		$.getJSON("/approvalAgree/detail/" + app_no + "/" + emp_no + ".json", function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	function approvers(app_no, callback, error){
		$.getJSON("/approvalAgree/detailApprovers/" + app_no + ".json", function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr, status, err){
			if(err){
				status();
			}
		});
	}
	
	function admit(param, callback, error){
		$.ajax({
            type : 'post',
            url : '/approvalAgree/agree',
            data : JSON.stringify(param),
            contentType : "application/json; charset=utf-8",
            success : function(result, status, xhr) {
                if(callback) {
                    callback(result);
                }
            },
            error : function(xhr, status, err) {
                if(error) {
                    error(err);
                }
            }
        });
	}
	
	return {
		searchDetail : searchDetail,
		detail : detail,
		approvers : approvers,
		admit : admit
	}
})();

$(document).ready(function(){	
	var uri = document.location.href.split("?");
	var param = uri[1].split("&");
	var app_no;
	var emp_no;
	var search;
	
	console.log(uri);
	console.log(param);
	
	for(let i = 0; i < param.length; i++){
		var val = param[i].split("=");
		
		if(i == 0){
			app_no = Number(val[1]);			
		}else if(i == 1){
			emp_no = Number(val[1]);
		}else if(i == 2){
			search = val[1];
		}
	}
	
	console.log(app_no)
	console.log(emp_no)
	console.log(search)
	
	var deptName = $(".dept-name");
	var empPosition = $(".emp-position");
	var empName = $(".emp-name");
	var appDate = $(".app-date");
	var appSearchBtn = $("#appSearchBtn");
	
	// whoRu = search 일 경우, 결재 상세 조회 실행
	if(search === "search"){
		console.log("search === search")
		$(".pt-2 button").attr('disabled', true);
		$(".btn").css('color', 'white');
		appSearchBtn.css({
			display : "block",
			color : "white"				
		});
		appSearchBtn.attr('disabled', false);
		appSearchBtn.attr('onclick', "location.replace('/approvalSearch');");
		
		searchDetailView(app_no, emp_no);	
		
		function searchDetailView(app_no, emp_no){
			approvalDetailService.searchDetail({
				app_no : app_no,
				emp_no : emp_no
			},function(data){				
				console.log(data)
				deptName.text(data.dept_name);
				empPosition.text(data.emp_position);
				empName.text(data.emp_name);
				appDate.text(data.app_date);
			});
		}
		
		detailApprovers(app_no)
		
		function detailApprovers(app_no){
			approvalDetailService.approvers(app_no, function(data){				
				console.log(data);
				for(var i = 0; i < data.approvers.length; i++){
					var position = data.approvers[i].emp_position;
			
					if(position === "대리"){
						$('input:checkbox[id="assistant"]').prop("checked", true)
					}if(position === "과장"){
						$('input:checkbox[id="manager"]').prop("checked", true)
					}if(position === "차장"){
						$('input:checkbox[id="deputy"]').prop("checked", true)
					}if(position === "부장"){
						$('input:checkbox[id="general"]').prop("checked", true)
					}
				}
			});
		}
		
	}else{	// whoRu !== search 일 경우, 결재 상세 조회 실행
		console.log("search !== search")
		
		appSearchBtn.attr('onclick', "location.replace('/approvalAgree');");
		
		detailView(app_no, emp_no);	
		
		function detailView(app_no, emp_no){
			approvalDetailService.detail({
				app_no : app_no,
				emp_no : emp_no
			},function(data){				
				console.log(data)
				deptName.text(data.dept_name);
				empPosition.text(data.emp_position);
				empName.text(data.emp_name);
				appDate.text(data.app_date);
			});
		}
		
		detailApprovers(app_no)
		
		function detailApprovers(app_no){
			approvalDetailService.approvers(app_no, function(data){				
				console.log(data);
				for(var i = 0; i < data.approvers.length; i++){
					var position = data.approvers[i].emp_position;
			
					if(position === "대리"){
						$('input:checkbox[id="assistant"]').prop("checked", true)
					}if(position === "과장"){
						$('input:checkbox[id="manager"]').prop("checked", true)
					}if(position === "차장"){
						$('input:checkbox[id="deputy"]').prop("checked", true)
					}if(position === "부장"){
						$('input:checkbox[id="general"]').prop("checked", true)
					}
				}
			});
		}
		
		var admit = $("#approve");
		var reject = $("#return");
		
		admit.click(function(){
			approvalDetailService.admit({
				app_no : app_no,
				emp_no : emp_no,
				agr_status : 2			
			}, function(result){
				if(result == 'success') {
	                location.href = "/approvalAgree";
	            } else {
	                console.log("승인 실패....");
	            }
			})
		});
		
		reject.click(function(){
			approvalDetailService.admit({
				app_no : app_no,
				emp_no : emp_no,
				agr_status : 3			
			}, function(result){
				if(result == 'success') {
	                location.href = "/approvalAgree";
	            } else {
	                console.log("거부 실패....");
	            }
			})
		});
	}	// End: else
});


