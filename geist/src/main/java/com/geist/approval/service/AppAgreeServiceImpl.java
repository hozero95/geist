package com.geist.approval.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geist.approval.domain.ApprovalAgrDTO;
import com.geist.approval.domain.ApprovalAgrDetailDTO;
import com.geist.approval.domain.ApprovalAgrDetailPositionDTO;
import com.geist.approval.domain.ApprovalAgrVO;
import com.geist.approval.mapper.AppAgreeMapper;
import com.geist.main.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/* *
 * 결재 페이지
 * 담당 : 김현선
 */

@Service
@Log4j
public class AppAgreeServiceImpl implements AppAgreeService {
	@Setter(onMethod_ = @Autowired)
	private AppAgreeMapper mapper;
		
	// sys 계정의 모든 결재 승인 조회
	@Override
	public ApprovalAgrDTO agrAllList(Criteria cri) {
		 return new ApprovalAgrDTO(mapper.agrAllCount(), mapper.agrAllListWithPaging(cri));	
	}
	
	// 결재 승인 조회
	@Override
	public ApprovalAgrDTO agrList(Criteria cri, Long emp_no) {
		return new ApprovalAgrDTO(mapper.argCount(emp_no), mapper.agrListWithPaging(cri, emp_no));	
	}
	
	// 결재 승인 상세 조회
	@Override
	public ApprovalAgrDetailDTO agrDetail(Long app_no, Long emp_no) {
		return mapper.agrDetail(app_no, emp_no);	
	}
	
	// 결재 승인자들 조회
	@Override
	public ApprovalAgrDetailPositionDTO approvers(Long app_no) {
		return new ApprovalAgrDetailPositionDTO(mapper.approvers(app_no));
	}	
	
	// 결재 문서 승인 or 반려
	@Override
	public void appAgree(ApprovalAgrVO agrVo) {
		mapper.appAgree(agrVo);
	}
	
	// 결재자들의 결재 여부 
	@Override
	public Long appAgreeChk(Long app_no) {
		return mapper.appAgreeChk(app_no);
	}
	// 결재자들의 반려 개수 체크
	@Override
	public int appRejectChk(Long app_no) {
		return mapper.appRejectChk(app_no);
	}
	
	// 최종 승인 상태 update
	@Override
	public void finalState(Long app_no, int count) {
		mapper.finalState(app_no, count);
	}	
}

