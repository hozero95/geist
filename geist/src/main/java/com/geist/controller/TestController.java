package com.geist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class TestController {
	@GetMapping({"/", "/test"})
	public String test() {
		log.info("테스트 중입니다.");
		return "test";
	}
}
