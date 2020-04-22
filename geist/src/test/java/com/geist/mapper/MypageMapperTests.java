package com.geist.mapper;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.geist.myPage.domain.MypageVO;
import com.geist.myPage.mapper.MypageMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/* *
 * 마이페이지
 * 담당 : 김현선
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MypageMapperTests {
	@Setter(onMethod_ = @Autowired)
	private MypageMapper mapper;
	
//	@Test
	public void read() {
		Long targetEmpNo = 101L;
		MypageVO vo = mapper.read(targetEmpNo);
		
		log.info(vo);
	}
	
//	@Test
	public void update() {
		Long targetEmpNo = 101L;
		MypageVO vo = mapper.read(targetEmpNo);
		vo.setEmp_pw("aaa83");
		vo.setEmp_phone("010-0000-0002");
		vo.setEmp_tel("02-321-1002");
		vo.setEmp_address("부천시 원미구");
		
		int count = mapper.update(vo);
		log.info("업데이트 :  " + count);
	}
}
