package com.geist.approval.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geist.approval.domain.ApprovalReqDTO;
import com.geist.approval.domain.ApprovalReqDetailDTO;
import com.geist.approval.mapper.AppSearchMapper;
import com.geist.main.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/* *
 * 결재 페이지
 * 담당 : 김현선
 */

@Service
@Log4j
public class AppSearchServiceImpl implements AppSearchService {
	@Setter(onMethod_ = @Autowired)
	private AppSearchMapper mapper;
	
	// sys 계정의 모든 결재 요청 조회
	@Override
	public ApprovalReqDTO reqAllList(Criteria cri) {
		return new ApprovalReqDTO(mapper.reqAllCount(), mapper.reqAllListWithPaging(cri));
	}
	
	// 결재 요청 조회
	@Override
	public ApprovalReqDTO reqList(Criteria cri, Long emp_no) {
		return new ApprovalReqDTO(mapper.reqCount(emp_no), mapper.reqListWithPaging(cri, emp_no));
	}
	
	// 결재 요청 상제 조회
	@Override
	public ApprovalReqDetailDTO reqDetail(Long app_no, Long emp_no) {
		return mapper.reqDetail(app_no, emp_no);	
	}
}

