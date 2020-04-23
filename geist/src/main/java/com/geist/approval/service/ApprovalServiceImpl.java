package com.geist.approval.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<ApprovalVO> getList(String table, Long emp_no) {
		return mapper.getList(table, emp_no);		
	}

	@Override
	public List<ApprovalVO> getListWithPaging(Criteria cri, String table, Long emp_no) {
		return null;
	}

	@Override
	public List<ApprovalVO> getListDetail(String table, Long app_no, Long emp_no) {
		return null;
	}

	@Override
	public int create(ApprovalVO vo) {
		return 0;
	}

	@Override
	public void appRequest(Long app_no, Long emp_no) {
		
	}

	@Override
	public void agree(Long agr_status, Long app_no, Long emp_no) {
		
	}

}
