package com.geist.notice.service;

import com.geist.main.domain.Criteria;
import com.geist.notice.domain.NoticeDTO;
import com.geist.notice.domain.NoticeVO;

/*
 * 공지 페이지
 * 담당 : 홍예진
 * */
public interface NoticeService {
	
	//목록(페이징처리 추가)
	public NoticeDTO noticeList(Criteria cri);
	
	//조회
	public NoticeVO noticeRead(int noti_no);
	
	//작성
	public void noticeWrite(NoticeVO vo);
	
	//수정
	public int noticeUpdate(NoticeVO vo);
	
	//삭제
	public void noticeDelete(int noti_no);
	
}
