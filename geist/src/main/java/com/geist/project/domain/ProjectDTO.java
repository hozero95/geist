package com.geist.project.domain;

import java.util.List;

import lombok.Data;

@Data
public class ProjectDTO {
	private int count;
	private List<ProjectVO> list;
	
	public ProjectDTO(int count, List<ProjectVO> list) {
		this.count = count;
		this.list = list;
	}
}
