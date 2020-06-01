package com.geist.approval.service;

import com.geist.approval.domain.ApprovalAgrDTO;
import com.geist.approval.domain.ApprovalAgrDetailDTO;
import com.geist.approval.domain.ApprovalAgrDetailPositionDTO;
import com.geist.approval.domain.ApprovalAgrVO;
import com.geist.approval.domain.ApprovalCreateDTO;
import com.geist.approval.domain.ApprovalReqDTO;
import com.geist.approval.domain.ApprovalReqDetailDTO;
import com.geist.approval.domain.ApprovalWriterDTO;
import com.geist.main.domain.Criteria;

/* *
 * 결재 페이지
 * 담당 : 김현선
 */

public interface ApprovalService {
	// 결재 문서 생성 insert
	public int appCreate(ApprovalCreateDTO dto);
	// 결재 요청자 insert
	public int appReqCreate(ApprovalCreateDTO dto);
	// 결재 승인자들 insert
	public void appAgrCreate(ApprovalCreateDTO dto);
	//결재 문서 생성할 작성자 정보 조회 
	public ApprovalWriterDTO appWriter(Long emp_no);
	
	
	// 결재 요청 조회
	public ApprovalReqDTO reqGetList(Criteria cri, Long emp_no);
	// 결재 요청 상세 조회
	public ApprovalReqDetailDTO reqDetail(Long app_no, Long emp_no);

	
	// 결재 승인 조회
	public ApprovalAgrDTO agrGetList(Criteria cri, Long emp_no);
	// 결재 승인 상세 조회
	public ApprovalAgrDetailDTO agrDetail(Long app_no, Long emp_no);
	// 결재 승인자들 조회
	public ApprovalAgrDetailPositionDTO approvers(Long app_no);
	
	
	// 결재 승인 or 반려
	public void appAgree(ApprovalAgrVO agrVo);
	// 결재자들의 결재 여부 확인
	public Long appAgreeChk(Long app_no);
	// 결재자들의 반려 개수 체크
	public int appRejectChk(Long app_no);
	// 최종 승인 상태 update
	public void finalState(Long app_no, int count);
}
