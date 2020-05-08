package com.geist.approval.domain;

import lombok.Data;

@Data
public class ApprovalReqVO {
	private Long app_no;
	private Long emp_no;		//app_request 사원번호
}