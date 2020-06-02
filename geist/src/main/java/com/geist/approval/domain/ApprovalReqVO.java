package com.geist.approval.domain;

import lombok.Data;

@Data
public class ApprovalReqVO {
	// 결재 요청 조회 -> appReqCreate()
	private Long app_no;
	private Long emp_no;		//app_request 사원번호
}