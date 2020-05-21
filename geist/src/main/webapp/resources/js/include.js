function ChangeMpage(value){
            
    if(value == "0") // 셋팅버튼 클릭시 마이페이지수정 화면으로 이동
    {
        location.href="myPage/detail";
    }
    else if(value == "1") // 로그아웃 버튼 클릭시 로그아웃 처리
    {
        location.href="logout";
    }
    else if(value == "2") // nav 버튼 클릭시 공지사항 화면이동
    {
        location.href="notice";
    }
    else if(value == "3") // nav 버튼 클릭시 프로젝트 화면이동
    {
        location.href="project";
    }
    else if(value == "4") // nav 버튼 클릭시 전자결제요청 화면이동
    {
        location.href="/approvalRequest";
    }
    else if(value == "5") // nav 버튼 클릭시 전자결제요청 조회 화면이동
    {
        location.href="/approvalSearch";
    }
    else if(value == "6") // nav 버튼 클릭시 전자결제승인 조회 화면이동
    {
        location.href="/approvalAdmit";
    }
    else if(value == "7") // nav 버튼 클릭시 인사근태 화면이동
    {
        location.href="attendance";
    }
    else if(value == "8") // nav 버튼 클릭시 주소록 화면이동
    {
    	location.href="address";
    }
    else if(value == "9") // nav 버튼 클릭시 마이페이지 화면이동
    {
    	location.href="myPage";
    }
    else if(value == "10") // nav 버튼 클릭시 관리자 회원조회 화면이동
    {
        location.href="empManage";
    }
    else if(value == "11") // nav 버튼 클릭시 관리자 가입승인 화면이동
    {
        location.href="joinRequest";
    }
    else if(value == "12") // nav 버튼 클릭시 프로젝트 주간업무보고서 화면이동
    {
        location.href="approvalRequest/detail/1";
    }
    else if(value == "13") // nav 버튼 클릭시 프로젝트 휴가서 화면이동
    {
        location.href="approvalRequest/detail/2";
    }
    else if(value == "14") // nav 버튼 클릭시 프로젝트 사직서 화면이동
    {
        location.href="approvalRequest/detail/3";
    }
}