package com.geist.joinRequest.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.geist.joinRequest.domain.JoinRequestPageDTO;
import com.geist.joinRequest.service.JoinRequestService;
import com.geist.main.domain.Criteria;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/* *
 * 가입 승인 페이지
 * 담당 : 김호영
 */

@RestController
@RequestMapping("/joinRequest/*")
@AllArgsConstructor
@Log4j
public class JoinRequestController {
	private JoinRequestService service;
	
	@GetMapping(value = "/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<JoinRequestPageDTO> getList(@PathVariable("page") int page){
		Criteria cri = new Criteria(page, 10);
		return new ResponseEntity<JoinRequestPageDTO>(service.getList(cri), HttpStatus.OK);
	}
}
