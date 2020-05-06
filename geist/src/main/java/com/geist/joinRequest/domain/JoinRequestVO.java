package com.geist.joinRequest.domain;

import lombok.Data;

/* *
 * 가입 승인 페이지
 * 담당 : 김호영
 */

@Data
public class JoinRequestVO {
	private String req_id;
	private String req_pw;
	private String req_name;
	private String req_birth;
	private String req_phone;
	private String req_email;
	private String req_address;
}
