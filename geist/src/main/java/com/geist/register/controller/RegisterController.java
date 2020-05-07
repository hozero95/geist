package com.geist.register.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.geist.register.domain.RegisterVO;
import com.geist.register.service.RegisterService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/register/*")
@AllArgsConstructor
@Log4j
public class RegisterController {
	private RegisterService service;
	
	@GetMapping(value = "/{req_id}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<Boolean> checkId(@PathVariable("req_id") String req_id){
		log.info("req_id" + req_id);
		boolean result = false;
		int check = service.checkId(req_id);
		if(check <= 0) {
			result = true;
		}
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	@PostMapping(value = "/regist", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> joinRequest(@RequestBody RegisterVO vo){
		int reqCount = service.joinRequest(vo);
		return reqCount == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
