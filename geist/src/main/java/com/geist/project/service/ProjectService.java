package com.geist.project.service;

import com.geist.main.domain.Criteria;
import com.geist.project.domain.ProjectDTO;
import com.geist.project.domain.ProjectVO;

/*
 * 프로젝트
 * 담당 : 홍예진
 * */

public interface ProjectService {
	
	public ProjectDTO projectAllList(Criteria cri);

	public ProjectDTO projectList(Criteria cri, int dept_no);
	
	public ProjectVO projectRead(int proj_no);
	
	public void projectWrite(ProjectVO vo);
	
	public void projectMWrite(ProjectVO vo);
	
	public int projectUpdate(ProjectVO vo);
	
	public int projectDelete(int proj_no);
	
	public int projectDept(Long emp_no);
	
	public int projectCount(int dept_no);
}
