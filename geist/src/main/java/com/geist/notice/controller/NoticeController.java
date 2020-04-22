package com.geist.notice.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.geist.main.domain.Criteria;
import com.geist.notice.domain.NoticeVO;
import com.geist.notice.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/*
 * 공지 페이지
 * 담당 : 홍예진
 * */

@RestController
@RequestMapping("/notice")
@AllArgsConstructor
@Log4j
public class NoticeController {

	private NoticeService service;
	
	@GetMapping(value = "/noticeList/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<NoticeVO>> getList(@PathVariable("page") int page){
		Criteria cri = new Criteria(page, 10);
		
		return new ResponseEntity<List<NoticeVO>>(service.noticeList(cri), HttpStatus.OK);
	}
}
