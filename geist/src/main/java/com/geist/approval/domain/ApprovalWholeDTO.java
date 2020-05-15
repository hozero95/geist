package com.geist.approval.domain;

import java.util.List;

import com.geist.main.domain.Criteria;

import lombok.Data;

@Data
public class ApprovalWholeDTO {
	// ApprovalVO
	private Long app_no;
	private Long app_class;
	private String app_title;
	private String app_date;
	private Long app_status;

	// ApprovalReqVO
	private Long emp_no; // app_request 사원번호

	// ApprovalAgrVO
	private List<ApprovalAgrVO> manager_no; // app_agree 사원번호
	private Long agr_status; // app_agree 결제 승인
	
	// 리스트 페이징 처리
	private int count;
	private List<ApprovalReqVO> list;
	
	// 결재 조회 getList
	public ApprovalWholeDTO(int count, List<ApprovalReqVO> list, Criteria cri) {
		this.count = count;
		this.list = list;
	}
}