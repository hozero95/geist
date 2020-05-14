package com.geist.myPage.service;

import com.geist.myPage.domain.MypageDTO;

/* *
 * 마이페이지
 * 담당 : 김현선
 */

public interface MypageService {

	public MypageDTO get(Long emp_no);
	
	public int modify(MypageDTO user);
}
