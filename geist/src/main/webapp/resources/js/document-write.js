$(document).ready(function(){        
        
    });
        
    /** 게시판 - 목록 페이지 이동 */
    function goBoardList(){                
        location.href = "/notice";
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
                
            $.ajax({    
                
                url        : "/write",
                data    : $("#notice-w-form").serialize(),
                dataType: "JSON",
                contentType : "application/json; charset=utf-8",
                cache   : false,
                async   : true,
                type    : "POST",    
                success : function(obj) {
                    insertBoardCallback(obj);                
                },           
                error     : function(xhr, status, error) {}
                
            });
        }
    }
    
    /** 게시판 - 작성 콜백 함수 */
    function insertBoardCallback(obj){
    
        if(obj != null){        
            
            var result = obj.result;
            
            if(result == "SUCCESS"){                
                alert("게시글 등록을 성공하였습니다.");                
                goBoardList();                 
            } else {                
                alert("게시글 등록을 실패하였습니다.");    
                return;
            }
        }
    }