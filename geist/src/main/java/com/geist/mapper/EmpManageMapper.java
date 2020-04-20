package com.geist.mapper;

import java.util.List;

import com.geist.domain.Criteria;
import com.geist.domain.EmpViewTableVO;

/* *
 * 사원 관리 페이지
 * 담당 : 김호영
 */

public interface EmpManageMapper {
	public List<EmpViewTableVO> getList();
	
	public List<EmpViewTableVO> getListWithPaging(Criteria cri);
}
