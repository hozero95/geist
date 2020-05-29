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

import com.geist.approval.domain.ApprovalCreateDTO;
import com.geist.approval.domain.ApprovalWriterDTO;
import com.geist.approval.service.ApprovalService;

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
   public ResponseEntity<String> create(@RequestBody ApprovalCreateDTO dto) {
      log.info("create() 실행");
      service.appCreate(dto);
      service.appReqCreate(dto);
      service.appAgrCreate(dto);
         
      return new ResponseEntity<>("success", HttpStatus.OK);
   }   
   
   // 결재 승인 상세 조회
   @GetMapping(value = "/new/{empNo}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
   public ResponseEntity <ApprovalWriterDTO> admitDetail(@PathVariable("empNo") Long emp_no) {
      log.info("결재 문서 생성할 작성자 정보 조회");
      
      return new ResponseEntity<ApprovalWriterDTO>(service.appWriter(emp_no), HttpStatus.OK);
   }
   
}