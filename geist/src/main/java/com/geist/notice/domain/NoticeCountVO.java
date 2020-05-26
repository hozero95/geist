/* 공지페이지
  담당: 홍예진
 */
package com.geist.notice.domain;

import java.util.List;

import com.geist.main.domain.Criteria;

import lombok.Data;

@Data
public class NoticeCountVO {

	private int count;
	private List<NoticeVO> cri2;
	
		public NoticeCountVO(int count, List<NoticeVO> cri2) {
			// TODO Auto-generated constructor stub
			this.count = count;
			this.cri2 = cri2;
		}

		public NoticeCountVO() {
			// TODO Auto-generated constructor stub
		}
	}
