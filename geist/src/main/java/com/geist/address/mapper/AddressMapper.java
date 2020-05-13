package com.geist.address.mapper;

import java.util.List;

import com.geist.address.domain.AddressVO;
import com.geist.main.domain.Criteria;

/* *
 * 주소록 조회 페이지
 * 담당 : 김현선
 */

public interface AddressMapper {		
	public int getCount(Criteria cri);
	
	public List<AddressVO> getListWithPaging(Criteria cri);
	
	
}
