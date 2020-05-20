package com.geist.approval.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ApprovalAgrDetailDTO {	
	private String dept_name;
	private String emp_position;
	private String emp_name;
	private String app_title;
	private String app_date;
//	private List<ApprovalAgrDetailPositionDTO> approvers;

//	// 결재승인자들 insert
//	@Override
//	public void appAgrCreate(ApprovalWholeDTO dto) {	
//		log.info("결재 승인 요청 메서드 실행");
//		ApprovalAgrVO agrVo = new ApprovalAgrVO();
//		List<ApprovalAgrVO> list = dto.getManager_no();
//		
//		for(int i = 0; i < list.size(); i++) {
//			agrVo.setApp_no(dto.getApp_no());
//			agrVo.setEmp_position(list.get(i).getEmp_position());
//			
//			log.info("list.size() === " + list.size());
//			log.info("vo.getEmp_no() === " + dto.getEmp_no());
//			log.info("vo.getApp_no() === " + dto.getApp_no());
//			log.info("agrVo.getApp_no() === " + agrVo.getApp_no());
//			log.info("list.get(i).getEmp_position() === " + list.get(i).getEmp_position());
//			
//			mapper.appAgrCreate(agrVo, dto.getEmp_no());
//		}
//	}
}

