package com.geist.project.domain;

public class ProjectCriVO {
	
	private int pageNum;
	private int amount;
	private int dept_no;
	
	private String type;
	private String keyword;
	
	public ProjectCriVO() {
		this(1, 10);
	}
	
	public ProjectCriVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
