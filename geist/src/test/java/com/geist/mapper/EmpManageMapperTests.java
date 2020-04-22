package com.geist.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.geist.empManage.domain.EmpManageViewVO;
import com.geist.empManage.mapper.EmpManageMapper;
import com.geist.main.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/* *
 * 사원 관리 페이지
 * 담당 : 김호영
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class EmpManageMapperTests {
	@Setter(onMethod_ = @Autowired)
	private EmpManageMapper mapper;
	
	@Test
	public void pagingTest() {
		Criteria cri = new Criteria();
		List<EmpManageViewVO> list = mapper.getListWithPaging(cri);
		list.forEach(table -> log.info(table));
	}
}
