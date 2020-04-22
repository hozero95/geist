package com.geist.notice.service;

import java.util.List;

import com.geist.main.domain.Criteria;
import com.geist.notice.domain.NoticeVO;

/*
 * 공지 페이지
 * 담당 : 홍예진
 * */
public interface NoticeService {
	
	//목록(페이징처리 추가)
	public List<NoticeVO> noticeList(Criteria cri);
	
	//조회
	public NoticeVO noticeRead(int noti_no);
}
