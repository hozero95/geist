/**
 * 프로젝트 작성페이지
 */
$(function() {

    	var proWrite = $("#proWrite");
   		
    	// 작성한 데이터 보내기
	   	function projectWrite(param, callback, error) {
			$.ajax({
				type : 'post',
				url : '/project/projectWrite',
				data : JSON.stringify(param),
				contentType : "application/json; charset=utf-8",
				success : function() {
					console.log("작성 성공!");
					if(callback) {
						callback();
					}
				},
				error : function(xhr, status, err) {
					console.log("작성 실패!");
					if(error) {
						error(err);
					}
				}
			});
		}

   		// 작성버튼 클릭시 처리
   		proWrite.click(function() {
   	  		var dept_no = $("#dept_no").val();
   	   		var proj_name = $("#proj_name").val();
   	   		var proj_agency = $("#proj_agency").val();
   	   		var proj_start = $("#proj_start").val();
   	   		var proj_end = $("#proj_end").val();
   			
   	   		console.log("작성버튼 클릭시 호출!");
   	   		console.log(dept_no);
   	   		console.log(proj_name);
   	   		console.log(proj_agency);
   	   		console.log(proj_start);
   	   		console.log(proj_end);
   			
   	   		projectWrite({
   				"dept_no" : dept_no,
   				"proj_name" : proj_name,
   				"proj_agency" : proj_agency,
   				"proj_start" : proj_start,
   				"proj_end" : proj_end 				
   			}, function(e) {
   				console.log("콜백함수 호출됨 !");
   				window.close();
   	    		window.opener.location.reload();
   			})
   		});
    });
 	
    
    // 자동 "-" 삽입
	function inputDateNumber(obj) {
		var number = obj.value.replace(/[^0-9]/g, "");
		var date = "";

		if (number.length < 4) {
			return number;
		} else if (number.length < 6) {
			date += number.substr(0, 4);
			date += "-";
			date += number.substr(4);
		} else if (number.length < 8) {
			date += number.substr(0, 4);
			date += "-";
			date += number.substr(4, 2);
			date += "-";
			date += number.substr(6);
		} else {
			date += number.substr(0, 4);
			date += "-";
			date += number.substr(4, 2);
			date += "-";
			date += number.substr(6);
		}
		obj.value = date;
	}

	// 한글 입력 불가능
	function noKorean(obj) {
		obj.value = obj.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
	}