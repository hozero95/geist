package com.geist.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geist.main.domain.Criteria;
import com.geist.notice.domain.NoticeVO;
import com.geist.notice.mapper.NoticeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/*
 * 공지 페이지
 * 담당 : 홍예진
 * */
@Service
@Log4j
public class NoticeServiceImpl implements NoticeService {
	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;
	
	@Override
	public List<NoticeVO> noticeList(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.noticeList(cri);
	}

	@Override
	public NoticeVO noticeRead(int noti_no) {
		// TODO Auto-generated method stub
		return mapper.noticeRead(noti_no);
	}

}
