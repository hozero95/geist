package com.geist.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.geist.domain.Criteria;
import com.geist.domain.EmpManageViewVO;
import com.geist.service.EmpManageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/* *
 * 사원 관리 페이지
 * 담당 : 김호영
 */

@RestController
@RequestMapping("/empManage")
@AllArgsConstructor
@Log4j
public class EmpManageController {
	private EmpManageService service;
	
	@GetMapping(value = "/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<EmpManageViewVO>> getList(@PathVariable("page") int page){
		Criteria cri = new Criteria(page, 10);
		return new ResponseEntity<List<EmpManageViewVO>>(service.getList(cri), HttpStatus.OK);
	}
}
