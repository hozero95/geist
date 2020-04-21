package com.geist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.geist.domain.NoticeVO;
import com.geist.mapper.NoticeMapper;

import lombok.Setter;

/*
 * 공지 페이지
 * 담당 : 홍예진
 * */
public class NoticeServiceImpl implements NoticeService {
	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;
	
	@Override
	public List<NoticeVO> noticeList() {
		// TODO Auto-generated method stub
		return mapper.noticeList();
	}

	@Override
	public NoticeVO noticeRead(int noti_no) {
		// TODO Auto-generated method stub
		return mapper.noticeRead(noti_no);
	}

}
