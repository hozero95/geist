package com.geist.approval.domain;

import lombok.Data;

@Data
public class ApprovalWriterDTO {
	//결재 문서 생성할 작성자 정보 조회 -> appWriter()
	private String dept_name;
	private String emp_position;
	private String emp_name;
}
