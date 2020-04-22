package com.geist.address.domain;

import lombok.Data;

/* *
 * 주소록 조회 페이지
 * 담당 : 김현선
 */

@Data
public class AddressViewVO {
	private String emp_name;		//이름
	private String emp_email;		//이메일
	private String emp_phone;		//개인 연락처
	private String emp_tel;			//사내 연락처
	private String emp_position;	//직책
	private String dept_no;			//부서명
}
