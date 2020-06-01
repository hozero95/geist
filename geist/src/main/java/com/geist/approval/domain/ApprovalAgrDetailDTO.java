package com.geist.approval.domain;

import lombok.Data;

@Data
public class ApprovalAgrDetailDTO {	
	// 결재 승인 상세 조회 -> admitDetail()
	private String dept_name;
	private String emp_position;
	private String emp_name;
	private String app_title;
	private String app_date;
	
	private Long app_no;
	private Long app_class;
	private Long agr_status;
	private Long app_status;	// 최종상태
}

