package com.geist.address.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geist.address.domain.AddressViewVO;
import com.geist.address.mapper.AddressMapper;
import com.geist.main.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/* *
 * 주소록 조회 페이지
 *	담당 : 김현선
 */

@Service
@Log4j
public class AddressServiceImpl implements AddressService {
	@Setter(onMethod_ = @Autowired)
	private AddressMapper mapper;
	
	@Override
	public List<AddressViewVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}
}
