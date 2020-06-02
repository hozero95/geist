package com.geist.approval.service;

import com.geist.approval.domain.ApprovalReqDTO;
import com.geist.approval.domain.ApprovalReqDetailDTO;
import com.geist.main.domain.Criteria;

/* *
 * 결재 페이지
 * 담당 : 김현선
 */

public interface AppSearchService {
	
	// sys 계정의 모든 결재 요청 조회
	public ApprovalReqDTO reqAllList(Criteria cri);
	// 결재 요청 조회
	public ApprovalReqDTO reqList(Criteria cri, Long emp_no);
	// 결재 요청 상세 조회
	public ApprovalReqDetailDTO reqDetail(Long app_no, Long emp_no);

}
