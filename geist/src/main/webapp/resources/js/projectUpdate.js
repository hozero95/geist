/**
 * 프로젝트 수정페이지
 */
	// 부모창 함수 호출
   	var proj_no = opener.parent.setData();
    
    $(function() {
    	var btnUpdate = $("#proUpdate");
    	console.log(proj_no);
    	
    	// 수정데이터 받아오기
    	function getUpdateList(callback, error) {
    		$.getJSON("/project/projectUpdate/" + proj_no, function(data) {
    			if(callback) {
    				console.log(data);
    				callback(data);
    			}
    		}).error(function() {
    			console.log("getUpdateList 실패");
    		})
    	}
    	
    	// 수정데이터 전달하기
    	function projcetUpdate(param, callback, error) {
    		$.ajax({
    			type : 'put',
    			url : '/project/projectUpdate/' + proj_no,
    			data : JSON.stringify(param),
    			contentType : "application/json; charset=utf-8",
    			success : function() {
    				console.log("수정 성공!");
    				if(callback) {
    					callback();
    				}
    			},
    			error : function() {
    				console.log("수정 실패!");
    			}
    		});
    	}

    	// 수정데이터 출력
    	function showUpdateList() {
    		getUpdateList(function(data) {
    			if(data == null || data.length == 0){
					console.log('data 없음');
    				return;
				}
    			$("#dept_no").val(data.dept_no);
    			$("#proj_name").val(data.proj_name);
    			$("#proj_agency").val(data.proj_agency);
    			$("#proj_start").val(data.proj_start);
    			$("#proj_end").val(data.proj_end);
    		});
    	}
    	
    	showUpdateList();
    	
    	// 수정버튼 클릭시 발생
    	btnUpdate.click(function() {
	    	var dept_no = $("#dept_no").val();
	    	var proj_name = $("#proj_name").val();
	    	var proj_agency = $("#proj_agency").val();
	    	var proj_start = $("#proj_start").val();
	    	var proj_end = $("#proj_end").val();
			
	    	console.log("수정버튼 클릭시 호출!");
   	   		console.log(dept_no);
   	   		console.log(proj_name);
   	   		console.log(proj_agency);
   	   		console.log(proj_start);
   	   		console.log(proj_end);
	    	
   	   		projcetUpdate({
   	   			"dept_no" : dept_no,
				"proj_name" : proj_name,
				"proj_agency" : proj_agency,
				"proj_start" : proj_start,
				"proj_end" : proj_end 	
   	   		}, function() {
				window.close();
	    		window.opener.location.reload();
   	   		})
    	})
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