package com.geist.joinRequest.mapper;

import java.util.List;

import com.geist.joinRequest.domain.JoinRequestVO;
import com.geist.main.domain.Criteria;

/* *
 * 가입 승인 페이지
 * 담당 : 김호영
 */

public interface JoinRequestMapper {
	public List<JoinRequestVO> getListWithPaging(Criteria cri);
	
	public int getCount(Criteria cri);
}
