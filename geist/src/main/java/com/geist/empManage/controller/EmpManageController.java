package com.geist.empManage.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.method.P;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.geist.empManage.domain.EmpManagePageDTO;
import com.geist.empManage.service.EmpManageService;
import com.geist.main.domain.Criteria;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/* *
 * 사원 관리 페이지
 * 담당 : 김호영
 */

@RestController
@RequestMapping("/empManage/*")
@AllArgsConstructor
@Log4j
public class EmpManageController {
	private EmpManageService service;
	
	@GetMapping(value = "/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<EmpManagePageDTO> getList(@PathVariable("page") int page){
		Criteria cri = new Criteria(page, 10);
		return new ResponseEntity<EmpManagePageDTO>(service.getList(cri), HttpStatus.OK);
	}
	
	@GetMapping(value = "/{page}/{type}/{keyword}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<EmpManagePageDTO> searchList(@PathVariable("page") int page, @PathVariable("type") String type, @PathVariable("keyword") String keyword){
		Criteria cri = new Criteria(page, 10);
		cri.setType(type);
		cri.setType(keyword);
		log.info(cri);
		return new ResponseEntity<EmpManagePageDTO>(service.searchList(cri), HttpStatus.OK);
	}
}
