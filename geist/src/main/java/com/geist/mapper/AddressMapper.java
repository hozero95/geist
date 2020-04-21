package com.geist.mapper;

import java.util.List;

import com.geist.domain.AddressViewVO;
import com.geist.domain.Criteria;

/* *
 * 주소록 조회 페이지
 * 담당 : 김현선
 */

public interface AddressMapper {
	public List<AddressViewVO> getList();
	
	public List<AddressViewVO> getListWithPaging(Criteria cri);
}
