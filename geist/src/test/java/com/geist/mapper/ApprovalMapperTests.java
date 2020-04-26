package com.geist.mapper;

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
	public void getList() {
		Long targetNo = 106L;
		Long targetNo2 = 101L;	//부장의 사원번호, app_agree 테이블용
		String tableName = "app_request";
		String tableName2 = "app_agree";
		
//		List<ApprovalVO> list = mapper.getList(targetNo);
		List<ApprovalVO> list = mapper.getList(tableName, targetNo);
		list.forEach(table -> log.info(table));
	}
	
//	@Test
	public void paging() {
		Long targetNo = 106L;
		Long targetNo2 = 101L;	//부장의 사원번호, app_agree 테이블용 
		String tableName = "app_request";
		String tableName2 = "app_agree";
		
		Criteria cri = new Criteria();
		List<ApprovalVO> list = mapper.getListWithPaging(cri, tableName2, targetNo2);
		list.forEach(table -> log.info(table));
	}
	
//	@Test
	public void getListDetail() {
		Long appNo = 100L;
		Long empNo = 106L;
		String tableName = "app_request";
		String tableName2 = "app_agree";
		
		List<ApprovalVO> list = mapper.getListDetail(tableName, appNo, empNo);
		list.forEach(table -> log.info(table));
	}
	
//	@Test
	public void create() {
		ApprovalVO vo = new ApprovalVO();
		
		vo.setApp_class(1L);
		vo.setApp_title("주간업무 보고서");
		vo.setApp_date("2020/05/15");
		
		mapper.create(vo);
	}
	
//	@Test
	public void request() {
		Long appNo = 117L;
		Long empNo = 105L;
		
		mapper.appRequest(appNo, empNo);
	}
	
//	@Test
	public void agree() {
		Long status = 2L;
		Long appNo = 105L;
		Long empNo = 101L;
		
		mapper.agree(status, appNo, empNo);
	}
}






