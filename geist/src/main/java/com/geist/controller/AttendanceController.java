package com.geist.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.geist.domain.AttendanceViewVO;
import com.geist.service.AttendanceService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/* *
 * 출결 페이지
 * 담당 : 김호영
 */

@RestController
@RequestMapping("/attendance/*")
@AllArgsConstructor
@Log4j
public class AttendanceController {
	private AttendanceService service;
	
	@GetMapping(value = "/{emp_no}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<List<AttendanceViewVO>> getList(@PathVariable("emp_no") int emp_no) {
		return new ResponseEntity<List<AttendanceViewVO>>(service.getList(emp_no), HttpStatus.OK);
	}
	
	@PostMapping(value = "/on", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> attendanceOn(@RequestBody AttendanceViewVO vo){
		int onCount = service.attendanceOn(vo);
		return onCount == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
