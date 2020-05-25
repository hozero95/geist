$(document).ready(function(){        
        
    });
	function goBoardList(){                
	    location.href = "/notice";
	}
    /** 게시판 - ajax */
    function noticeWrite(param, callback, error) {
    	$.ajax({    
            url : "/notice/noticeWrite",
            data : JSON.stringify(param),
            contentType : "application/json; charset=utf-8",
            cache   : false,
            async   : true,
            type    : "POST",    
            success : function(result, status, xhr) {
            	if(callback){
					callback(result);
				}             
            },                  
            error     : function(xhr, status, error) {
            	if(error){    
					error(err);
				}
            }
        });
    }
    
    /** 게시판 - 작성  */
    function insertBoard(){
 
        var NOTI_TITLE = $("#NOTI_TITLE").val();
        var NOTI_CONTENT = $("#NOTI_CONTENT").val();
            
        if (NOTI_TITLE == ""){            
            alert("제목을 입력해주세요.");
            $("#NOTI_TITLE").focus();
            return;
        }
         
        if (NOTI_CONTENT == ""){            
            alert("내용을 입력해주세요.");
            $("#NOTI_CONTENT").focus();
            return;
        }
        
        var yn = confirm("게시글을 등록하시겠습니까?");        
        if(yn){
        	noticeWrite({
        		"noti_title" : NOTI_TITLE,
   				"noti_content" : NOTI_CONTENT,
        	},function(result){
        		alert("게시글 등록을 성공하였습니다.");                
        		location.href = "/notice";
        	})
        }else{
        	alert("게시글 등록을 실패하였습니다.");
        	return;
        }
    }