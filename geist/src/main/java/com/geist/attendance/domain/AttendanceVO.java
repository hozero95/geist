package com.geist.attendance.domain;

import lombok.Data;

/* *
 * 출결 페이지
 * 담당 : 김호영
 */

@Data
public class AttendanceVO {
	private Long emp_no;
	private String cal_date;
	private String att_on;
	private String att_off;
	private Long att_status;
}
