package com.geist.login.mapper;

import com.geist.login.domain.LoginVO;

/* *
 * 로그인 페이지
 * 담당 : 김호영
 */

public interface LoginMapper {
	public LoginVO login(LoginVO vo);
	
	public LoginVO idSearch(LoginVO vo);
	
	public LoginVO pwSearch(LoginVO vo);
}
