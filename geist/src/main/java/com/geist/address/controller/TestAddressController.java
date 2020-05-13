package com.geist.address.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.geist.main.controller.MainController;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class TestAddressController {
	@RequestMapping("/address")
	public String address() {
		log.info("주소록 페이지 이동");
		return "/test/address";
	}
}
