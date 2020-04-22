package com.geist.notice.mapper;

import java.util.List;

import com.geist.notice.domain.NoticeVO;

/*
 * 공지 페이지
 * 담당 : 홍예진
 * */

public interface NoticeMapper {
	
	//목록
	public List<NoticeVO> noticeList();
	
	//조회
	public NoticeVO noticeRead(int noti_no);
	
}
