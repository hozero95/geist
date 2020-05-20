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
@RequestMapping("/approvalRequest/*")
@AllArgsConstructor
@Log4j
public class AppRequestController {
	private ApprovalService service;
	
	// 결재 문서 생성
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ApprovalWholeDTO dto) {
		log.info("create() 실행");
		service.appCreate(dto);
		service.appReqCreate(dto);
		service.appAgrCreate(dto);
			
		return new ResponseEntity<>("success", HttpStatus.OK);
	}	
	
}