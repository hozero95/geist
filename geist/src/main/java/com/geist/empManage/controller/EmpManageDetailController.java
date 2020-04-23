package com.geist.empManage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/* *
 * 사원 관리 페이지
 * 담당 : 김호영
 */

@Controller
@AllArgsConstructor
@Log4j
public class EmpManageDetailController {
	@RequestMapping("/empManage/detailView")
	public String empManageDetail(@RequestParam("emp_no") Long emp_no, Model model) {
		log.info("사원 상세 조회 페이지 이동");
		
		model.addAttribute("emp_no", emp_no);
		
		return "/test/empManageDetail";
	}
}
