package com.geist.approval.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geist.approval.domain.ApprovalAgrDTO;
import com.geist.approval.domain.ApprovalAgrDetailDTO;
import com.geist.approval.domain.ApprovalAgrDetailPositionDTO;
import com.geist.approval.domain.ApprovalAgrVO;
import com.geist.approval.domain.ApprovalCreateDTO;
import com.geist.approval.domain.ApprovalReqDTO;
import com.geist.approval.domain.ApprovalReqDetailDTO;
import com.geist.approval.domain.ApprovalReqVO;
import com.geist.approval.domain.ApprovalDTO;
import com.geist.approval.domain.ApprovalWriterDTO;
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
	
	// 결재 문서 생성 insert
	@Override
	public int appCreate(ApprovalCreateDTO dto) {
		log.info("결재 문서 생성 메서드 실행");
		ApprovalDTO appDto = new ApprovalDTO();
		
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyMMddhhmmss");
		Long appNo = Long.parseLong(dayTime.format(new Date(time)));
		
		dto.setApp_no(appNo);
	
		appDto.setApp_no(dto.getApp_no());
		appDto.setApp_class(dto.getApp_class());
		appDto.setApp_title(dto.getApp_title());
		
		return mapper.appCreate(appDto);
	}
	// 결재 요청자 insert
	@Override
	public int appReqCreate(ApprovalCreateDTO dto) {
		log.info("결재 요청 메서드 실행");
		ApprovalReqVO reqVo = new ApprovalReqVO();
		
		reqVo.setApp_no(dto.getApp_no());
		reqVo.setEmp_no(dto.getEmp_no());
		
		return mapper.appReqCreate(reqVo);
	}
	// 결재승인자들 insert
	@Override
	public void appAgrCreate(ApprovalCreateDTO dto) {	
		log.info("결재 승인 요청 메서드 실행");
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
	//결재 문서 생성할 작성자 정보 조회 
	@Override
	public ApprovalWriterDTO appWriter(Long emp_no) {
		return mapper.appWriter(emp_no);
	}
	
	
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

