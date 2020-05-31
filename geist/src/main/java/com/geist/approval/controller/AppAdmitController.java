package com.geist.approval.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.geist.approval.domain.ApprovalAgrDTO;
import com.geist.approval.domain.ApprovalAgrDetailDTO;
import com.geist.approval.domain.ApprovalAgrDetailPositionDTO;
import com.geist.approval.domain.ApprovalAgrVO;
import com.geist.approval.service.ApprovalService;
import com.geist.main.domain.Criteria;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/* *
 * 결재 페이지
 * 담당 : 김현선
 */

@RestController
@RequestMapping("/approvalAdmit/*")
@AllArgsConstructor
@Log4j
public class AppAdmitController {

	private ApprovalService service;
	
	// 결재 승인 조회	
	@GetMapping(value = "/{page}/{empNo}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity <ApprovalAgrDTO> admitList(@PathVariable("page") int page, @PathVariable("empNo") Long emp_no) {
		Criteria cri = new Criteria(page, 10);
		return new ResponseEntity<ApprovalAgrDTO>(service.admitGetList(cri, emp_no), HttpStatus.OK);
	}
	// 결재 승인 상세 조회
	@GetMapping(value = "/detail/{appNo}/{empNo}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity <ApprovalAgrDetailDTO> admitDetail(@PathVariable("appNo") Long app_no, @PathVariable("empNo") Long emp_no) {
		log.info("결재 상세보기");
		
		return new ResponseEntity<ApprovalAgrDetailDTO>(service.admitDetail(app_no, emp_no), HttpStatus.OK);
	}
	// 결재 승인자들 조회
	@GetMapping(value = "/detailApprovers/{appNo}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity <ApprovalAgrDetailPositionDTO> approvers(@PathVariable("appNo") Long app_no) {
		log.info("결재 승인자들 조회");
		
		return new ResponseEntity<ApprovalAgrDetailPositionDTO>(service.approvers(app_no), HttpStatus.OK);
	}
	// 결재 승인 or 반려
	@PostMapping(value = "/admit", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> appAdmit(@RequestBody ApprovalAgrVO agrVo) {
		// 승인 or 반려 
		service.appAdmit(agrVo);
		
		// 모든 결재자들이 승인 or 반려를 했다면 문서 번호 리턴
		Long app_no = service.appAdmitChk(agrVo.getApp_no());
		log.info("모든 결재자들이 승인한 문서? === " + app_no);
		
		if(app_no != null) {
			log.info("모든 결재자들이 승인한 문서!!! === " + app_no);
			
			// 결재자 중 반려를 체크해서 반려 개수 반환
			int count = service.appRejectChk(agrVo.getApp_no()) == 0 ? 2 : 3;
			agrVo.setCount(count);
			
			// 반려 숫자 개수가 0이면 최종상태를 2로, 1개 이상이라면 최종상태를 3으로 업데이트 
			service.finalState(agrVo.getApp_no(), agrVo.getCount());			
		}
		
		return new ResponseEntity<>("success", HttpStatus.OK);
	}		
}
