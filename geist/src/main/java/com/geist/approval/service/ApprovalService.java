package com.geist.approval.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.geist.approval.domain.ApprovalVO;
import com.geist.main.domain.Criteria;

/* *
 * 결재 페이지
 * 담당 : 김현선
 */

public interface ApprovalService {
	
	public List<ApprovalVO> getList(String table, Long emp_no);

	public List<ApprovalVO> getListWithPaging(
			@Param("cri") Criteria cri, 
			@Param("table") String table, 
			@Param("emp_no") Long emp_no);
	
	// 결재 상세 조회
	public List<ApprovalVO> getListDetail(
			@Param("table") String table, 
			@Param("app_no") Long app_no, 
			@Param("emp_no") Long emp_no);

	// 결재 작성(생성)
	public int create(ApprovalVO vo);
	
	// 결재요청
	public void appRequest(
			@Param("app_no") Long app_no, 
			@Param("emp_no") Long emp_no);
	
	// 결재승인
	public void agree(
			@Param("agr_status") Long agr_status, 
			@Param("app_no") Long app_no, 
			@Param("emp_no") Long emp_no);
}
