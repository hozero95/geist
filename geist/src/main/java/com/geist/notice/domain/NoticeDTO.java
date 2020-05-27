/* 공지페이지
  담당: 홍예진
 */
package com.geist.notice.domain;

import java.util.List;

import com.geist.main.domain.Criteria;

import lombok.Data;

@Data
public class NoticeDTO {
	private int count;
	private List<NoticeVO> list;
	
	public NoticeDTO(int count, List<NoticeVO> list) {
		this.count = count;
		this.list = list;
	}
}
