package com.geist.approval.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.geist.approval.domain.ApprovalAgrDetailDTO;
import com.geist.approval.domain.ApprovalAgrDetailPositionVO;
import com.geist.approval.domain.ApprovalAgrVO;
import com.geist.approval.domain.ApprovalReqDetailDTO;
import com.geist.approval.domain.ApprovalReqVO;
import com.geist.approval.domain.ApprovalDTO;
import com.geist.approval.domain.ApprovalWriterDTO;
import com.geist.main.domain.Criteria;

/* *
 * 결재 페이지
 * 담당 : 김현선
 */

public interface AppRequestMapper {
	
	// 결재 문서 생성 insert
	public int appCreate(ApprovalDTO appDto);
	// 결재 요청자 insert
	public int appReqCreate(ApprovalReqVO reqVo);
	// 결재 승인자들 insert
	public void appAgrCreate(@Param("agrVo") ApprovalAgrVO agrVo, @Param("emp_no") Long emp_no);
	//결재 문서 생성할 작성자 정보 조회 
	public ApprovalWriterDTO appWriter(Long emp_no);
	
}
