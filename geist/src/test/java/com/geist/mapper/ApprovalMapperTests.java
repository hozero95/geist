package com.geist.mapper;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.geist.approval.domain.ApprovalAgrVO;
import com.geist.approval.domain.ApprovalReqVO;
import com.geist.approval.domain.ApprovalVO;
import com.geist.approval.domain.ApprovalCreateDTO;
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
	
//	@Test
	public void date() {
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("yyMMddhhmmss");
		Long appNo = Long.parseLong(dayTime.format(new Date(time)));

		System.out.println("dayTime = " + appNo);
	}

//	@Test
	public void create() {
		ApprovalVO avo = new ApprovalVO();
		
		avo.setApp_no(2005071061L);
		avo.setApp_class(1L);
		avo.setApp_title("주간업무 보고서");
		
		mapper.appCreate(avo);
	}
	
//	@Test
	public void request() {
		ApprovalReqVO reqVo = new ApprovalReqVO();
		
		reqVo.setApp_no(2005071061L);
		reqVo.setEmp_no(106L);
		
		mapper.appReqCreate(reqVo);
	}
	
	@Test
	public void agreeReq() {
//		ApprovalWholeDTO dto = new ApprovalWholeDTO();		
		ApprovalAgrVO agrVo = new ApprovalAgrVO();
//		List<ApprovalAgrVO> list = dto.getManager_no();
		
//		for(int i = 0; i < list.size(); i++) {
//			log.info(list.get(i).getClass().getName());
		
//			agrVo.setEmp_no(Long.parseLong(list.get(i)));
//		}

//		agrVo.setApp_no(2005071061L);
//		agrVo.setEmp_no(101L);
//	
//		mapper.appAgrCreate(agrVo);
	}
	
//	@Test
	public void finalState() {
		Long appNo = 100L;
		
		mapper.finalState(appNo);
	}
	
	
//	@Test
	public void reqList() {
		Long targetNo = 106L;
		
//		List<ApprovalVO> list = mapper.reqList(targetNo);
//		list.forEach(table -> log.info(table));
	}
	
//	@Test
	public void reqListWithPaging() {
		Long targetNo = 106L;
		
		Criteria cri = new Criteria();
//		List<ApprovalVO> list = mapper.reqListWithPaging(cri, targetNo);
//		list.forEach(table -> log.info(table));
	}
	
//	@Test
	public void reqListDetail() {
		Long appNo = 100L;
		Long empNo = 106L;
		
//		List<ApprovalVO> list = mapper.reqListDetail(appNo, empNo);
//		list.forEach(table -> log.info(table));
	}
	
}