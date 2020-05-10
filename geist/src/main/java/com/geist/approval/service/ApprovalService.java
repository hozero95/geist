package com.geist.approval.service;

import java.util.List;

import com.geist.approval.domain.ApprovalAgrVO;
import com.geist.approval.domain.ApprovalVO;
import com.geist.approval.domain.ApprovalWholeDTO;
import com.geist.main.domain.Criteria;

/* *
 * 결재 페이지
 * 담당 : 김현선
 */

public interface ApprovalService {
	// 결재문서 생성 insert
	public int appCreate(ApprovalWholeDTO vo);
	
	// 결재요청자 insert
	public int appReqCreate(ApprovalWholeDTO vo);
	
	// 결재승인자들 insert
	public void appAgrCreate(ApprovalWholeDTO vo);
	
	// 결재 승인, 반려
	public void appAgree(ApprovalAgrVO agrVo);
	
	// 최종 상태 update
	public void finalState(Long app_no);
	
	// 결재 조회
	public List<ApprovalVO> reqList(Long emp_no);
	public List<ApprovalVO> reqListWithPaging(Criteria cri, Long emp_no);
	public List<ApprovalVO> reqListDetail(Long app_no, Long emp_no);

	// 결재 승인 조회
	public List<ApprovalVO> agreeList(Long emp_no);
	public List<ApprovalVO> agreeListWithPaging(Criteria cri, Long emp_no);
	public List<ApprovalVO> agreeListDetail(Long app_no, Long emp_no);
}