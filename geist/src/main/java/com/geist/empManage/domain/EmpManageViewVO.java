package com.geist.empManage.domain;

import java.util.Date;

import lombok.Data;

/* *
 * 사원 관리 페이지 - 사원 조회(Main)
 * 담당 : 김호영
 */

@Data
public class EmpManageViewVO {
	private Long emp_no;
	private String emp_name;
	private String emp_position;
	private Date emp_date;
	private Long dept_no;
}
