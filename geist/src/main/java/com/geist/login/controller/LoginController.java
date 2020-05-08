package com.geist.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.geist.login.domain.LoginVO;
import com.geist.login.service.LoginService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/* *
 * 로그인 페이지
 * 담당 : 김호영
 */

@RestController
@RequestMapping("/login/*")
@AllArgsConstructor
@Log4j
public class LoginController {
	private LoginService service;
	
	@PostMapping(value = "/login", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> login(@RequestBody LoginVO vo, HttpServletRequest req){
		log.info("vo : " + vo);
		
		HttpSession session = req.getSession();
		LoginVO login = service.login(vo);
		String result = "";
		
		if(login == null) {
			session.setAttribute("member", null);
			result = "fail";
		}
		else {
			session.setAttribute("member", login);
			result = "success";
		}
		log.info("session : " + session);
		
		return new ResponseEntity<String>(result, HttpStatus.OK);
	}
	
	@PostMapping(value = "/idSearch", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> idSearch(@RequestBody LoginVO vo){
		log.info("vo : " + vo);
		LoginVO id = service.idSearch(vo);
		String result = "";
		
		if(id == null) {
			result = "fail";
		}
		else {
			result = id.getEmp_id();
		}
		log.info("result : " + result);
		
		return new ResponseEntity<String>(result, HttpStatus.OK);
	}
	
	@PostMapping(value = "/pwSearch", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> pwSearch(@RequestBody LoginVO vo){
		log.info("vo : " + vo);
		LoginVO pw = service.pwSearch(vo);
		String result = "";
		
		if(pw == null) {
			result = "fail";
		}
		else {
			result = pw.getEmp_pw();
		}
		log.info("result : " + result);
		
		return new ResponseEntity<String>(result, HttpStatus.OK);
	}
}
