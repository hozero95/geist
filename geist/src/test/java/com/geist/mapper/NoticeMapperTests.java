package com.geist.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.geist.main.domain.Criteria;
import com.geist.notice.domain.NoticeVO;
import com.geist.notice.mapper.NoticeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/*
 * 공지 테스트 
 * 담당 : 홍예진
 * 
 * 공지 작성(write)테스트는 notice_seq 생성 이후 가능
 * 목록, 조회, 수정 ,삭제 매퍼 테스트 완료
 * */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;
	
	//목록
	@Test
	public void noticeList() {
		Criteria cri = new Criteria();
		List<NoticeVO> notice = mapper.noticeList(cri);
		notice.forEach(list -> log.info(list));
	}
	
	//조회
	@Test
	public void noticeRead() {
		int noti_no = 3;
		mapper.noticeRead(noti_no);
		log.info(noti_no);
	}
	
	//수정
	@Test
	public void noticeUpdate() {
		//내용 수정
		NoticeVO notice = new NoticeVO();
		notice.setNoti_no(3);
		notice.setNoti_title("수정된 제목");
		notice.setNoti_content("수정된 내용");
		
		//수정값을 mapper에 적용시킴
		mapper.noticeUpdate(notice);
		
		//수정시켰던 3번의 내용 junit으로 출력
		int noti_no = 3;
		mapper.noticeRead(noti_no);
		log.info(noti_no);
	}
}
