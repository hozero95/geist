

var MypageService = (function(){
		function detailView(param, callback, error){
			var emp_no = param.emp_no;
			$.getJSON("/mypage/" + emp_no + ".json", function(data){
				if(callback){
					callback(data);
				}
			}).fail(function(xhr, status, err){
				if(error){
					error();
				}
			});
		}
		
		return{
			detailView : detailView
		};
	})();
	
$(document).ready(function(){
	
	detailView($("input[name='login_no']").val());
	
	function detailView(emp_no){
		MypageService.detailView({
			emp_no : emp_no
		}, function(data){
			$("div[name='emp_name']").append("<h1 class='m-0'>"+data.emp_name+" "+data.emp_position+'</h1>');
			$("div[name='emp_name']").append("<h6 class='m-0 pt-3 pb-4' name='dept_no'>"+"Geist회사 >"+" "+data.dept_no+'</h1>');
			
			$("thead").append("<th scope='row'>"+"아이디"+"</th>");
			$("thead").append("<td>"+data.emp_id+"</td>");
			
			$("tbody").append("<tr><th scope='row'>"+"사원번호"+"</th>"+"<td>"+data.emp_no+"</td></tr>");
			$("tbody").append("<tr><th scope='row'>"+"직책"+"</th>"+"<td>"+data.emp_position+"</td></tr>");
			$("tbody").append("<tr><th scope='row'>"+"급여"+"</th>"+"<td>"+data.emp_sal+"</td></tr>");
			$("tbody").append("<tr><th scope='row'>"+"입사일"+"</th>"+"<td>"+data.emp_date+"</td></tr>");
			$("tbody").append("<tr><th scope='row'>"+"사내연락처"+"</th>"+"<td>"+data.emp_tel+"</td></tr>");
			$("tbody").append("<tr><th scope='row'>"+"개인연락처"+"</th>"+"<td>"+data.emp_phone+"</td></tr>");
			$("tbody").append("<tr><th scope='row'>"+"생년월일"+"</th>"+"<td>"+data.emp_birth+"</td></tr>");
			$("tbody").append("<tr><th scope='row'>"+"주소"+"</th>"+"<td>"+data.emp_address+"</td></tr>");
			
		});
		
		$("#My-btnUpdate").on("click", function(){
			location.href = "/myPage/detail";
		});
	}
});