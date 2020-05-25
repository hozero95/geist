package com.geist.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

/*
 * 공지 페이지
 * 담당 : 홍예진
 * */
@Controller
@Log4j
public class noticeWriteController {
	@RequestMapping("/notice/noticeWrite")
	public String noticeWrite() {
		log.info("공지 작성페이지 이동");
		return "page/document-page-write";
	}
}
