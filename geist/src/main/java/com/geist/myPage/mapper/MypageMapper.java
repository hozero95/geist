package com.geist.myPage.mapper;

import com.geist.myPage.domain.MypageVO;

/* *
 * 마이페이지
 * 담당 : 김현선
 */

public interface MypageMapper {

	public MypageVO read(Long emp_no);
	
	public int update(MypageVO user);
}
