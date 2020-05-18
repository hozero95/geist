package com.geist.approval.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.geist.approval.domain.ApprovalVO;
import com.geist.approval.service.ApprovalService;
import com.geist.login.domain.LoginVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
//@RequestMapping("/approvalAdmit/detail/*")
@AllArgsConstructor
@Log4j
public class AppAdmitDetailController {
	
//	@GetMapping(value = "/detail/{appNo}/{empNo}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
//	public ResponseEntity <ApprovalVO> agreeListDetail(@PathVariable("appNo") Long app_no, @PathVariable("empNo") Long emp_no) {
//		return new ResponseEntity<ApprovalVO>(service.agreeListDetail(app_no, emp_no), HttpStatus.OK);
//	}
	
//	@PostMapping(value = "/login", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
//	public ResponseEntity<String> login(@RequestBody LoginVO vo, HttpServletRequest req){
//		log.info("vo : " + vo);
//		
//		HttpSession session = req.getSession();
//		LoginVO login = service.login(vo);
//		String result = "";
//		
//		if(login == null) {
//			session.setAttribute("member", null);
//			result = "fail";
//		}
//		else {
//			session.setAttribute("member", login);
//			result = "success";
//		}
//		log.info("session : " + session);
//		
//		return new ResponseEntity<String>(result, HttpStatus.OK);
//	}
	
//	@GetMapping(value = "/{appClass}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
//	public String appClass(@PathVariable("appClass") int appClass) {
//		log.info("결재 승인 상세 페이지 이동");
//		
//		int app_class = appClass;
//		
//		switch(app_class){
//		case 1:
//			return "/page/re-weekly-doc";
//		case 2:
//			return "/page/re-leave-doc";
//		case 3:
//			return "/page/re-resignation-doc";
//		default:
//			log.info("제대로 실행되지 않음!@");
//			return null;
//		}
//	}
}
