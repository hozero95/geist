package com.geist.address.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geist.address.domain.AddressDTO;
import com.geist.address.mapper.AddressMapper;
import com.geist.main.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/* *
 * 주소록 조회 페이지
 *	담당 : 김현선
 */

@Service
public class AddressServiceImpl implements AddressService {
	@Setter(onMethod_ = @Autowired)
	private AddressMapper mapper;
	
	@Override
	public AddressDTO getList(Criteria cri) {
		return new AddressDTO(mapper.getCount(cri), mapper.getListWithPaging(cri));
	}
	
	// 주소록에 검색 조건을 선택X, 이름검색이 default
	@Override
	public AddressDTO searchList(Criteria cri) {
		return new AddressDTO(mapper.getCount(cri), mapper.getListWithPaging(cri), cri);
	}
}
