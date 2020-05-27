var NoticeService = (function(){
	function detailView(param, callback, error){
			var noti_no = param.noti_no;
			console.log("NoticeService.getList()noti_no === " + noti_no);
				
			$.getJSON("/notice/noticeRead/" + noti_no + ".json", function(data){
				if(callback){
					callback(data);
				}
			}).fail(function(xhr, status, err){
				if(error){
					error();
				}
			});
		}
	
	return{
		detailView : detailView,
	};
})();
/** 게시판 - 목록 페이지 이동 */
function goBoardList(){                
    location.href = "/notice";
}

/** 게시판 - 수정 페이지 이동 */
function goBoardUpdate(noti_no){
	var noti_no = noti_no;
    location.href = "/notice/noticeUpdate/?noti_no="+noti_no;
}

/** 게시판 - 삭제  */
function deleteBoard(noti_no){
    
    var yn = confirm("게시글을 삭제하시겠습니까?");        
    if(yn){
    	$.ajax({    
			type : 'delete',
            url        : "/notice/noticeDelete/"+noti_no,
            data : JSON.stringify(noti_no),
			contentType : "application/json; charset=utf-8",
			success : function(obj) {
				deleteBoardCallback(obj);
			},
			error     : function(xhr, status, error) {}
            
        	});
    }else {
		alert("오류가 발생했습니다.\n관리자에게 문의하세요.");
	}
}

/** 게시판 - 삭제 콜백 함수 */
function deleteBoardCallback(obj){

    if(obj != null){        
      
        var result = obj;
        
        if(result === "success"){   
        	alert("게시글 삭제를 성공하였습니다.");                
            goBoardList();        
        } else {         
            alert("게시글 삭제를 실패하였습니다.");    
            return; 
        }
    }
}

$(document).ready(function(){ 
	var url = document.location.href.split("?");
	var pram = url[1].split("noti_no=");
	var noti_no = pram[1]
	
	detailView(noti_no);
	
	function detailView(noti_no){
		NoticeService.detailView({
			noti_no : noti_no
		}, function(data){
			$("div.rounded").append("<div class='board-title'>" + data.noti_title + "</div>");
			$("div.rounded").append("<div class='board-info-box'>" + 
					"<span class='board-date'>" + data.noti_date + "</span>"
					+ "</div>");
			$("div.rounded").append("<hr>");
			$("div.rounded").append("<div class='board-content'>" + data.noti_content + "</div>");
		});
	}
	
	$("#btnUpdate").on("click", function(){
		goBoardUpdate(noti_no);
	});
	
	$("#btnDelete").on("click", function(){
		deleteBoard(noti_no);
	});
	
	$("#btnList").on("click", function(){
		goBoardList();
	});
	
});
