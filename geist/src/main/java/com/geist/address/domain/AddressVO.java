package com.geist.address.domain;

import lombok.Data;

/* *
 * 주소록 조회 페이지
 * 담당 : 김현선
 */

@Data
public class AddressVO {
	private String emp_name;		
	private String emp_email;		
	private String emp_phone;		
	private String emp_tel;			
	private String emp_position;	
	private String dept_name;			
}
