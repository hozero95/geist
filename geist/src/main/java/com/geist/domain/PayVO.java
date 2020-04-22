package com.geist.domain;

import java.util.Date;

/* *
 * 결재 페이지
 * 담당 : 김현선
 * 
 반정규화?
 중복이나 계산되는 값을 데이터베이스 상에 보관하고 
 조인이나 서브쿼리의 사용을 줄이는 방식
 
 approval(결재) 
 - app_class : , app_status : 대기(1), 승인(2), 반려(3) ->반정규화?
 - 결재번호, 분류, 제목, 날짜, 최종상태
 - app_no, app_class, app_title, app_date, app_status
 
 app_request(결제 요청)
 - 결재번호, 사원번호
 - app_no, emp_no
 
 app_agree(결제 승인) 
 - agr_status : 대기(1), 승인(2), 반려(3) ->반정규화?
 - 결재번호, 사원번호, 상태
 - app_no, emp_no, agr_status
 
 */

public class PayVO {

	//approval(결재) 
	private Long app_no;
	private Long app_class;
	private String app_title;
	private Date app_date;
	private Long app_status;
	
	//app_request(결제 요청(생성))
	private Long emp_no;
	
	//app_agree(결제 승인) 
	private Long agr_status;
	
}
