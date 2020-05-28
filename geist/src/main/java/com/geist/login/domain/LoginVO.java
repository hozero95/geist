package com.geist.login.domain;

import lombok.Data;

/* *
 * 로그인 페이지
 * 담당 : 김호영
 */

@Data
public class LoginVO {
	Long emp_no;
	String emp_id;
	String emp_pw;
	String emp_phone;
	String emp_email;
	String emp_position;
}
