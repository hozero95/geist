package com.geist.joinRequest.service;

import com.geist.joinRequest.domain.JoinRequestPageDTO;
import com.geist.main.domain.Criteria;

/* *
 * 가입 승인 페이지
 * 담당 : 김호영
 */

public interface JoinRequestService {
	public JoinRequestPageDTO getList(Criteria cri);
}
