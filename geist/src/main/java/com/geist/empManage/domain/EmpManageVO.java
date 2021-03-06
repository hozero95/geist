package com.geist.empManage.domain;

import lombok.Data;

/* *
 * 사원 관리 페이지
 * 담당 : 김호영
 */

@Data
public class EmpManageVO {
	private Long emp_no;
	private String emp_name;
	private String emp_position;
	private String emp_date;
	private String dept_name;
	
	private String emp_id;
	private String emp_pw;
	private String emp_birth;
	private String emp_phone;
	private String emp_tel;
	private String emp_email;
	private String emp_address;
	private Long emp_sal;
}
