package com.geist.approval.domain;

import java.util.List;

import lombok.Data;

@Data
public class ApprovalAgrDetailPositionDTO {
	private List<ApprovalAgrDetailPositionVO> approvers;
	
	public ApprovalAgrDetailPositionDTO(List<ApprovalAgrDetailPositionVO> approvers) {
		this.approvers = approvers;
	}
}
