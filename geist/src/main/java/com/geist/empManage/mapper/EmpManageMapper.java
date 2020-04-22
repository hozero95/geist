package com.geist.empManage.mapper;

import java.util.List;

import com.geist.empManage.domain.EmpManageViewVO;
import com.geist.main.domain.Criteria;

/* *
 * 사원 관리 페이지
 * 담당 : 김호영
 */

public interface EmpManageMapper {
	public List<EmpManageViewVO> getListWithPaging(Criteria cri);
}
