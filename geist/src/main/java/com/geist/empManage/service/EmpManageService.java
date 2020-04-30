package com.geist.empManage.service;

import com.geist.empManage.domain.EmpManagePageDTO;
import com.geist.empManage.domain.EmpManageVO;
import com.geist.main.domain.Criteria;

/* *
 * 사원 관리 페이지
 * 담당 : 김호영
 */

public interface EmpManageService {
	public EmpManagePageDTO getList(Criteria cri);
	
	public EmpManagePageDTO searchList(Criteria cri);
	
	public EmpManageVO detailView(Long emp_no);
	
	public int modifyEmp(EmpManageVO vo);
	
	public int deleteEmp(Long emp_no);
}
