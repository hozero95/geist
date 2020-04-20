package com.geist.domain;

import java.util.Date;

import lombok.Data;

/* *
 * 출결 페이지 - 출결 내역 조회(Main)
 * 담당 : 김호영
 */

@Data
public class AttendanceViewVO {
	private Date cal_date;
	private Date att_on;
	private Date att_off;
	private Long att_status;
}
