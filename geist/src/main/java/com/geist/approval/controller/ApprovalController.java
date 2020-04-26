package com.geist.approval.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.geist.approval.domain.ApprovalVO;
import com.geist.approval.service.ApprovalService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/* *
 * 결재 페이지
 * 담당 : 김현선
 */

@RestController
@RequestMapping("/approval")
@AllArgsConstructor
@Log4j
public class ApprovalController {
	private ApprovalService service;

//	@GetMapping(value = "/{table}/{emp_no}", consumes = "application/json", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
//	public ResponseEntity <List<ApprovalVO>> getList(@PathVariable("table") String table, @PathVariable("emp_no") Long emp_no) {
//		return new ResponseEntity<>(service.getList(table, emp_no), HttpStatus.OK);
//	}
}
