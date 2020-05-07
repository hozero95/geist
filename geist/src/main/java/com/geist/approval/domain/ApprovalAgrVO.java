package com.geist.approval.domain;

import lombok.Data;

@Data
public class ApprovalAgrVO {
	private Long app_no;
	private Long emp_no;		//app_agree 사원번호
	private Long agr_status;	//app_agree 결제 승인
}
