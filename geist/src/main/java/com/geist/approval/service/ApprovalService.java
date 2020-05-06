package com.geist.approval.service;

import java.util.List;

import com.geist.approval.domain.ApprovalAgrVO;
import com.geist.approval.domain.ApprovalReqVO;
import com.geist.approval.domain.ApprovalVO;
import com.geist.main.domain.Criteria;

/* *
 * 결재 페이지
 * 담당 : 김현선
 */

public interface ApprovalService {
	
	// 결재 작성(생성)
	public int appCreate(ApprovalVO vo);
	
	// 결재요청
	public List<ApprovalReqVO> appReqCreate(ApprovalVO vo, Long emp_no);
	
	// 결재승인
	public List<ApprovalAgrVO> appAgrCreate(ApprovalVO vo, ApprovalAgrVO agrVo);
	
	// 결재 조회
	public List<ApprovalVO> reqList(Long emp_no);
	public List<ApprovalVO> reqListWithPaging(Criteria cri, Long emp_no);
	public List<ApprovalVO> reqListDetail(Long app_no, Long emp_no);

	// 결재 승인 조회
	public List<ApprovalVO> agreeList(Long emp_no);
	public List<ApprovalVO> agreeListWithPaging(Criteria cri, Long emp_no);
	public List<ApprovalVO> agreeListDetail(Long app_no, Long emp_no);
}
