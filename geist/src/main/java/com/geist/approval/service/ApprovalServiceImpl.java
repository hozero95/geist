package com.geist.approval.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geist.approval.domain.ApprovalAgrVO;
import com.geist.approval.domain.ApprovalReqVO;
import com.geist.approval.domain.ApprovalVO;
import com.geist.approval.domain.ApprovalWholeDTO;
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
	public int appCreate(ApprovalWholeDTO vo) {
		ApprovalVO avo = new ApprovalVO();
		
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyMMddhhmmss");
		Long appNo = Long.parseLong(dayTime.format(new Date(time)));
		
		vo.setApp_no(appNo);
	
		avo.setApp_no(vo.getApp_no());
		avo.setApp_class(vo.getApp_class());
		avo.setApp_title(vo.getApp_title());
		
		return mapper.appCreate(avo);
	}

	@Override
	public int appReqCreate(ApprovalWholeDTO vo) {
		ApprovalReqVO reqVo = new ApprovalReqVO();
		
//		log.info("vo.getApp_no() = " + vo.getApp_no());
		
		reqVo.setApp_no(vo.getApp_no());
		reqVo.setEmp_no(vo.getEmp_no());
		
		return mapper.appReqCreate(reqVo);
	}

	@Override
	public void appAgrCreate(ApprovalWholeDTO vo) {	
		ApprovalAgrVO agrVo = new ApprovalAgrVO();
		List<ApprovalAgrVO> list = vo.getManager_no();
		
		for(int i = 0; i < list.size(); i++) {
			agrVo.setApp_no(vo.getApp_no());
			agrVo.setEmp_position(list.get(i).getEmp_position());
			
			log.info("list.size() === " + list.size());
			log.info("vo.getEmp_no() === " + vo.getEmp_no());
			log.info("vo.getApp_no() === " + vo.getApp_no());
			log.info("agrVo.getApp_no() === " + agrVo.getApp_no());
			log.info("list.get(i).getEmp_position() === " + list.get(i).getEmp_position());
			
			mapper.appAgrCreate(agrVo, vo.getEmp_no());
		}
	}
	
	@Override
	public void appAgree(ApprovalAgrVO agrVo) {
		mapper.appAgree(agrVo);
	}
	
	@Override
	public void finalState(Long app_no) {
		mapper.finalState(app_no);
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