package com.geist.project.domain;
/*
 * 프로젝트 페이지
 * 담당: 홍예진
 * */
public class ProjectCriVO {
	
	private int pageNum;
	private int amount;
	private int dept_no;
	
	public ProjectCriVO() {
		this(1, 10, 0);
	}
	
	public ProjectCriVO(int pageNum, int amount, int dept_no) {		
		this.pageNum = pageNum;
		this.amount = amount;
		this.dept_no = dept_no;
	}
	
	
}
