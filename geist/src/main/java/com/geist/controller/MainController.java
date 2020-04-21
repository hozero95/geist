package com.geist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

/* *
 * 메인 페이지
 * 담당 : 김호영
 */

@Controller
@Log4j
public class MainController {
	@RequestMapping("/")
	public String main() {
		log.info("메인 페이지 이동");
		return "main";
	}
	
	@RequestMapping("/attendance")
	public String attendance() {
		return "attendance";
	}
}
