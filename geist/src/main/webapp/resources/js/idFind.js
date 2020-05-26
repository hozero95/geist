/**
 * 아이디 찾기
 */
	var idSearchService = (function() {
		function idSearch(param, callback, error) {
			$.ajax({
				type : 'post',
				url : 'login/idSearch',
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
			idSearch : idSearch
		}
	})();
	
	$(document).ready(function() {
		var searchForm = $("#idfind");
		var idSearchBtn = $("#btn-find");
		
		idSearchBtn.on("click", function() {
			if(searchForm.find("input[name='emp_name']").val() === null) {
				alert("이름을 입력하세요.");
				return false;
			}
			if(searchForm.find("input[name='emp_phone']").val() === null) {
				alert("휴대폰 번호를 입력하세요.");
				return false;
			}
			if(searchForm.find("input[name='emp_email']").val() === null) {
				alert("이메일을 입력하세요.");
				return false;
			}
			
			var emp_name = $("input[name='emp_name']").val();
			var emp_phone = $("input[name='emp_phone']").val();
			var emp_email = $("input[name='emp_emanil']").val();
			
			idSearchService.idSearch({
				emp_name : emp_name,
				emp_phone : emp_phone,
				emp_email : emp_email				
			}, function(result) {
				if(result == 'fail') {
					alert("회원 정보가 없습니다.");
				} else {
					alret("회원님의 아이디는 " + result + "입니다.");
				}
			});
		});
		
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