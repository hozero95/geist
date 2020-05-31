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

public interface ApprovalMapper {
	// 결재 문서 생성 insert
	public int appCreate(ApprovalDTO appDto);
	// 결재 요청자 insert
	public int appReqCreate(ApprovalReqVO reqVo);
	// 결재 승인자들 insert
	public void appAgrCreate(@Param("agrVo") ApprovalAgrVO agrVo, @Param("emp_no") Long emp_no);
	//결재 문서 생성할 작성자 정보 조회 
	public ApprovalWriterDTO appWriter(Long emp_no);
	
	
	// 결재 요청 조회
	public List<ApprovalReqVO> reqListWithPaging(
			@Param("cri") Criteria cri, 
			@Param("emp_no") Long emp_no);	
	// 결재 요청 상세 조회
	public ApprovalReqDetailDTO reqDetail(
			@Param("app_no") Long app_no, 
			@Param("emp_no") Long emp_no);
	
	
	// 결재 승인 조회
	public List<ApprovalAgrVO> admitListWithPaging(
			@Param("cri") Criteria cri, 
			@Param("emp_no") Long emp_no);	
	// 결재 승인 상세 조회
	public ApprovalAgrDetailDTO admitDetail(
			@Param("app_no") Long app_no, 
			@Param("emp_no") Long emp_no);
	// 결재 승인자들 조회
	public List<ApprovalAgrDetailPositionVO> approvers(Long app_no);
	
	
	// 결재 요청 개수 조회
	public int reqGetCount(Long emp_no);
	// 결재 요청 개수 조회
	public int argGetCount(Long emp_no);
	
	
	// 결재 승인 or 반려
	public void appAdmit(ApprovalAgrVO agrVo);
	// 결재자들의 결재 여부 확인 
	public Long appAdmitChk(Long app_no);
	// 결재자들의 반려 개수 체크
	public int appRejectChk(Long app_no);
	// 최종 승인 상태 update
	public void finalState(
			@Param("app_no") Long app_no, 
			@Param("count") int count);
}
