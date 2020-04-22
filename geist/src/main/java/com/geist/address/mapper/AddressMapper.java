package com.geist.address.mapper;

import java.util.List;

import com.geist.address.domain.AddressViewVO;
import com.geist.main.domain.Criteria;

/* *
 * 주소록 조회 페이지
 * 담당 : 김현선
 */

public interface AddressMapper {
	public List<AddressViewVO> getList();
	
	public List<AddressViewVO> getListWithPaging(Criteria cri);
}
