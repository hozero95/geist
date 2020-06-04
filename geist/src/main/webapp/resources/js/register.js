/**
 * 회원가입 페이지

 */
console.log('test767');
	var registerService = (function() {
		function checkId(param, callback, error) {
			var req_id = param.req_id;
			$.getJSON("/register/" + req_id + ".json", function(data) {
				if (callback) {
					callback(data); // 회원가입을 요청했을때 결과를 리턴받음
				}
			}).fail(function(xhr, status, err) {
				if(error) {
					error();
				}
			});
		}
	
		function joinRequest(param, callback, error) {
			$.ajax({
				type : 'post',
				url : '/register/regist',
				data : JSON.stringify(param),
				contentType : "application/json; charset=utf-8",
				success : function(result, status, xhr) {
					if (callback) {
						callback(result);
					}
				},
				error : function(xhr, status, err) {
					if (error) {
						error();
					}
				}
			});
		}
		return {
			checkId : checkId,
			joinRequest : joinRequest
		}
	})();
	
	$(function() {
		var registerBtn = $("#btn-join");
		var inputId = $("#id");
		var inputPwd1 = $("#pwd1");
		var inputPwd2 = $("#pwd2");
		var inputName = $("#name");
		var inputEmail = $("#email");
		var inputYear = $("#year");
		var inputMm = $("#mm");
		var inputDd = $("#dd");
		var inputPhone = $("#phone");
		var inputAddr1 = $("#addr1");
		var inputAddr2 = $("#addr2");
		var inputAddr3 = $("#addr-etc");
		
		$("#id-error").hide();
		$("#pwd-error1").hide();
		$("#pwd-error2").hide();
		$("#name-error").hide();
		$("#email-error").hide();
		$("#birth-error").hide();
		$("#phone-error").hide();
		$("#addr-error").hide();
		
		// 중복아이디 체크 및 미입력시 에러메세지 출력
		inputId.blur(function() {
			if(inputId.val().length < 4) {
				$("#id-error").text("아이디는 4글자 이상 입력하세요.").show();
				return false;
			} else {
				$("#id-error").hide();
			}
	
			var req_id = $("input[name='id']").val();
			registerService.checkId({
				req_id : req_id
			}, function(data) {
				if (data) { // 사용가능한 아이디 일때
					$("#id-error").text('사용가능한 아이디 입니다.').addClass("msgOk").show();
				} else { // 사용중인 아이디 일때
					$("#id-error").text('이미 사용 중인 아이디 입니다.').removeClass("msgOk").show();
				}
			});
		});
		
		inputPwd1.blur(function() {
			if(!inputPwd1.val()) {
				$("#pwd-error1").show();
			} else {
				$("#pwd-error1").hide();
			}
		});
		
		inputPwd2.blur(function() {
			if(inputPwd1.val() !== inputPwd2.val()) {
				$("#pwd-error2").show();
			} else {
				$("#pwd-error2").hide();
			}
		});
		
		inputName.blur(function() {
			if(!inputName.val()) {
				$("#name-error").show();
			} else {
				$("#name-error").hide();
			}
		});
		
		inputEmail.blur(function() {
			if(!inputEmail.val().match("@") || !inputEmail.val().match(".com") && !inputEmail.val().match(".net")) {
				$("#email-error").show();
			} else {
				$("#email-error").hide();
			}
		});
		
		inputYear.blur(function() {
			if(!inputYear.val()) {
				$("#birth-error").show();
			} else {
				$("#birth-error").hide();
			}
		});
		
		inputMm.blur(function() {
			if(inputMm.val() == "월") {
				$("#birth-error").show();
			} else {
				$("#birth-error").hide();
			}
		});
		
		inputDd.blur(function() {
			if(!inputDd.val()) {
				$("#birth-error").show();
			} else {
				$("#birth-error").hide();
			}
		});
		
		inputPhone.blur(function() {
			if(inputPhone.val().length < 11) {
				$("#phone-error").show();
			} else {
				$("#phone-error").hide();
			}
		});
		
		inputAddr1.blur(function() {
			if(!inputAddr1.val()) {
				$("#addr-error").show();
			} else {
				$("#addr-error").hide();
			}
		});
		
		inputAddr3.blur(function() {
			if(!inputAddr3.val()) {
				$("#addr-error").show();
			} else {
				$("#addr-error").hide();
			}
		});
		
		
		// 가입요청 버튼 클릭 시 입력값 전달
		registerBtn.click(function() {
			var req_id = inputId.val();
			var req_pw = inputPwd2.val();
			var req_name = inputName.val();
			var req_email = inputEmail.val();
			var req_year = inputYear.val();
			var req_month = inputMm.val();
			var req_day = inputDd.val();
	
			if (inputDd.val().length == 1) {
				var day = '0';
				req_day = day.concat(inputDd.val());
			}
	
			var req_birth = req_year.concat("-", req_month, "-", req_day);
			var req_phone = inputPhone.val();
			var req_address = inputAddr1.val();
			req_address += inputAddr2.val();
			req_address += inputAddr3.val();

			if(!req_id || !req_pw || !req_name || !req_email || !req_year || !req_month || !req_day || !req_phone || !$("input[name='addr-etc']").val()) {
				alert('정보를 모두 입력하여 주세요!');
				return false;
			} else {
				if(inputPwd1.val() !== inputPwd2.val()) {
					$("#pwd-error2").show();
					return false;
				} else {
					$("#pwd-error2").hide();
				}
				
				// 가입성공 요청
				registerService.joinRequest({
					req_id : req_id,
					req_pw : req_pw,
					req_name : req_name,
					req_birth : req_birth,
					req_phone : req_phone,
					req_email : req_email,
					req_address : req_address
				}, function(result) {
					alert(result);
					location.href = "/login";
				});
			}
		});
	});
	
	
	// 우편번호 검색 API
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ""; // 주소 변수
				var extraAddr = ""; // 참고항목 변수
	
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === "R") {
					// 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else {
					// 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
	
				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === "R") {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== "" && data.apartment === "Y") {
						extraAddr += extraAddr !== "" ? ", " + data.buildingName
								: data.buildingName;
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== "") {
						extraAddr = " (" + extraAddr + ")";
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("addr2").value = extraAddr;
				} else {
					document.getElementById("addr2").value = "";
				}
	
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("postcode").value = data.zonecode;
				document.getElementById("addr1").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("addr-etc").focus();
			},
		}).open();
	}
	
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
