package com.geist.service;

import java.util.List;

import com.geist.domain.AttendanceViewVO;

/* *
 * 출결 페이지
 * 담당 : 김호영
 */

public interface AttendanceService {
	public List<AttendanceViewVO> getList(int emp_no);
	
	public int attendanceOn(AttendanceViewVO vo);
}
