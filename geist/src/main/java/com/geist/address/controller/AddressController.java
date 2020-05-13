package com.geist.address.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.geist.address.domain.AddressDTO;
import com.geist.address.service.AddressService;
import com.geist.main.domain.Criteria;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/* *
 * 주소록 조회 페이지
 * 담당 : 김현선
 */

@RestController
@RequestMapping("/address/*")
@AllArgsConstructor
@Log4j
public class AddressController {

	private AddressService service;
	
	@GetMapping(value = "/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<AddressDTO> getList(@PathVariable("page") int page){
		Criteria cri = new Criteria(page, 10);
		log.info("getList() 실행");
		
		return new ResponseEntity<AddressDTO>(service.getList(cri), HttpStatus.OK);
	}
	
	// 주소록에 검색 조건을 선택X, 이름검색이 default
	@GetMapping(value = "/{page}/{keyword}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<AddressDTO> searchList(@PathVariable("page") int page, @PathVariable("keyword") String keyword){
		log.info("searchList() 실행");
		log.info("keyword === : " + keyword);
		
		Criteria cri = new Criteria(page, 10);
		cri.setKeyword(keyword);
		
		log.info("cri === " + cri);
		return new ResponseEntity<AddressDTO>(service.searchList(cri), HttpStatus.OK);
	}
	
}
