package com.geist.myPage.domain;

import java.util.Date;

import lombok.Data;

/* *
 * 마이페이지
 * 담당 : 김현선
 * 
 * 사원번호, 생년월일, 아이디, 비밀번호, 비밀번호 확인, 개인 연락처, 사내 연락처, 주소
 */

@Data
public class MypageDTO {
	private Long emp_no;
	private String emp_id;
	private String emp_pw;
	private String emp_name;
	private String emp_birth;
	private String emp_phone;		
	private String emp_tel;			
	private String emp_address;	
	private String emp_position;
	private Long emp_sal;
	private String emp_date;
	private Long dept_no;
	private String dept_name;
}
