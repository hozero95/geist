package com.geist.approval.domain;

import java.util.Date;

import com.geist.address.domain.AddressViewVO;

import lombok.Data;

/* *
 * 결재 페이지
 * 담당 : 김현선 
 */

@Data
public class ApprovalVO {

	//approval(결재) 
	private Long app_no;
	private Long app_class;
	private String app_title;
	private String app_date;
	private Long app_status;
	
	
	//문서 작성자
	//private String emp_name;
	
}