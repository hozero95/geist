package com.geist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/* *
 * 테스트 페이지
 * 담당 : 김호영
 */

@Controller
public class TestController {
	@GetMapping({"/", "/test"})
	public String test() {
		return "/test/test";
	}
}
