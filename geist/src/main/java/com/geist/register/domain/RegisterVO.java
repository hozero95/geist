package com.geist.register.domain;

import lombok.Data;

@Data
public class RegisterVO {
	private String req_id;
	private String req_pw;
	private String req_name;
	private String req_birth;
	private String req_phone;
	private String req_email;
	private String req_address;
}
