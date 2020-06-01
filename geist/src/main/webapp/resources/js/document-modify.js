var NoticeService = (function(){
	function detailView(param, callback, error){
			var noti_no = param.noti_no;
			$.getJSON("/notice/noticeUpdate/" + noti_no + ".json", function(data){
				if(callback){
					callback(data);
				}
			}).fail(function(xhr, status, err){
				if(error){
					error();
				}
			});
		}
	
	function modifyEmp(param, callback, error){
		$.ajax({
			type : 'PUT',
			url : '/notice/noticeUpdate/'+ param.noti_no,
			data : JSON.stringify(param),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, err){
				if(error){
					error(err);
				}
			}
		});
	}
	
	return{
		detailView : detailView,
		modifyEmp : modifyEmp
	};
})();

$(document).ready(function(){ 
	var url = document.location.href.split("?");
	var pram = url[1].split("noti_no=");
	var noti_no = pram[1]
	var noti_Btn = $("#btnSave");
	
	detailView(noti_no);
	
	function detailView(noti_no){
		NoticeService.detailView({
			noti_no : noti_no
		}, function(data){
			$("#Notice-title").append("<label for='title'>제목</label>");
			$("#Notice-title").append("<input type='text' class='form-control' id='title' name='title' value='"+ data.noti_title +"'>");
			
			$("#Notice-content").append("<label for='content'>내용</label>");
			$("#Notice-content").append("<textarea class='form-control' rows='15' id='content' name='content' autofocus>"
										+ data.noti_content +"</textarea>");
		});
		
		noti_Btn.on("click", function(e){
			var noti_title = $("#title").val();
			var noti_content = $("#content").val();
			
			NoticeService.modifyEmp({
				noti_no : noti_no,
				noti_title : noti_title,
				noti_content : noti_content
			}, function(result){
				alert("게시글이 수정되었습니다.");
				location.href = "/notice/noticeRead/?noti_no="+noti_no;
			});
		})
		
		
		$("#btnList").on("click", function(){
			location.href = "/notice"
		});
	}       
    });
    
    