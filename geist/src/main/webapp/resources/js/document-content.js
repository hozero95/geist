$(document).ready(function(){        
        getBoardDetail();        
    });
    
    /** 게시판 - 목록 페이지 이동 */
    function goBoardList(){                
        location.href = "/notice";
    }
    
    /** 게시판 - 수정 페이지 이동 */
    function goBoardUpdate(){
        
    	var noti_seq = $('input[name=noti_no]').val();
        
        location.href = "/notice/noticeUpdate/"+ noti_seq;
    }
    
    /** 게시판 - 상세 조회  */
    function getBoardDetail(noti_no){
        
        var noti_seq = $('input[name=noti_no]').val();
 
        if(noti_seq != ""){
            
            $.ajax({    
                
                url        : "/notice/noticeRead/"+noti_seq,
                data    : $("#noti_seq").serialize(),
                contentType : "application/json; charset=utf-8",
                dataType: "JSON",
                cache   : false,
                async   : true,
                type    : "GET",    
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
                    
            str += "<div class='board-title'>" + noti_title + "</div>";
            str += "<div class='board-info-box'>";
            str += "<span class='board-date'>" + noti_date + "</span>";
            str += "</div>";
            str += "<hr>";
            str += "<div class='board-content'>" + noti_content + "</div>";
            
        } else {
            
            alert("등록된 글이 존재하지 않습니다.");
            return;
        }        
        
        $("#notice-content").html(str);
    }
    
    /** 게시판 - 삭제  */
    function deleteBoard(){
 
    	var noti_seq = $('input[name=noti_no]').val();
        
        var yn = confirm("게시글을 삭제하시겠습니까?");        
        if(yn){
            
            $.ajax({    
                
                url        : "/notice/noticeDelete/"+noti_seq,
                data    : $("#Notice-form").serialize(),
                contentType : "application/json; charset=utf-8",
                dataType: "JSON",
                cache   : false,
                async   : true,
                type    : "POST",    
                success : function(obj) {
                    deleteBoardCallback(obj);                
                },           
                error     : function(xhr, status, error) {}
                
             });
        }        
    }
    
    /** 게시판 - 삭제 콜백 함수 */
    function deleteBoardCallback(obj){
    
        if(obj != null){        
            
            var result = obj.result;
            
            if(result == "SUCCESS"){                
                alert("게시글 삭제를 성공하였습니다.");                
                goBoardList();                
            } else {                
                alert("게시글 삭제를 실패하였습니다.");    
                return;
            }
        }
    }