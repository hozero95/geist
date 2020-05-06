package com.geist.approval.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geist.approval.domain.ApprovalAgrVO;
import com.geist.approval.domain.ApprovalReqVO;
import com.geist.approval.domain.ApprovalVO;
import com.geist.approval.mapper.ApprovalMapper;
import com.geist.main.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/* *
 * 결재 페이지
 * 담당 : 김현선
 */

@Service
@Log4j
public class ApprovalServiceImpl implements ApprovalService {
	@Setter(onMethod_ = @Autowired)
	private ApprovalMapper mapper;
	
	@Override
	public int appCreate(ApprovalVO vo) {
		return mapper.appCreate(vo);
	}

	@Override
	public List<ApprovalReqVO> appReqCreate(ApprovalVO vo, Long emp_no) {
		return mapper.appReqCreate(vo, emp_no);
	}

	@Override
	public List<ApprovalAgrVO> appAgrCreate(ApprovalVO vo, ApprovalAgrVO agrVo) {
		return mapper.appAgrCreate(vo, agrVo);
	}

	@Override
	public List<ApprovalVO> reqList(Long emp_no) {
		return mapper.reqList(emp_no);		
	}

	@Override
	public List<ApprovalVO> reqListWithPaging(Criteria cri, Long emp_no) {
		return mapper.reqListWithPaging(cri, emp_no);	
	}

	@Override
	public List<ApprovalVO> reqListDetail(Long app_no, Long emp_no) {
		return mapper.reqListDetail(app_no, emp_no);	
	}

	@Override
	public List<ApprovalVO> agreeList(Long emp_no) {
		return mapper.agreeList(emp_no);		
	}

	@Override
	public List<ApprovalVO> agreeListWithPaging(Criteria cri, Long emp_no) {
		return mapper.agreeListWithPaging(cri, emp_no);	
	}

	@Override
	public List<ApprovalVO> agreeListDetail(Long app_no, Long emp_no) {
		return mapper.agreeListDetail(app_no, emp_no);	
	}

}
