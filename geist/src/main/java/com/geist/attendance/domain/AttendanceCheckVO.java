package com.geist.attendance.domain;

import lombok.Data;

/* *
 * 출결 페이지
 * 담당 : 김호영
 */

@Data
public class AttendanceCheckVO {
	private int checkOn;
	private int checkOff;
}
