package com.geist.myPage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geist.myPage.domain.MypageVO;
import com.geist.myPage.mapper.MypageMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/* *
 * 마이페이지
 * 담당 : 김현선
 */

@Service
@Log4j
public class MypageServiceImpl implements MypageService {

	@Setter(onMethod_ = @Autowired)
	private MypageMapper mapper;

	@Override
	public MypageVO get(Long emp_no) {
		return mapper.read(emp_no);
	}

	@Override
	public int modify(MypageVO user) {
		return mapper.update(user);
	}
	
}
