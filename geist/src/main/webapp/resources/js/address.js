/* *
 * 주소록 페이지
 * 담당 : 김현선
 */

console.log("address.js 임포트 됬따~~~~!!");

var addressService = (function() {
	function getList(param, callback, error) {
		var page = param.page;
		console.log("param.page === " + param.page);
		$.getJSON("/address/" + page + ".json", function(data) {
			if (callback) {
				console.log("data.count === " + data.count)
				console.log("data.page === " + data.page)
				callback(data.count, data.list);
			}
		}).fail(function(xhr, status, err) {
			console.log("getList error !!!!!!!!!!")
			if (error) {
				error();
			}
		});
	}

	function searchList(param, callback, error) {
		var page = param.page;
		var keyword = param.keyword;
		console.log("param.page === " + param.page);
		console.log("param.keyword === " + param.keyword);
		$.getJSON("/address/" + page + "/" + keyword + ".json", function(data) {
			if (callback) {
				console.log("data.count === " + data.count);
				console.log("data.keyword === " + data.keyword);
				callback(data.count, data.list, data.keyword);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}

	// 리턴하여 사용할 함수 등록
	return {
		getList : getList,
		searchList : searchList
	}
})();

// json으로 넘어온 데이터 사용
$(document).ready(function() {
	var searchForm = $("#searchForm");
	var search = $(".search");
	var tbody = $(".table-body");
	var tpage = $(".table-page");
	var main = $(".mainBtn");
	var pageNum = 1;

	showList(1);

	function showList(page) {
		addressService.getList({
			page : page || 1
		},function(count, list) {
			if (page == -1) {
				pageNum = Math.ceil(count / 10.0);
				showList(pageNum);
				return;
			}
			var str = "";
			if (list == null|| list.length == 0) {
				return;
			}
			for (var i = 0, len = list.length || 0; i < len; i++) {
				console.log("list === " + list);
				str += "<tr>";
				str += "<td>"+ list[i].emp_name+ "</td>";
				str += "<td>"+ list[i].emp_email+ "</td>";
				str += "<td>"+ list[i].emp_phone+ "</td>";
				str += "<td>" + list[i].emp_tel+ "</td>";
				str += "<td>"+ list[i].emp_position+ "</td>";
				str += "<td>" + list[i].dept_no+ "</td>";
				str += "</tr>";
			}

			tbody.html(str);
			showListPage(count);
		});
	}

	function showSearchList(page, keyword) {
		addressService.searchList({
			page : page || 1,
			keyword : keyword
		},function(count, list, keyword) {
			if (page == -1) {
				pageNum = Math.ceil(count / 10.0);
				showList(pageNum);
				return;
			}
			var str = "";
			if (list == null|| list.length == 0) {
				alert("검색 결과가 없습니다.");
				return;
			}
			for (var i = 0, len = list.length || 0; i < len; i++) {
				str += "<tr>";
				str += "<td>"+ list[i].emp_name+ "</td>";
				str += "<td>"+ list[i].emp_email+ "</td>";
				str += "<td>"+ list[i].emp_phone+ "</td>";
				str += "<td>" + list[i].emp_tel+ "</td>";
				str += "<td>"+ list[i].emp_position+ "</td>";
				str += "<td>" + list[i].dept_no+ "</td>";
				str += "</tr>";
			}

			$("input[name='keyword']").val(keyword);
			tbody.html(str);
			showListPage(count);
		});
	}
	
	function showListPage(count) {
		var endNum = Math.ceil(pageNum / 10.0) * 10;
		var startNum = endNum - 9;
		var prev = startNum != 1;
		var next = false;

		if (endNum * 10 >= count) {
			endNum = Math.ceil(count / 10.0);
		}
		if (endNum * 10 < count) {
			next = true;
		}

		var str = "<ul>";
		if (prev) {
			str += "<li><a href='" + (startNum - 1)+ "'>Prev</a></li>";
		}
		for (var i = startNum; i <= endNum; i++) {
			var linkStart = pageNum != i ? "<a href='" + i+ "'>" : "";
			var linkEnd = pageNum != i ? "</a>" : "";
			str += "<li>" + linkStart + i + linkEnd + "</li>";
		}
		if (next) {
			str += "<li><a href='" + (endNum + 1)+ "'>Next</a></li>";
		}
		str += "</ul>";

		tpage.html(str);
	}

	
	// 실행부
	search.on("click", function(e) { // 엔터로 변경해야 함
		if (!searchForm.find("input[name='keyword']").val()) {
			alert("키워드를 입력하세요.");
			return false;
		}

		var keyword = $("input[name='keyword']").val();

		e.preventDefault();
		showSearchList(1, keyword);
	});

	tpage.on("click", "li a", function(e) {
		e.preventDefault();

		var targetPageNum = $(this).attr("href");
		pageNum = targetPageNum;

		showList(pageNum);
	});

	main.on("click", function() {
		location.href = "/main";
	});
});