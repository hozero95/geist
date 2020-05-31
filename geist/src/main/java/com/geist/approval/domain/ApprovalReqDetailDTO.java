package com.geist.approval.domain;

import lombok.Data;

@Data
public class ApprovalReqDetailDTO {
	// 결재 요청 상세 조회 -> reqDetail()
	private String dept_name;
	private String emp_position;
	private String emp_name;
	private String app_date;
}
