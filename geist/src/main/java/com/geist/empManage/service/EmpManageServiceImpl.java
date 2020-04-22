package com.geist.empManage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geist.empManage.domain.EmpManagePageDTO;
import com.geist.empManage.mapper.EmpManageMapper;
import com.geist.main.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/* *
 * 사원 관리 페이지
 * 담당 : 김호영
 */

@Service
@Log4j
public class EmpManageServiceImpl implements EmpManageService {
	@Setter(onMethod_ = @Autowired)
	private EmpManageMapper mapper;
	
	@Override
	public EmpManagePageDTO getList(Criteria cri) {
		return new EmpManagePageDTO(mapper.getCount(cri), mapper.getListWithPaging(cri));
	}

	@Override
	public EmpManagePageDTO searchList(Criteria cri) {
		return new EmpManagePageDTO(mapper.getCount(cri), mapper.getListWithPaging(cri), cri);
	}
}
