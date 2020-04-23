package com.geist.joinRequest.domain;

import java.util.List;

import lombok.Data;
import lombok.Getter;

/* *
 * 가입 승인 페이지
 * 담당 : 김호영
 */

@Data
@Getter
public class JoinRequestPageDTO {
	private int count;
	private List<JoinRequestVO> list;
	
	public JoinRequestPageDTO(int count, List<JoinRequestVO> list) {
		this.count = count;
		this.list = list;
	}
}
