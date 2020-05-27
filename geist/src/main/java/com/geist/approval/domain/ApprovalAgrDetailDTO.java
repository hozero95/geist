package com.geist.approval.domain;

import lombok.Data;

@Data
public class ApprovalAgrDetailDTO {	
	private String dept_name;
	private String emp_position;
	private String emp_name;
	private String app_title;
	private String app_date;
	
	private Long app_no;
	private Long app_class;
	private Long agr_status;
}

