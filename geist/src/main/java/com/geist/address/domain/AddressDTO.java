package com.geist.address.domain;

import java.util.List;

import com.geist.empManage.domain.EmpManageVO;
import com.geist.main.domain.Criteria;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class AddressDTO {
	private String keyword;
	private int count;
	private List<AddressVO> list;
	
	public AddressDTO(int count, List<AddressVO> list) {
		this.count = count;
		this.list = list;
	}
	
	public AddressDTO(int count, List<AddressVO> list, Criteria cri) {
		this.count = count;
		this.list = list;
		this.keyword = cri.getKeyword();
	}
}
