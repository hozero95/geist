package com.geist.register.mapper;

import com.geist.register.domain.RegisterVO;

public interface RegisterMapper {
	public int checkId(String req_id);
	
	public int joinRequest(RegisterVO vo);
}
