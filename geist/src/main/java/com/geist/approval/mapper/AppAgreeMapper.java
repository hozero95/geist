package com.geist.approval.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.geist.approval.domain.ApprovalAgrDetailDTO;
import com.geist.approval.domain.ApprovalAgrDetailPositionVO;
import com.geist.approval.domain.ApprovalAgrVO;
import com.geist.main.domain.Criteria;


/* *
 * 결재 페이지
 * 담당 : 김현선
 */

public interface AppAgreeMapper {
	
	// sys 계정의 모든 결재 승인 조회
	public List<ApprovalAgrVO> agrAllListWithPaging(Criteria cri);
	// 결재 승인 조회
	public List<ApprovalAgrVO> agrListWithPaging(
			@Param("cri") Criteria cri, 
			@Param("emp_no") Long emp_no);	
	// 결재 승인 상세 조회
	public ApprovalAgrDetailDTO agrDetail(
			@Param("app_no") Long app_no, 
			@Param("emp_no") Long emp_no);
	// 결재 승인자들 조회
	public List<ApprovalAgrDetailPositionVO> approvers(Long app_no);
	// sys 계정의 모든 결재 승인 개수 조회
	public int agrAllCount();
	// 결재 승인 개수 조회
	public int argCount(Long emp_no);
	// 결재 승인 or 반려
	public void appAgree(ApprovalAgrVO agrVo);
	// 결재자들의 결재 여부 확인 
	public Long appAgreeChk(Long app_no);
	// 결재자들의 반려 개수 체크
	public int appRejectChk(Long app_no);
	// 최종 승인 상태 update
	public void finalState(
			@Param("app_no") Long app_no, 
			@Param("count") int count);
}
