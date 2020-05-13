package com.geist.address.service;

import com.geist.address.domain.AddressDTO;
import com.geist.main.domain.Criteria;

/* *
 * 주소록 조회 페이지
 *	담당 : 김현선
 */

public interface AddressService {
	public AddressDTO getList(Criteria cri);
	
	// 주소록에 검색 조건을 선택X, 이름검색이 default
	public AddressDTO searchList(Criteria cri);
	
}
