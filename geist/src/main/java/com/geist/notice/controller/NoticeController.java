package com.geist.notice.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.geist.main.domain.Criteria;
import com.geist.notice.domain.NoticeVO;
import com.geist.notice.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/*
 * 공지 페이지
 * 담당 : 홍예진
 */

@RestController
@RequestMapping("/notice")
@AllArgsConstructor
@Log4j
public class NoticeController {

	private NoticeService service;
	
	//목록
	@GetMapping(value = "/noticeList/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<NoticeVO>> noticeList(@PathVariable("page") int page){
		Criteria cri = new Criteria(page, 10);
		return new ResponseEntity<List<NoticeVO>>(service.noticeList(cri), HttpStatus.OK);
	}
	
	//조회
	@GetMapping(value = "/noticeRead/{noti_no}",  produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<NoticeVO> noticeRead(@PathVariable("noti_no") int noti_no){
		log.info("noticeRead Controller");
		return new ResponseEntity<NoticeVO>(service.noticeRead(noti_no), HttpStatus.OK);
	}
	
	//작성 Post(값 전달)
	//Post형식에선 return값을 주지 않아도 됨
	@PostMapping(value = "/noticeWrite", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> noticeWrite(@RequestBody NoticeVO vo){
		
		log.info("noticeWrite Controller");
		
		service.noticeWrite(vo);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	//수정 Post
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
													value = "/noticeUpdate/{noti_no}",
													consumes = "application/json",
													produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> noticeUpdate(@RequestBody NoticeVO vo,
																		@PathVariable("noti_no") int noti_no){
		vo.setNoti_no(noti_no);
		log.info("noticeUpdate Controller");

		service.noticeUpdate(vo);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	//수정 Get
	@GetMapping(value = "/noticeUpdate/{noti_no}",  produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<NoticeVO> noticeUpdate(@PathVariable("noti_no") int noti_no){
		
		log.info("noticeUpdate Controller Get()");
		
		return new ResponseEntity<NoticeVO>(service.noticeRead(noti_no), HttpStatus.OK);
	}
	
	//삭제 Post
	@DeleteMapping(value ="/noticeDelete/{noti_no}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("noti_no") int noti_no){
		log.info("noticeDelete Controller");
		service.noticeDelete(noti_no);
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	
	
}
