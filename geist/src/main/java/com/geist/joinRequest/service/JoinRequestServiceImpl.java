package com.geist.joinRequest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geist.joinRequest.domain.JoinRequestPageDTO;
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
}
