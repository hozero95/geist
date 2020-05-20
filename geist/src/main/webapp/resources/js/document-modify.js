$(document).ready(function(){        
        getBoardDetail();        
    });
    
    /** 게시판 - 목록 페이지 이동 */
    function goBoardList(){                
        location.href = "/notice";
    }
    
    /** 게시판 - 상세 조회  */
    function getBoardDetail(noti_no){
        
        var noti_seq = $("#noti_no").val();
 
        if(noti_seq != ""){
            
            $.ajax({    
                
                url        : "/notice/noticeUpdate/"+noti_seq,
                contentType: 'application/json; charset=utf-8',
                data    : $("#Notice-form").serialize(),
                dataType: "JSON",
                cache   : false,
                async   : true,
                type    : "PUT",    
                success : function(obj) {
                    getBoardDetailCallback(obj);                
                },           
                error     : function(xhr, status, error) {}
                
             });
            
        } else {
            alert("오류가 발생했습니다.\n관리자에게 문의하세요.");
        }    
    }
    
    /** 게시판 - 상세 조회  콜백 함수 */
    function getBoardDetailCallback(obj){
        
        var str = "";
        
        if(obj != null){                                
                            
            var noti_seq        = obj.noti_no; 
            var noti_title         = obj.noti_title; 
            var noti_content         = obj.noti_content; 
            var noti_date         = obj.noti_date; 
                    
            $("#NOTI_TITLE").val(noti_title);            
            $("#NOTI_CONTENT").val(noti_content);
            
        } else {            
            alert("등록된 글이 존재하지 않습니다.");
            return;
        }        
    }
    
    /** 게시판 - 수정  */
    function updateBoard(){
 
        var NOTI_TITLE    = $("#NOTI_TITLE").val();
        var NOTI_CONTENT     = $("#NOTI_CONTENT").val();
            
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
        
        var yn = confirm("게시글을 수정하시겠습니까?");        
        if(yn){
                
            $.ajax({    
                
                url        : "/notice/noticeUpdate/"+noti_seq,
                data    : $("#Notice-form").serialize(),
                dataType: "JSON",
                cache   : false,
                async   : true,
                type    : "GET",    
                success : function(obj) {
                    updateBoardCallback(obj);                
                },           
                error     : function(xhr, status, error) {}
                
            });
        }
    }
    
    /** 게시판 - 수정 콜백 함수 */
    function updateBoardCallback(obj){
    
        if(obj != null){        
            
            var result = obj.result;
            
            if(result == "SUCCESS"){                
                alert("게시글 수정을 성공하였습니다.");                
                goBoardList();                 
            } else {                
                alert("게시글 수정을 실패하였습니다.");    
                return;
            }
        }
    }