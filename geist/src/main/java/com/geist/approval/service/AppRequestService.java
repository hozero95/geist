package com.geist.approval.service;

import com.geist.approval.domain.ApprovalCreateDTO;
import com.geist.approval.domain.ApprovalWriterDTO;

/* *
 * 결재 페이지
 * 담당 : 김현선
 */

public interface AppRequestService {
	
	// 결재 문서 생성 insert
	public int appCreate(ApprovalCreateDTO dto);
	// 결재 요청자 insert
	public int appReqCreate(ApprovalCreateDTO dto);
	// 결재 승인자들 insert
	public void appAgrCreate(ApprovalCreateDTO dto);
	//결재 문서 생성할 작성자 정보 조회 
	public ApprovalWriterDTO appWriter(Long emp_no);
	
}
