package com.geist.approval.domain;

import java.util.List;

import com.geist.main.domain.Criteria;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ApprovalWholeDTO {
	private Long emp_no; 
	
	private Long app_no;
	private Long app_class;
	private String app_title;
	private String app_date;
	private Long app_status;
	
	private Long agr_status;
	private List<ApprovalAgrVO> manager_no; // app_agree 사원번호
}