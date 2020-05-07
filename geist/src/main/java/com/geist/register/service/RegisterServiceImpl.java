package com.geist.register.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geist.register.domain.RegisterVO;
import com.geist.register.mapper.RegisterMapper;

import lombok.Setter;

@Service
public class RegisterServiceImpl implements RegisterService {
	@Setter(onMethod_ = @Autowired)
	private RegisterMapper mapper;
	
	@Override
	public int checkId(String req_id) {
		return mapper.checkId(req_id);
	}

	@Override
	public int joinRequest(RegisterVO vo) {
		return mapper.joinRequest(vo);
	}
}
