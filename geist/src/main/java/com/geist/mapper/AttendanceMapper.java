package com.geist.mapper;

import java.util.List;

import com.geist.domain.AttendanceViewVO;

/* *
 * 출결 페이지
 * 담당 : 김호영
 */

public interface AttendanceMapper {
	public List<AttendanceViewVO> getList(int emp_no);
	
	public int attendanceOn(AttendanceViewVO vo);
	
	public int checkOn(AttendanceViewVO vo);
}
