package com.geist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geist.domain.AttendanceViewVO;
import com.geist.mapper.AttendanceMapper;

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
	public List<AttendanceViewVO> getList(int emp_no) {
		return mapper.getList(emp_no);
	}

	@Override
	public int attendanceOn(AttendanceViewVO vo) {
		if(mapper.checkOn(vo) > 0) {
			return 0;
		}
		return mapper.attendanceOn(vo);
	}
}
