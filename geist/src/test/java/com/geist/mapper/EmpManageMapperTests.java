package com.geist.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.geist.domain.Criteria;
import com.geist.domain.EmpViewTableVO;

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
	
//	@Test
	public void getListTest() {
		List<EmpViewTableVO> empViewTable = mapper.getList();
		for(EmpViewTableVO table : empViewTable) {
			log.info(table);
		}
	}
	
	@Test
	public void pagingTest() {
		Criteria cri = new Criteria();
		List<EmpViewTableVO> list = mapper.getListWithPaging(cri);
		list.forEach(table -> log.info(table));
	}
}
