package com.geist.address.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.geist.address.domain.AddressViewVO;
import com.geist.address.service.AddressService;
import com.geist.main.domain.Criteria;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/* *
 * 주소록 조회 페이지
 * 담당 : 김현선
 */

@RestController
@RequestMapping("/address")
@AllArgsConstructor
@Log4j
public class AddressController {

	private AddressService service;
	
	@GetMapping(value = "/list/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<AddressViewVO>> getList(@PathVariable("page") int page){
		Criteria cri = new Criteria(page, 10);
		
		return new ResponseEntity<List<AddressViewVO>>(service.getList(cri), HttpStatus.OK);
	}
	
}
