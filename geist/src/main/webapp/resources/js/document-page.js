var NoticeService = (function(){
	function getList(param, callback, error){
			var page = param.page;
			console.log("NoticeService.getList()page === " + page);
			
			$.getJSON("/notice/noticeList/" + page + ".json", function(data){
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
		getList : getList
	};
})();

$(document).ready(function() {
	var tbody = $("#document-body");
	var tpage = $("#document-table-page");
	var write = $("#notice-write");
	var noti_no;
	var noti_title;
	var noti_date;
	var pageNum = 1;

	showList(1);

	function showList(page){
		NoticeService.getList({
			page : page || 1
		}, function(list){
			if(page == -1){
				pageNum = Math.ceil(count / 10.0);
				showList(pageNum);
				return;
			}
			var str = "";
			if(list == null || list.length == 0){
				return;
			}
			for(var i = 0, len = list.length || 0; i < len; i++){
				str += "<tr>";
				str += "<td>" + list[i].noti_no + "</td>";
				str += "<td>" + list[i].noti_title + "</td>";
				str += "<td>" + list[i].noti_date + "</td>";
				str += "</tr>";
			}
			tbody.html(str);
			showListPage(count);
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
		
		var str = "<ul>";
		if(prev){
			str += "<li><a href='" + (startNum - 1) + "'>Prev</a></li>";
		}
		for(var i = startNum; i <= endNum; i++){
			var linkStart = pageNum != i ? "<a href='" + i + "'>" : "";
			var linkEnd = pageNum != i ? "</a>" : "";
			str += "<li>" + linkStart + i + linkEnd + "</li>";
		}
		if(next){
			str += "<li><a href='" + (endNum + 1) + "'>Next</a></li>";
		}
		str += "</ul>";
		
		tpage.html(str);
	}
	
	tpage.on("click", "li a", function(e){
		e.preventDefault();
		
		var targetPageNum = $(this).attr("href");
		pageNum = targetPageNum;
		
		showList(pageNum);
	});
	
	write.on("click", function(){
		location.href = "/notice/noticeWrite";
	});
});
