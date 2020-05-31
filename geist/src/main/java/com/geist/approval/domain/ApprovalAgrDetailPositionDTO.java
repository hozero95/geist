package com.geist.approval.domain;

import java.util.List;

import lombok.Data;

@Data
public class ApprovalAgrDetailPositionDTO {
	// 결재 승인자들 조회 -> approvers()
	
	private List<ApprovalAgrDetailPositionVO> approvers;
	
	public ApprovalAgrDetailPositionDTO(List<ApprovalAgrDetailPositionVO> approvers) {
		this.approvers = approvers;
	}
}
