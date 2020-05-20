package com.geist.myPage.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.geist.myPage.domain.MypageDTO;
import com.geist.myPage.service.MypageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/* *
 * 마이페이지
 * 담당 : 김현선
 */

@RestController
@RequestMapping("/mypage")
@AllArgsConstructor
@Log4j
public class MypageController {
	private MypageService service;

	@GetMapping(value = "/{emp_no}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<MypageDTO> get(@PathVariable("emp_no") Long emp_no) {
		return new ResponseEntity<>(service.get(emp_no), HttpStatus.OK);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value = "/detail/{emp_no}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	/* consumes = "application/json"
		: client가 보내는 content-type이 'consumes'에서 명시한 media-type과 동일해야 한다
	 */
	public ResponseEntity<String> modify(@RequestBody MypageDTO dto, @PathVariable("emp_no") Long emp_no){
		dto.setEmp_no(emp_no);
		
		return service.modify(dto) == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	};	

}
