<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Geist</title>
	<!-- main Css-->
    <link href="/resources/css/document.css" rel="stylesheet" />
    <link href="/resources/css/main.css" rel="stylesheet" />
    <!-- Data table-->
    <script src = "http://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js" ></script>
    <!-- Bootstrap -->
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Data button-->
    <script src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>
    
</head>

<body>

	<%
		request.setCharacterEncoding("UTF-8");
	
	    String contentPage=request.getParameter("contentPage");
	    if(contentPage==null)
	        contentPage="main.jsp";
	    
	    String admin_nav = (String)session.getAttribute("adminOk");
		if(admin_nav == null) {
			admin_nav="admin-nav.jsp";
		}else{
			admin_nav="admin-nav.jsp";
		}
		
		String boardSeq = request.getParameter("boardSeq");	
	%>
	
	<div id="header">
		<jsp:include page="topnav.jsp" />
	</div>
    <div id="side">
    	<jsp:include page="<%=admin_nav%>" />
    </div>
    
	<div class="app-container fixed-sidebar fixed-header closed-sidebar">
        <!-- Lower -->
        <div class="app-main">
            <!-- Main page -->
            <div class="app-main-outer">
                <!-- Main button page -->
                <div class="app-main_inner">
                    <div class="container-fluid">
                        <div class="container">
                            <!-- Title -->
                            <div class="app-page-title" style="margin: 0px; padding: 50px 0px 30px;">
                                <div class="page-title-heading">
                                    <i class="pe-7s-document-inverse"></i>
                                    <h1><sub>사내공지</sub></h1>
                                    <p>
                                </div>
                                <hr class="Geist-board-hr">
                            </div>
                            
                            <!-- Modify -->
                            <article>
                                <div class="container" role="main" style="padding: 0px 100px 0px 100px;">
                                    <form name="Notice-form" id="Notice-form">
                                        <div class="mb-3">
                                            <label for="title">제목</label>
                                            <input type="text" class="form-control" name="title" id="NOTI_TITLE"
                                                placeholder="제목을 입력해 주세요" value="${#.NOTI_TITLE}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="content">내용</label>
                                            <textarea class="form-control" rows="15" name="content" id="NOTI_CONTENT"
                                                placeholder="내용을 입력해 주세요">${#.NOTI_CONTENT}</textarea>
                                        </div>
                                        <input type="hidden" id="noti_no" name="board_seq" value="${noti_no}"/> <!-- 게시글 번호 -->
                                    </form>
                                    <div class="pt-2" style="float: right;">
                                        <button type="button" class="btn btn-sm dt-button" id="btnSave" >저장</button>
                                        <button type="button" class="btn btn-sm dt-button" id="btnList" onclick="javascript:goNoticeList();" >목록</button>
                                    </div>
                                </div>
                            </article>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	<div id="footer">
    	<jsp:include page="footer.jsp" />
    </div>
    
    <!--js-->
    <script type="text/javascript" src="/resources/js/include.js"></script>
    <script type="text/javascript" src="/resources/js/main.js"></script>
    <script type="text/javascript" src="/resources/js/register.js"></script>
    <script type="text/javascript" src="/resources/js/My-register.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){getNoticeModify();});
    	
    	/** 게시판 - 목록 페이지 이동 */
    	function goNoticeList(){				
    		location.href = "/notice";
    	}
    	
    	/** 게시판 - 상세 조회  */
    	function getNoticeModify(boardSeq){
    		
    		var boardSeq = $("#board_seq").val();
    		
    		if(boardSeq != ""){
    			
    			$.ajax({	
    				type	: "GET",
    			    url		: "/noticeRead/{noti_no}",
    			    data    : $("#Notice-form").serialize(),
    		        dataType: "JSON",
    		        cache   : false,
    				async   : true,	
    		        success : function(obj) {
    		        	getNoticeCallback(obj);				
    		        },	       
    		        error 	: function(xhr, status, error) {}
    		        
    		     });
    			
    		} else {
    			alert("오류가 발생했습니다.");
    		}
    	}
    	
    	/** 게시판 - 상세 조회  콜백 함수 */
    	function getNoticeCallback(obj){
    		
    		var str = "";
    		
    		if(obj != null){								
    							
    			var noti_no		= obj.noti_no; 
    			var noti_title 		= obj.noti_title; 
    			var noti_content 		= obj.noti_content; 
    			var noti_date 		= obj.noti_date; 
    					
    			$("#NOTI_TITLE").val(NOTI_TITLE);			
    			$("#NOTI_CONTENT").val(NOTI_CONTENT);
    			
    		} else {			
    			alert("등록된 글이 존재하지 않습니다.");
    			return;
    		}		
    	}
    	
    	/** 게시판 - 수정  */
    	function updateNotice(){

    		var NOTI_TITLE	= $("#NOTI_TITLE").val();
    		var NOTI_CONTENT 	= $("#NOTI_CONTENT").val();
    			
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
    				type	: "GET",
    			    url		: "/noticeUpdate/{noti_no}",
    			    data    : $("#Notice-form").serialize(),
    		        dataType: "JSON",
    		        cache   : false,
    		        async   : true,
    		        success : function(obj) {
    		        	updateNoticeCallback(obj);				
    		        },	       
    		        error 	: function(xhr, status, error) {}
    		        
    		    });
    		}
    	}
    	
    	/** 게시판 - 수정 콜백 함수 */
    	function updateNoticeCallback(obj){
    	
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
    	
    </script>
    <script>
        $(document).on('click', '#btnSave', function(e){
            e.preventDefault();
            $("#form").submit();
        });

        $(document).on('click', '#btnList', function(e){
        	e.preventDefault();
        	location.href="index.jsp?contentPage=page/document-page.jsp";
        });
    </script>
</body>
</html>