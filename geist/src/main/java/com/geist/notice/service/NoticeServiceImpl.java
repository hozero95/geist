package com.geist.notice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geist.main.domain.Criteria;
import com.geist.notice.domain.NoticeDTO;
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
	
	//목록
	@Override
	public NoticeDTO noticeList(Criteria cri) {
		return new NoticeDTO(mapper.noticeCount(), mapper.noticeList(cri));
	}
	//조회
	@Override
	public NoticeVO noticeRead(int noti_no) {
		// TODO Auto-generated method stub
		return mapper.noticeRead(noti_no);
	}

	//작성
	@Override
	public void noticeWrite(NoticeVO vo) {
		// TODO Auto-generated method stub
		log.info("NoticeService noticeWrite()");
		mapper.noticeWrite(vo);
	}
	
	//수정
	@Override
	public int noticeUpdate(NoticeVO vo) {
		// TODO Auto-generated method stub
		log.info("NoticeService noticeUpdate()");
		return mapper.noticeUpdate(vo);
		}
	
	//삭제
	@Override
	public void noticeDelete(int noti_no) {
		// TODO Auto-generated method stub
		log.info("NoticeService noticeDelete()");
		mapper.noticeDelete(noti_no);
	}

}
