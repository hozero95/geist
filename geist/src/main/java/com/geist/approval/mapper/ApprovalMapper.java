package com.geist.approval.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.geist.approval.domain.ApprovalAgrVO;
import com.geist.approval.domain.ApprovalReqVO;
import com.geist.approval.domain.ApprovalVO;
import com.geist.main.domain.Criteria;

/* *
 * 결재 페이지
 * 담당 : 김현선
 */

public interface ApprovalMapper {
	// 결재 작성(생성)
	public int appCreate(ApprovalVO vo);
		
	// 결재요청
	public int appReqCreate(ApprovalReqVO reqVo);
		
	// 결재승인
	public int appAgrCreate(ApprovalAgrVO agrVo);
		
	// 최종 상태
	public void finalState(Long app_no);

	
	// 결재 조회
	public List<ApprovalVO> reqList(Long emp_no);	
	
	// 결재 조회 페이징
	public List<ApprovalVO> reqListWithPaging(
			@Param("cri") Criteria cri, 
			@Param("emp_no") Long emp_no);
	
	// 결재 상세 조회
	public List<ApprovalVO> reqListDetail(
			@Param("app_no") Long app_no, 
			@Param("emp_no") Long emp_no);
	
	// 결재 승인 조회
	public List<ApprovalVO> agreeList(Long emp_no);	
	
	// 결재 승인 페이징
	public List<ApprovalVO> agreeListWithPaging(
			@Param("cri") Criteria cri, 
			@Param("emp_no") Long emp_no);
	
	// 결재 상세 조회
	public List<ApprovalVO> agreeListDetail(
			@Param("app_no") Long app_no, 
			@Param("emp_no") Long emp_no);

}