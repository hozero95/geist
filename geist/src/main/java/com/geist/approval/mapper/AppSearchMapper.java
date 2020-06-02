package com.geist.approval.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.geist.approval.domain.ApprovalReqDetailDTO;
import com.geist.approval.domain.ApprovalReqVO;
import com.geist.main.domain.Criteria;

/* *
 * 결재 페이지
 * 담당 : 김현선
 */

public interface AppSearchMapper {
	// sys 계정의 모든 결재 요청 조회
	public List<ApprovalReqVO> reqAllListWithPaging(Criteria cri);
	// 결재 요청 조회
	public List<ApprovalReqVO> reqListWithPaging(
			@Param("cri") Criteria cri, 
			@Param("emp_no") Long emp_no);	
	// 결재 요청 상세 조회
	public ApprovalReqDetailDTO reqDetail(
			@Param("app_no") Long app_no, 
			@Param("emp_no") Long emp_no);
	// sys 계정의 모든 결재 개수 조회
	public int reqAllCount();
	// 결재 요청 개수 조회
	public int reqCount(Long emp_no);
}
