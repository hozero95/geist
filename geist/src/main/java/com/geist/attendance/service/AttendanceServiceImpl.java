package com.geist.attendance.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geist.attendance.domain.AttendanceVO;
import com.geist.attendance.mapper.AttendanceMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/* *
 * 출결 페이지
 * 담당 : 김호영
 */

@Service
@Log4j
public class AttendanceServiceImpl implements AttendanceService {
	@Setter(onMethod_ = @Autowired)
	private AttendanceMapper mapper;
	
	@Override
	public List<AttendanceVO> getList(int emp_no) {
		return mapper.getList(emp_no);
	}
	
	@Override
	public int checkOn(int emp_no) {
		return mapper.checkOn(emp_no);
	}

	@Override
	public int checkOff(int emp_no) {
		return mapper.checkOff(emp_no);
	}

	@Override
	public int attendanceOn(AttendanceVO vo) {
		return mapper.attendanceOn(vo);
	}

	@Override
	public int attendanceOff(AttendanceVO vo) {
		return mapper.attendanceOff(vo);
	}
}
