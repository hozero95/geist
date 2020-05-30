/**
 * 비밀번호 찾기 페이지
 */
	var pwSearchService = (function() {
		function pwSearch(param, callback, error) {
			$.ajax({
				type : 'post',
				url : 'login/pwSearch',
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
			pwSearch : pwSearch
		}
	})();
	
	$(document).ready(function() {
		var searchForm = $("#pwdfind");
		var pwSearchBtn = $("#btn-find");
		var loginHome = $(".btn-login");
		
		pwSearchBtn.on("click", function() {
			if(searchForm.find("input[name='userid']").val() === null) {
				alert("아이디를 입력하세요.");
				return false;
			}
			if(searchForm.find("input[name='name']").val() === null) {
				alert("이름을 입력하세요.");
				return false;
			}
			if(searchForm.find("input[name='phone']").val() === null) {
				alert("휴대폰 번호를 입력하세요.");
				return false;
			}
			if(searchForm.find("input[name='email']").val() === null) {
				alert("이메일을 입력하세요.");
				return false;
			}
			
			var emp_id = $("input[name='userid']").val();
			var emp_name = $("input[name='name']").val();
			var emp_phone = $("input[name='phone']").val();
			var emp_email = $("input[name='email']").val();
			
			pwSearchService.pwSearch({
				emp_id : emp_id,
				emp_name : emp_name,
				emp_phone : emp_phone,
				emp_email : emp_email
			}, function(result){
				if(result == 'fail'){
					alert("회원 정보가 없습니다.");
				}
				else{
					alert("회원님의 비밀번호는 " + result + " 입니다.");
				}
			});			
		});
		
		loginHome.on("click", function(){
        	location.href = "/login";
        })
	});
	
	
	// input#input-number : 한글 입력 불가능
	function noKorean(obj) {
		obj.value = obj.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
	}
	
	// input#input-number : 자동 "-" 삽입
	function inputPhoneNumber(obj) {
		var number = obj.value.replace(/[^0-9]/g, "");
		var phone = "";

		if (number.length < 4) {
			return number;
		} else if (number.length < 7) {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3);
		} else if (number.length < 11) {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3, 3);
			phone += "-";
			phone += number.substr(6);
		} else {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3, 4);
			phone += "-";
			phone += number.substr(7);
		}
		obj.value = phone;
	}