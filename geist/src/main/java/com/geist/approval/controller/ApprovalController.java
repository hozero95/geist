package com.geist.approval.controller;

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

import com.geist.approval.domain.ApprovalAgrVO;
import com.geist.approval.domain.ApprovalVO;
import com.geist.approval.domain.ApprovalWholeDTO;
import com.geist.approval.service.ApprovalService;
import com.geist.main.domain.Criteria;

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
	
	// 결재 작성
	@PostMapping(value = "/request/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ApprovalWholeDTO vo) {
		service.appCreate(vo);
		service.appReqCreate(vo);
		service.appAgrCreate(vo);
			
		return new ResponseEntity<>("success", HttpStatus.OK);
	}	
	
	// 결재 승인, 반려
	@PostMapping(value = "/request/agree", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> agree(@RequestBody ApprovalAgrVO agrVo) {
		service.appAgree(agrVo);
		service.finalState(agrVo.getApp_no());
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}	

	// 결재 조회
	@GetMapping(value = "/request/{empNo}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity <List<ApprovalVO>> reqList(@PathVariable("empNo") Long emp_no) {
		return new ResponseEntity<>(service.reqList(emp_no), HttpStatus.OK);
	}
	
	@GetMapping(value = "/request/{page}/{empNo}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity <List<ApprovalVO>> reqListWithPaging(@PathVariable("page") int page, @PathVariable("empNo") Long emp_no) {
		Criteria cri = new Criteria(page, 10);
		return new ResponseEntity<>(service.reqListWithPaging(cri, emp_no), HttpStatus.OK);
	}
	
	@GetMapping(value = "/request/detail/{appNo}/{empNo}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity <List<ApprovalVO>> reqListDetail(@PathVariable("appNo") Long app_no, @PathVariable("empNo") Long emp_no) {
		return new ResponseEntity<>(service.reqListDetail(app_no, emp_no), HttpStatus.OK);
	}
	
	// 결재 승인 조회
	@GetMapping(value = "/agree/{empNo}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity <List<ApprovalVO>> agreeList(@PathVariable("empNo") Long emp_no) {
		return new ResponseEntity<>(service.agreeList(emp_no), HttpStatus.OK);
	}
	
	@GetMapping(value = "/agree/{page}/{empNo}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity <List<ApprovalVO>> agreeListWithPaging(@PathVariable("page") int page, @PathVariable("empNo") Long emp_no) {
		Criteria cri = new Criteria(page, 10);
		return new ResponseEntity<>(service.agreeListWithPaging(cri, emp_no), HttpStatus.OK);
	}
	
	@GetMapping(value = "/agree/detail/{appNo}/{empNo}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity <List<ApprovalVO>> agreeListDetail(@PathVariable("appNo") Long app_no, @PathVariable("empNo") Long emp_no) {
		return new ResponseEntity<>(service.agreeListDetail(app_no, emp_no), HttpStatus.OK);
	}
}