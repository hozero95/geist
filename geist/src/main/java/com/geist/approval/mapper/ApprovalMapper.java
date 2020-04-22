package com.geist.approval.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.geist.approval.domain.ApprovalVO;
import com.geist.main.domain.Criteria;

/* *
 * 결재 페이지
 * 담당 : 김현선
 */

public interface ApprovalMapper {
	// 결재 조회
	public List<ApprovalVO> getList(Long emp_no);
	
	public List<ApprovalVO> getListWithPaging(@Param("cri") Criteria cri, @Param("emp_no") Long emp_no);
	
	// 결제 요청
	public int request(ApprovalVO pay); 
	
	// 결제 승인
	public int pay(Long agr_status);
}
