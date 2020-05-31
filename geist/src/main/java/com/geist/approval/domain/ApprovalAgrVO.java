package com.geist.approval.domain;

import lombok.Data;

@Data
public class ApprovalAgrVO {
	// 결재승인자들 insert -> appAgrCreate()
	private Long app_no;
	private Long emp_no;		//app_agree 사원번호
	private Long agr_status;	//app_agree 결제 승인
	
	private String emp_position;
	private int count;
}