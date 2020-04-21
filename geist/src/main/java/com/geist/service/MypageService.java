package com.geist.service;

import com.geist.domain.MypageVO;

/* *
 * 마이페이지
 * 담당 : 김현선
 */

public interface MypageService {

	public MypageVO get(Long emp_no);
	
	public int modify(MypageVO user);
}
