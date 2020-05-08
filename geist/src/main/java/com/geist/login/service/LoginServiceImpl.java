package com.geist.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geist.login.domain.LoginVO;
import com.geist.login.mapper.LoginMapper;

import lombok.Setter;

/* *
 * 로그인 페이지
 * 담당 : 김호영
 */

@Service
public class LoginServiceImpl implements LoginService {
	@Setter(onMethod_ = @Autowired)
	LoginMapper mapper;

	@Override
	public LoginVO login(LoginVO vo) {
		return mapper.login(vo);
	}

	@Override
	public LoginVO idSearch(LoginVO vo) {
		return mapper.idSearch(vo);
	}

	@Override
	public LoginVO pwSearch(LoginVO vo) {
		return mapper.pwSearch(vo);
	}
}
