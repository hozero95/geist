package com.geist.joinRequest.service;

import com.geist.joinRequest.domain.JoinRequestPageDTO;
import com.geist.joinRequest.domain.JoinRequestVO;
import com.geist.main.domain.Criteria;

/* *
 * 가입 승인 페이지
 * 담당 : 김호영
 */

public interface JoinRequestService {
	public JoinRequestPageDTO getList(Criteria cri);
	
	public JoinRequestVO getDetail(String req_id);
	
	public JoinRequestVO getAllDetail(String req_id);
	
	public Long getDeptNo(String dept_name);
	
	public int insertEmp(JoinRequestVO vo, String emp_position, Long emp_sal, Long dept_no);
	
	public int deleteRequest(String req_id);
}
