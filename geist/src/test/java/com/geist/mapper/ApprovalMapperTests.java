package com.geist.mapper;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.geist.approval.domain.ApprovalVO;
import com.geist.approval.mapper.ApprovalMapper;
import com.geist.main.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/* *
 * 결재 조회 페이지
 *	담당 : 김현선
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ApprovalMapperTests {
	@Setter(onMethod_ = @Autowired)
	private ApprovalMapper mapper;
	
	@Test
	public void date() {
//		Date date = new Date();
//		System.out.println(date);
		
		long time = System.currentTimeMillis(); 

		SimpleDateFormat dayTime = new SimpleDateFormat("yyMMddhhmmss");
		Long str = Long.parseLong(dayTime.format(new Date(time)));

		System.out.println("dayTime = " + str);
	}

//	@Test
	public void create() {
		ApprovalVO vo = new ApprovalVO();
		
//		vo.setApp_no(2005071061L);
//		vo.setApp_class(1L);
		vo.setApp_title("주간업무 보고서");
//		vo.setApp_date("sysdate");
		
//		mapper.appCreate(vo);
	}
	
//	@Test
	public void request() {
//		Long appNo = 117L;
//		Long empNo = 105L;
		
		ApprovalVO vo = new ApprovalVO();
		
		vo.setApp_no(2005071061L);
		Long empNo = 106L;
		
//		mapper.appReqCreate(vo, empNo);
	}
	
//	@Test
	public void agreeReq() {
//		Long status = 1L;
//		Long appNo = 106L;
//		Long empNo = 101L;
		
		ApprovalVO vo = new ApprovalVO();

		vo.setApp_no(2005071061L);
		Long manager_no = 101L;		
	
//		mapper.appAgrCreate(vo, manager_no);
	}
	
//	@Test
	public void finalState() {
		Long appNo = 100L;
		
		mapper.finalState(appNo);
	}
	
	
//	@Test
	public void reqList() {
		Long targetNo = 106L;
		
		List<ApprovalVO> list = mapper.reqList(targetNo);
		list.forEach(table -> log.info(table));
	}
	
//	@Test
	public void reqListWithPaging() {
		Long targetNo = 106L;
		
		Criteria cri = new Criteria();
		List<ApprovalVO> list = mapper.reqListWithPaging(cri, targetNo);
		list.forEach(table -> log.info(table));
	}
	
//	@Test
	public void reqListDetail() {
		Long appNo = 100L;
		Long empNo = 106L;
		
		List<ApprovalVO> list = mapper.reqListDetail(appNo, empNo);
		list.forEach(table -> log.info(table));
	}
	
}






