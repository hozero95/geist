package com.geist.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geist.project.domain.ProjectCriVO;
import com.geist.project.domain.ProjectDTO;
import com.geist.project.domain.ProjectVO;
import com.geist.project.mapper.ProjectMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/*
 * 프로젝트
 * 담당 : 홍예진
 * */
@Service
@Log4j
public class ProjectServiceImpl implements ProjectService {

	@Setter(onMethod_ = @Autowired)
	private ProjectMapper mapper;
	
	@Override
	public ProjectDTO projectList(ProjectCriVO vo){
		// TODO Auto-generated method stub
		return new ProjectDTO(mapper.projectCount(), mapper.projectList(vo));
	}

	@Override
	public ProjectVO projectRead(int proj_no) {
		// TODO Auto-generated method stub
		return mapper.projectRead(proj_no);
	}
	
	@Override
	public void projectWrite(ProjectVO vo) {
		// TODO Auto-generated method stub
		log.info("ProjectService projectWrite()");
		mapper.projectWrite(vo);
	}
	
	@Override
	public void projectMWrite(ProjectVO vo) {
		// TODO Auto-generated method stub
		log.info("ProjectService projectMWrite()");
		mapper.projectMWrite(vo);
	}
	
	@Override
	public int projectUpdate(ProjectVO vo) {
		// TODO Auto-generated method stub
		log.info("ProjectService projectUpdate()");
		return mapper.projectUpdate(vo);
	}

	@Override
	public int projectDelete(int proj_no) {
		// TODO Auto-generated method stub
		log.info("ProjectService projectDelete()");
		return mapper.projectDelete(proj_no);
	}

	@Override
	public int projectDept(Long emp_no) {
		// TODO Auto-generated method stub
		log.info("ProjecService projectDept()");
		return mapper.projectDept(emp_no);
	}

}
