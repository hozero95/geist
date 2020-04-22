package com.geist.main.controller;

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
		return "/test/main";
	}
	
	@RequestMapping("/attendance")
	public String attendance() {
		log.info("출결 페이지 이동");
		return "/test/attendance";
	}
	
	@RequestMapping("/empManage")
	public String empManage() {
		log.info("사원 관리 페이지 이동");
		return "/test/empManage";
	}
}
