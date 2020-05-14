package com.geist.approval.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geist.approval.domain.ApprovalAgrDTO;
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
	public int appCreate(ApprovalWholeDTO dto) {
		ApprovalVO avo = new ApprovalVO();
		
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyMMddhhmmss");
		Long appNo = Long.parseLong(dayTime.format(new Date(time)));
		
		dto.setApp_no(appNo);
	
		avo.setApp_no(dto.getApp_no());
		avo.setApp_class(dto.getApp_class());
		avo.setApp_title(dto.getApp_title());
		
		return mapper.appCreate(avo);
	}

	@Override
	public int appReqCreate(ApprovalWholeDTO dto) {
		ApprovalReqVO reqVo = new ApprovalReqVO();
		
//		log.info("vo.getApp_no() = " + vo.getApp_no());
		
		reqVo.setApp_no(dto.getApp_no());
		reqVo.setEmp_no(dto.getEmp_no());
		
		return mapper.appReqCreate(reqVo);
	}

	@Override
	public void appAgrCreate(ApprovalWholeDTO dto) {	
		ApprovalAgrVO agrVo = new ApprovalAgrVO();
		List<ApprovalAgrVO> list = dto.getManager_no();
		
		for(int i = 0; i < list.size(); i++) {
			agrVo.setApp_no(dto.getApp_no());
			agrVo.setEmp_position(list.get(i).getEmp_position());
			
			log.info("list.size() === " + list.size());
			log.info("vo.getEmp_no() === " + dto.getEmp_no());
			log.info("vo.getApp_no() === " + dto.getApp_no());
			log.info("agrVo.getApp_no() === " + agrVo.getApp_no());
			log.info("list.get(i).getEmp_position() === " + list.get(i).getEmp_position());
			
			mapper.appAgrCreate(agrVo, dto.getEmp_no());
		}
	}
	
	@Override
	public void appAdmit(ApprovalAgrVO agrVo) {
		mapper.appAdmit(agrVo);
	}
	
	@Override
	public void finalState(Long app_no) {
		mapper.finalState(app_no);
	}

	@Override
	public ApprovalWholeDTO reqListWithPaging(Criteria cri, Long emp_no) {
		return new ApprovalWholeDTO(mapper.getCount(emp_no), mapper.reqListWithPaging(cri, emp_no), cri);
	}

	@Override
	public List<ApprovalVO> reqListDetail(Long app_no, Long emp_no) {
		return mapper.reqListDetail(app_no, emp_no);	
	}

	@Override
	public ApprovalAgrDTO agreeListWithPaging(Criteria cri, Long emp_no) {
		return new ApprovalAgrDTO(mapper.getCount(emp_no), mapper.agreeListWithPaging(cri, emp_no));	
	}

//	@Override
//	public List<ApprovalVO> agreeListDetail(Long app_no, Long emp_no) {
//		return mapper.agreeListDetail(app_no, emp_no);	
//	}
	
	@Override
	public ApprovalVO agreeListDetail(Long app_no, Long emp_no) {
		return mapper.agreeListDetail(app_no, emp_no);	
	}

}