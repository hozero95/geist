/**
 * 
 */

console.log("approvalRequest.js")

var approvalCreateService = (function(){	
	function appCreate(param, callback, error){
		$.ajax({
            type : 'post',
            url : '/approvalRequest/new',
            data : JSON.stringify(param),
            contentType : "application/json; charset=utf-8",
            success : function(result, status, xhr) {
                if(callback) {
                    callback(result);
                }
            },
            error : function(xhr, status, err) {
            	console.log("에러발생")
                if(error) {
                    error(err);
                }
            }
        });
	}
	
	return {
		appCreate : appCreate
	}
})();

$(document).ready(function(){					
	var writeBtn = $(".btn-write");
	var emp_no = Number($("input[name='login_no']").val());
	
	console.log(emp_no)
	
	writeBtn.click(function(){
		// app_class : 1(2, 3)
		var uri = document.location.href;
		var app_class = Number(uri.slice(-1));
		var app_title = "";
		console.log(typeof app_class)
		
		if(app_class === 1){
			app_title = "주간업무 보고서"
		}else if(app_class === 2){
			app_title = "휴가 신청서"
		}else{
			app_title = "사직 신청서"
		}
				
		// manager_no : [{...}, {...}] 
		var manager_no = [];
		var arr = [];
				
		$('input:checkbox[name="management"]').each(function() {
		      if(this.checked){	//checked 처리된 항목의 값
		            var val = this.value;
		            arr.push(val);
		      }
		 });
		
		for(let i = 0; i < arr.length; i++){
			var obj = {};
			obj.emp_position = arr[i];
			manager_no[i] = obj;
		}
		
		approvalCreateService.appCreate({
			app_class : app_class,
			app_title : app_title,
			emp_no : emp_no,
			manager_no : manager_no
		}, function(result){
			if(result == 'success') {
                location.href = "/approvalRequest";
            } else {
                console.log("문서 생성 실패....");
            }
		})
	});
});
