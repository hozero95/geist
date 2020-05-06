package com.geist.joinRequest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geist.joinRequest.domain.JoinRequestPageDTO;
import com.geist.joinRequest.domain.JoinRequestVO;
import com.geist.joinRequest.mapper.JoinRequestMapper;
import com.geist.main.domain.Criteria;

import lombok.Setter;

/* *
 * 가입 승인 페이지
 * 담당 : 김호영
 */

@Service
public class JoinRequestServiceImpl implements JoinRequestService {
	@Setter(onMethod_ = @Autowired)
	private JoinRequestMapper mapper;
	
	@Override
	public JoinRequestPageDTO getList(Criteria cri) {
		return new JoinRequestPageDTO(mapper.getCount(cri), mapper.getListWithPaging(cri));
	}

	@Override
	public JoinRequestVO getDetail(String req_id) {
		return mapper.getDetail(req_id);
	}
	
	@Override
	public JoinRequestVO getAllDetail(String req_id) {
		return mapper.getAllDetail(req_id);
	}

	@Override
	public Long getDeptNo(String dept_name) {
		return mapper.getDeptNo(dept_name);
	}

	@Override
	public int insertEmp(JoinRequestVO vo, String emp_position, Long emp_sal, Long dept_no) {
		return mapper.insertEmp(vo, emp_position, emp_sal, dept_no);
	}

	@Override
	public int deleteRequest(String req_id) {
		return mapper.deleteRequest(req_id);
	}
}
