/**
 * 가입 승인 페이지
 * 담당 : 김현선(김호영)
 */

var joinRequestService = (function(){
		function getList(param, callback, error){
			var page = param.page;
			$.getJSON("/joinRequest/" + page + ".json", function(data){
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
			getList : getList
		};
	})();

	$(document).ready(function(){
		var tbody = $(".table-body");
		var tpage = $(".table-page");
		var empManage = $(".empManageBtn");
		var main = $(".mainBtn");
		var pageNum = 1;
		
		showList(1);
		
		function showList(page){
			joinRequestService.getList({
				page : page || 1
			}, function(count, list){
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
					str += "<td>" + list[i].req_id + "</td>";
					str += "<td>" + list[i].req_name + "</td>";
					str += "<td>" + list[i].req_birth + "</td>";
					str += "<td>" + list[i].req_phone + "</td>";
					str += "<td>" + list[i].req_email + "</td>";
					str += "<td>" + list[i].req_address + "</td>";
					str += "<td>" 
						+ "<span><button type='button' class='btn btn-lg dt-button detailBtn'>조회</button>" 
						+ "<input type='hidden' name='req_id' value='" + list[i].req_id + "'></span></td>";
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
			
			var str = "<ul class='pagination justify-content-end'>";
		    if(prev){
		        str += "<li class='page-item'><a href='" + (startNum - 1) + "'class='page-link'>Prev</a></li>";
		    }
		    for(var i = startNum; i <= endNum; i++){
		        var linkStart = pageNum != i ? "'><a href='" + i + "'>" : "active'><a href='" + i + "'>";
		        var linkEnd = pageNum != i ? "</a>" : "</a>" ;
		        str += "<li class='page-item " + linkStart + i + linkEnd + "</a></li>";
		    }
		    if(next){
		        str += "<li class='page-item'><a href='" + (endNum + 1) + "'>Next</a></li>";
		    }
		    str += "</ul>";
		    
		    tpage.html(str);
		}
		
		tbody.on("click", "tr td span", function(e){
			var req_id = $(this).children().eq(1).val();
			
			var popWindow = window.open("/joinRequest/detailView?req_id=" + req_id, "가입 승인 상세 보기", "width=500, height=700");
//			location.reload();
		});
		
		tpage.on("click", "li a", function(e){
			e.preventDefault();
			
			var targetPageNum = $(this).attr("href");
			pageNum = targetPageNum;
			
			showList(pageNum);
		});
	});