package com.geist.attendance.mapper;

import java.util.List;

import com.geist.attendance.domain.AttendanceVO;

/* *
 * 출결 페이지
 * 담당 : 김호영
 */

public interface AttendanceMapper {
	public List<AttendanceVO> getList(int emp_no);
	
	public int checkOn(int emp_no);
	
	public int checkOff(int emp_no);
	
	public int attendanceOn(AttendanceVO vo);
	
	public int attendanceOff(AttendanceVO vo);
}
