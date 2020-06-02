package com.geist.approval.service;

import com.geist.approval.domain.ApprovalAgrDTO;
import com.geist.approval.domain.ApprovalAgrDetailDTO;
import com.geist.approval.domain.ApprovalAgrDetailPositionDTO;
import com.geist.approval.domain.ApprovalAgrVO;
import com.geist.main.domain.Criteria;

/* *
 * 결재 페이지
 * 담당 : 김현선
 */

public interface AppAgreeService {
	
	// sys 계정의 모든 결재 승인 조회
	public ApprovalAgrDTO agrAllList(Criteria cri);
	// 결재 승인 조회
	public ApprovalAgrDTO agrList(Criteria cri, Long emp_no);
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
