package com.geist.joinRequest.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.geist.joinRequest.domain.JoinRequestDetailVO;
import com.geist.joinRequest.domain.JoinRequestPageDTO;
import com.geist.joinRequest.domain.JoinRequestVO;
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
		log.info("page : " + page);
		Criteria cri = new Criteria(page, 10);
		return new ResponseEntity<JoinRequestPageDTO>(service.getList(cri), HttpStatus.OK);
	}
	
	@GetMapping(value = "/detailView/{req_id}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<JoinRequestVO> detailView(@PathVariable("req_id") String req_id){
		log.info("req_id : " + req_id);
		return new ResponseEntity<JoinRequestVO>(service.getDetail(req_id), HttpStatus.OK);
	}
	
	@PostMapping(value = "/detailView", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insertEmp(@RequestBody JoinRequestDetailVO vo){
		JoinRequestVO joinRequestVO = service.getAllDetail(vo.getReq_id());
		String emp_position = vo.getEmp_position();
		Long emp_sal = Long.parseLong(vo.getEmp_sal());
		Long dept_no = service.getDeptNo(vo.getDept_name());
		int inCount = service.insertEmp(joinRequestVO, emp_position, emp_sal, dept_no);
		return inCount == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value = "/detailView/{req_id}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> deleteRequest(@PathVariable("req_id") String req_id){
		log.info("req_id" + req_id);
		return service.deleteRequest(req_id) == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
