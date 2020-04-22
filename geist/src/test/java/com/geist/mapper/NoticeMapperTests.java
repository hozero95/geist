package com.geist.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.geist.notice.domain.NoticeVO;
import com.geist.notice.mapper.NoticeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/*
 * 공지 테스트 
 * 담당 : 홍예진
 * */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;
	
	@Test
	public void noticeList() {
		List<NoticeVO> notice = mapper.noticeList();
		notice.forEach(list -> log.info(list));
	}
	
	@Test
	public void noticeRead() {
		int noti_no = 3;
		mapper.noticeRead(noti_no);
		log.info(noti_no);
	}
}
