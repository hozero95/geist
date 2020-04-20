package com.geist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geist.domain.Criteria;
import com.geist.domain.EmpViewTableVO;
import com.geist.mapper.EmpManageMapper;

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
	public List<EmpViewTableVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}
}
