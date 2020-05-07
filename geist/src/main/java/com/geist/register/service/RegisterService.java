package com.geist.register.service;

import com.geist.register.domain.RegisterVO;

public interface RegisterService {
	public int checkId(String req_id);
	
	public int joinRequest(RegisterVO vo);
}
