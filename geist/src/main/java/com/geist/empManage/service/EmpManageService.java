package com.geist.empManage.service;

import java.util.List;

import com.geist.empManage.domain.EmpManageViewVO;
import com.geist.main.domain.Criteria;

/* *
 * 사원 관리 페이지
 * 담당 : 김호영
 */

public interface EmpManageService {
	public List<EmpManageViewVO> getList(Criteria cri);
}
