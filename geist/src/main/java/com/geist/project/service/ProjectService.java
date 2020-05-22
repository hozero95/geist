package com.geist.project.service;

import java.util.List;

import com.geist.project.domain.ProjectCriVO;
import com.geist.project.domain.ProjectVO;

/*
 * 프로젝트
 * 담당 : 홍예진
 * */

public interface ProjectService {

	public List<ProjectVO> projectList(ProjectCriVO vo);
	
	public ProjectVO projectRead(int proj_no);
	
	public void projectWrite(ProjectVO vo);
	
	public void projectMWrite(ProjectVO vo);
	
	public int projectUpdate(ProjectVO vo);
	
	public int projectDelete(int proj_no);
	
	public int projectDept(Long emp_no);
}
