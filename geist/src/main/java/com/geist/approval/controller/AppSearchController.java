package com.geist.approval.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.geist.approval.domain.ApprovalReqDTO;
import com.geist.approval.domain.ApprovalReqDetailDTO;
import com.geist.approval.service.AppSearchService;
import com.geist.main.domain.Criteria;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/* *
 * 결재 발신함 페이지
 * 담당 : 김현선
 */

@RestController
@RequestMapping("/approvalSearch/*")
@AllArgsConstructor
@Log4j
public class AppSearchController {
	private AppSearchService service;
	
	// sys 계정의 모든 결재 요청 조회
	@GetMapping(value = "/allList/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity <ApprovalReqDTO> reqAllList(@PathVariable("page") int page) {
		Criteria cri = new Criteria(page, 10);
		log.info("page === " + page);
		return new ResponseEntity<ApprovalReqDTO>(service.reqAllList(cri), HttpStatus.OK);
	}
	
	// 결재 요청 조회
	@GetMapping(value = "/{page}/{empNo}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity <ApprovalReqDTO> reqList(@PathVariable("page") int page, @PathVariable("empNo") Long emp_no) {
		Criteria cri = new Criteria(page, 10);
		log.info("page === " + page);
		return new ResponseEntity<ApprovalReqDTO>(service.reqList(cri, emp_no), HttpStatus.OK);
	}
	
	// 결재 요청 상세 조회
	@GetMapping(value = "/detail/{appNo}/{empNo}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity <ApprovalReqDetailDTO> reqDetail(@PathVariable("appNo") Long app_no, @PathVariable("empNo") Long emp_no) {
		return new ResponseEntity<ApprovalReqDetailDTO>(service.reqDetail(app_no, emp_no), HttpStatus.OK);
	}
}
