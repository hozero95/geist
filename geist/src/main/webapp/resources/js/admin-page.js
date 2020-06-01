/**
 * 사원관리 페이지
 * 담당 : 김현선(김호영)
 */

var empManageService = (function(){
		function getList(param, callback, error){
			var page = param.page;
			$.getJSON("/empManage/" + page + ".json", function(data){
				if(callback){
					callback(data.count, data.list);
				}
			}).fail(function(xhr, status, err){
				if(error){
					error();
				}
			});
		}
		
		function searchList(param, callback, error){
			var page = param.page;
			var type = param.type;
			var keyword = param.keyword;
			$.getJSON("/empManage/" + page + "/" + type + "/" + keyword + ".json", function(data){
				if(callback){
					callback(data.count, data.list, data.type, data.keyword);
				}
			}).fail(function(xhr, status, err){
				if(error){
					error();
				}
			});
		}
		
		function detailView(param, callback, error){
			var emp_no = param.emp_no;
			$.getJSON("/empManage/detailView/" + emp_no + ".json", function(data){
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
			getList : getList,
			searchList : searchList,
			detailView : detailView
		};
	})();
	
	$(document).ready(function(){
		var searchForm = $("#searchForm");
		var search = $("#search");
		var clear = $("#clear");
		var tbody = $(".table-body");
		var tpage = $(".table-page");
		var pageNum = 1;
		
		showList(1);
		
		function showList(page){
			empManageService.getList({
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
					str += "<td>" + list[i].emp_no + "</td>";
					str += "<td>" + list[i].emp_name + "</td>";
					str += "<td>" + list[i].emp_position + "</td>";
					str += "<td>" + list[i].emp_date + "</td>";
					str += "<td>" + list[i].dept_name + "</td>";
					str += "<td>" 
						+ "<span><button type='button' class='btn btn-lg dt-button detailBtn'>조회</button>" 
						+ "<input type='hidden' name='emp_no' value='" + list[i].emp_no + "'></span></td>";
					str += "</tr>";
				}
				
				tbody.html(str);
				showListPage(count);
			});
		}
		
		function showSearchList(page, type, keyword){
			empManageService.searchList({
				page : page || 1,
				type : type,
				keyword : keyword
			}, function(count, list, type, keyword){
				if(page == -1){
					pageNum = Math.ceil(count / 10.0);
					showList(pageNum);
					return;
				}
				var str = "";
				if(list == null || list.length == 0){
					alert("검색 결과가 없습니다.");
					return;
				}
				for(var i = 0, len = list.length || 0; i < len; i++){
					str += "<tr>";
					str += "<td>" + list[i].emp_no + "</td>";
					str += "<td>" + list[i].emp_name + "</td>";
					str += "<td>" + list[i].emp_position + "</td>";
					str += "<td>" + list[i].emp_date + "</td>";
					str += "<td>" + list[i].dept_name + "</td>";
					str += "</tr>";
				}
				
				$("select[name='type']").find("option[value='" + type + "']").attr("selected", true);
				$("input[name='keyword']").val(keyword);
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
			var emp_no = $(this).children().eq(1).val()
			console.log(emp_no)
			
			var popWindow = window.open("/empManage/detailView?emp_no=" + emp_no, "사원 상세 보기", "width=600, height=800");
//			location.reload();
		});
		
		tpage.on("click", "li a", function(e){
			e.preventDefault();
			
			var targetPageNum = $(this).attr("href");
			pageNum = targetPageNum;
			
			showList(pageNum);
		});
		
		search.on("click", function(e){
			if(!searchForm.find("option:selected").val()){
				alert("검색 종류를 선택하세요.");
				return false;
			}
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요.");
				return false;
			}
			
			var type = $("select[name='type'] option:selected").val();
			var keyword = $("input[name='keyword']").val();
			
			e.preventDefault();
			showSearchList(1, type, keyword);
		});
		
		clear.on("click", function(e){
			showList(1);
		})
	});