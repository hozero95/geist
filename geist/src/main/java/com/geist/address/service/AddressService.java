package com.geist.address.service;

import java.util.List;

import com.geist.address.domain.AddressViewVO;
import com.geist.main.domain.Criteria;

/* *
 * 주소록 조회 페이지
 *	담당 : 김현선
 */

public interface AddressService {
	public List<AddressViewVO> getList(Criteria cri);
}
