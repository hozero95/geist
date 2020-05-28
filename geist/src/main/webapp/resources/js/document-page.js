var NoticeService = (function(){
	function getList(param, callback, error){
			var page = param.page;
			console.log("NoticeService.getList()page === " + page);
				
			$.getJSON("/notice/noticeList/" + page + ".json", function(data){
				if(callback){
					callback(data.count, data.list);
				}
			}).fail(function(xhr, status, err){
				if(error){
					error();
				}
			});
		}
	
	return{
		getList : getList,
	};
})();

$(document).ready(function() {
	var tbody = $("#document-body");
	var tpage = $("#document-table-page");
	var write = $("#notice-write");
	var noti_no
	var noti_title;
	var noti_date;
	var pageNum = 1;
	
	showList(1);
	
	function showList(page){

		NoticeService.getList({
			page : page || 1
		}, function(count, list){
			if(page == -1){
				pageNum = Math.ceil(count / 10.0);
				showList(pageNum);
				return;
			}

			var str = "";
			if(list == null || list.length == 0) {
				return;
			}

			for(var i = 0, len = list.length || 0; i < len; i++){

				str += "<tr>";
				str += "<td>" + list[i].noti_no +"</td>";
				str += "<td><a href='#'>" + list[i].noti_title 
					+ "<input type='hidden' name='noti_no' value='" + list[i].noti_no + "'>"
					+ "</a></td>";
				str += "<td>" + list[i].noti_date + "</td>";
				str += "</tr>";
			}
			
			tbody.html(str);
			showListPage(count)
		});
	}
	
	function showListPage(count){
		var endNum = Math.ceil(pageNum / 10.0) * 10;
		var startNum = endNum - 9;
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 10 >= count){
			endNum = Math.ceil(count / 10.0);
		}
		if(endNum * 10 < count){
			next = true;
		}
		
		var str = "<ul class='pagination justify-content-end'>";
	    if(prev){
	        str += "<li class='page-item'><a class='page-link' href='" + (startNum - 1) + "'>Prev</a></li>";
	    }
	    for(var i = startNum; i <= endNum; i++){
	        var linkStart = pageNum != i ? "'><a href='" + i + "'>" : "active'><a href='" + i + "'>";
	        var linkEnd = pageNum != i ? "</a>" : "</a>" ;
	        str += "<li class='page-item " + linkStart + i + linkEnd + "</a></li>";
	    }
	    if(next){
	        str += "<li class='page-item ><a href='" + (endNum + 1) + "'>Next</a></li>";
	    }
	    str += "</ul>";
	    
	    tpage.html(str);
	}
	
	function noticeRead(noti_no) {
		$.ajax({
			type : 'get',
			url : '/notice/noticeRead/'+ noti_no,
			data : noti_no,
			success : function() {
				console.log("noti_no 전달 성공");
			},
			error : function() {
				console.log("noti_no 전달 실패 : ");
			}
		});
	}
	
	tpage.on("click", "li a", function(e){
		e.preventDefault();
		
		var targetPageNum = $(this).attr("href");
		pageNum = targetPageNum;
		
		showList(pageNum);
	});
		
	tbody.on("click", "tr td a", function() {
		var noti_no = $(this).children().eq(0).val();
		
		noticeRead(noti_no);
		location.href = "/notice/noticeRead/?noti_no="+noti_no;
	});
	write.on("click", function(){
		location.href = "/notice/noticeWrite";
	});
});
