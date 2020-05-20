package com.geist.approval.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ApprovalReqDTO {
	// 리스트 페이징 처리
	private int count;
	private List<ApprovalReqVO> list;
		
	// 결재 조회 getList
	public ApprovalReqDTO(int count, List<ApprovalReqVO> list) {
		this.count = count;
		this.list = list;
	}
}
