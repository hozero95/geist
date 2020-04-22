package com.geist.empManage.domain;

import java.util.List;

import com.geist.main.domain.Criteria;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class EmpManagePageDTO {
	private String type;
	private String keyword;
	private int count;
	private List<EmpManageVO> list;
	
	public EmpManagePageDTO(int count, List<EmpManageVO> list) {
		this.count = count;
		this.list = list;
	}
	
	public EmpManagePageDTO(int count, List<EmpManageVO> list, Criteria cri) {
		this.count = count;
		this.list = list;
		this.type = cri.getType();
		this.keyword = cri.getKeyword();
	}
}
