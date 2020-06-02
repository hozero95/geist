package com.geist.approval.domain;

import java.util.List;

import com.geist.main.domain.Criteria;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ApprovalCreateDTO {
	// 결재 문서 생성 -> appCreate(), appReqCreate(), appAgrCreate()
	private Long emp_no; 
	private Long app_no;
	private Long app_class;
	private String app_title;
	private String app_date;
	private Long app_status;
	
	private Long agr_status;
	private List<ApprovalAgrVO> manager_no; // 승인자 할 상사들의 사원번호
}