package com.geist.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.geist.address.domain.AddressViewVO;
import com.geist.address.mapper.AddressMapper;
import com.geist.main.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/* *
 * 주소록 조회 페이지
 *	담당 : 김현선
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AddressMapperTests {
	@Setter(onMethod_ = @Autowired)
	private AddressMapper mapper;
	
//	@Test
	public void getList() {
		List<AddressViewVO> addressView = mapper.getList();
//		for(AddressViewVO view : addressView) {
//			log.info(view);
//		}
		addressView.forEach(list -> log.info(list));
	}
	
	@Test
	public void paging() {
		Criteria cri = new Criteria();
		List<AddressViewVO> list = mapper.getListWithPaging(cri);
		list.forEach(table -> log.info(table));
	}
}
