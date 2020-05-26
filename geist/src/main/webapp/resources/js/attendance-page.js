/**
 * 근태 관리 페이지
 * 담당 : 김현선(김호영)
 */

console.log("근태 페이지ㅋㅋ")
var attendanceService = (function() {
    		function getList(param, callback, error) {
	    		var emp_no = param.emp_no;
		        $.getJSON("/attendance/" + emp_no + ".json", function(data) {
		        	if(callback) {
		        		callback(data);
		        	}
		        }).fail(function(xhr, status, err) {
		        	if(error) {
		        		error();
		        	}
		        });
	    	}
    		
    		function check(param, callback, error){
    			var emp_no = param.emp_no;
    			$.getJSON("/attendance/check/" + emp_no + ".json", function(data){
    				if(callback){
    					callback(data);
    				}
    			}).fail(function(xhr, status, err){
    				if(error){
    					error();
    				}
    			});
    		}
    		
    		function attendanceOn(param, callback, error) {
    			$.ajax({
    				type : 'post',
    				url : '/attendance/on',
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
    		
    		function attendanceOff(param, callback, error) {
    			$.ajax({
    				type : 'put',
    				url : '/attendance/off',
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
    			getList : getList,
    			check : check,
    			attendanceOn : attendanceOn,
    			attendanceOff : attendanceOff
    		};
    		
    	})();
    	
    	$(function() {
    		var emp_no = $("input[name='login_no']").val();
		    var att_on = $("#attend");
		    var att_off = $("#getoff");
		    var tbody = $(".table-body");
		    
		    console.log(emp_no);
		    
		    showCheck(emp_no);
		    showList(emp_no);
		    
		    function showCheck(emp_no) {
		    	attendanceService.check({
		    		emp_no : emp_no
		    	}, function(data) {
		    		if(data.checkOn == 1) {
		    			att_on.prop("disabled", true);
		    		} else {
		    			att_on.prop("disabled", false);
		    		}
		    		
		    		if(data.checkOff == 1) {
		    			att_off.prop("disabled", false);
		    		} else {
		    			att_off.prop("disabled", true);
		    		}
		    	});
		    }
		    
		    function showList(emp_no) {
		    	attendanceService.getList({
		    		emp_no : emp_no
		    	}, function(data) {
		    		var str = "";
		    		if(data == null || data.length == 0) {
		    			return;
		    		}
		    		for(var i = 0, len = data.length || 0; i < len; i++) {
		    			var status = "";
		    			switch(data[i].att_status) {
		    			case 1:
		    				status = "출근";
		    				break;
		    			case 2:
		    				status = "퇴근";
		    				break;
		    			case 3:
		    				status = "알 수 없음";
		    			}
		    			str += "<tr>";
						str += "<td>" + data[i].cal_date + "</td>";
						str += "<td>" + data[i].att_on + "</td>";
						str += "<td>" + data[i].att_off + "</td>";
						str += "<td>" + status + "</td>";
						str += "</tr>";
		    		}
		    		tbody.html(str);
		    	})
		    }
		    
		    att_on.on("click", function(e){
				attendanceService.attendanceOn({
					emp_no : emp_no
				}, function(result){
					alert(result);
					showCheck(emp_no);
					showList(emp_no);
				});
			});
			
			att_off.on("click", function(e){
				attendanceService.attendanceOff({
					emp_no : emp_no
				}, function(result){
					alert(result);
					showCheck(emp_no);
					showList(emp_no);
				});
			});
		    
		    
	            
	        $('div').removeClass('form-inline');
	        $('div.app-page-title').css('margin', '0px 0px 0px');
	        $('div.app-page-title').css('padding', '50px 0px 30px 0px');

    	});