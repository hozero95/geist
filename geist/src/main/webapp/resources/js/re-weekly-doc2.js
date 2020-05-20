/* *
 * 결재 페이지
 * 담당 : 김현선
 */

console.log("re-weekly-doc.jsp");

var approvalAdmitDetailService = (function(){
	function detail(param, callback, error){
		var app_no = param.app_no;
		var emp_no = param.emp_no;
		$.getJSON("/approvalAdmit/detail/" + app_no + "/" + emp_no + ".json", function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	function admit(param, callback, error){
		$.ajax({
            type : 'post',
            url : '/approvalAdmit/admit',
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
		detail : detail,
		admit : admit
	}
})();

$(document).ready(function(){	
	var uri = document.location.href.split("?");
	var param = uri[1].split("&");
	var app_no;
	var emp_no;
	
//	console.log(uri)
//	console.log(param)
	
	for(let i = 0; i < param.length; i++){
		var val = param[i].split("=");
		
		if(i == 0){
			app_no = Number(val[1]);			
		}else if(i == 1){
			emp_no = Number(val[1]);
		}
	}
	
	console.log(app_no)
	console.log(typeof app_no)
	console.log(emp_no)
	
	var deptName = $(".dept-name");
	var empPostion = $(".emp-position");
	var empName = $(".emp-name");
	var appDate = $(".app-date");

	detailView(app_no, emp_no);	
	
	// 실행 안됨, sql에 오류있음
	function detailView(app_no, emp_no){
		approvalAdmitDetailService.detail({
			app_no : app_no,
			emp_no : emp_no
		},function(data){						
			deptName.innerHTML = data.dept_name;
			empPosition.innerHTML = data.emp_position;
			empName.innerHTML = data.emp_name;
			appDate.innerHTML = data.app_date;
		});
	}
	
	var admit = $("#approve");
	var reject = $("#return");
	
	admit.click(function(){
		approvalAdmitDetailService.admit({
			app_no : app_no,
			emp_no : emp_no,
			agr_status : 2			
		}, function(result){
			if(result == 'success') {
                location.href = "/approvalAdmit";
            } else {
                console.log("승인 실패....");
            }
		})
	});
	
	reject.click(function(){
		approvalAdmitDetailService.admit({
			app_no : app_no,
			emp_no : emp_no,
			agr_status : 3			
		}, function(result){
			if(result == 'success') {
                location.href = "/approvalAdmit";
            } else {
                console.log("거부 실패....");
            }
		})
	});
});
