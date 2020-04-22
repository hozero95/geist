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
	
//	@Test
	public void getList() {
		Long targetNo = 106L;
		List<ApprovalVO> approvalView = mapper.getList(targetNo);
		approvalView.forEach(list -> log.info(list));
	}
	
	@Test
	public void paging() {
		Criteria cri = new Criteria();
		Long targetNo = 106L;
		List<ApprovalVO> list = mapper.getListWithPaging(cri, targetNo);
		list.forEach(table -> log.info(table));
	}
}
