package com.geist.domain;

import lombok.Data;

/* *
 * 사원 관리 페이지 - 사원 조회(Main)
 * 담당 : 김호영
 */

@Data
public class EmpViewTableVO {
	private Long emp_no;
	private String emp_name;
	private String emp_position;
	private String emp_date;
	private Long dept_no;
}
