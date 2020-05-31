package com.geist.approval.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ApprovalAgrDTO {	
	// 결재 승인 조회 -> admitGetList()
	
	private int count;
	private List<ApprovalAgrVO> list;

	// 결재 승인 조회 
	public ApprovalAgrDTO(int count, List<ApprovalAgrVO> list) {
		this.count = count;
		this.list = list;
	}
}
