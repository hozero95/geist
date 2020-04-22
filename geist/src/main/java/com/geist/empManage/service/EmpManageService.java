package com.geist.empManage.service;

import com.geist.empManage.domain.EmpManagePageDTO;
import com.geist.main.domain.Criteria;

/* *
 * 사원 관리 페이지
 * 담당 : 김호영
 */

public interface EmpManageService {
	public EmpManagePageDTO getList(Criteria cri);
	
	public EmpManagePageDTO searchList(Criteria cri);
}
