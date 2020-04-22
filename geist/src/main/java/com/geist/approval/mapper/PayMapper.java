package com.geist.approval.mapper;

import java.util.List;

import com.geist.approval.domain.PayVO;
import com.geist.main.domain.Criteria;

/* *
 * 결재 페이지
 * 담당 : 김현선
 */

public interface PayMapper {
	// 결재 조회
	public List<PayVO> getList();
	
	public List<PayVO> getListWithPaging(Criteria cri);
	
	// 결제 요청
	public int request(PayVO pay); 
	
	// 결제 승인
	public int pay(Long agr_status);
}
