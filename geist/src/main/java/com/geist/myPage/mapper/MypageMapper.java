package com.geist.myPage.mapper;

import com.geist.myPage.domain.MypageDTO;

/* *
 * 마이페이지
 * 담당 : 김현선
 */

public interface MypageMapper {
	public MypageDTO read(Long emp_no);
	
	public int modify(MypageDTO dto);
}
