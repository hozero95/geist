package com.geist.joinRequest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/* *
 * 가입 승인 페이지
 * 담당 : 김호영
 */

@Controller
@AllArgsConstructor
@Log4j
public class JoinRequestDetailController {
	@RequestMapping("/joinRequest/detailView")
	public String joinRequestDetail(@RequestParam("req_id") String req_id, Model model) {
		log.info("가입 승인 상세 조회 페이지 이동");
		
		model.addAttribute("req_id", req_id);
		
		return "/page/admin-page-approve-detail";
//		return "/test/joinRequestDetail";
	}
}
