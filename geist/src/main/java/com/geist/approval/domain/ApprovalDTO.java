package com.geist.approval.domain;

import java.util.Date;

import com.geist.address.domain.AddressVO;

import lombok.Data;

/* *
 * 결재 페이지
 * 담당 : 김현선 
 */

@Data
public class ApprovalDTO {
	// 결재 문서 생성 insert -> appCreate()
	private Long app_no;
	private Long app_class;
	private String app_title;
	private String app_date;
	private Long app_status;	
	private String emp_name;	//결재 문서 작성자의 emp_name
}