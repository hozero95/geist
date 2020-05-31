package com.geist.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/* *
 * 결재 페이지
 * 담당 : 김현선
 */

@Controller
@AllArgsConstructor
@Log4j
public class AppDetailController {
	@RequestMapping("/approval/detail/new/1")
	public String approvalRequestClass1() {
		log.info("결재 문서 생성 : 주간업무 보고서 페이지 이동");
		return "page/weekly-doc";
	}
	@RequestMapping("/approval/detail/new/2")
	public String approvalRequestClass2() {
		log.info("결재 문서 생성 : 휴가 신청서 페이지 이동");
		return "page/leave-doc";
	}
	@RequestMapping("/approval/detail/new/3")
	public String approvalRequestClass3() {
		log.info("결재 문서 생성 : 사직 신청서 페이지 이동");
		return "page/resignation-doc";
	}
	@RequestMapping("/approval/detail/1")
	public String approvalAppClass1() {
		log.info("결재 문서 뷰어 : 주간업무 보고서 페이지 이동");
		return "page/re-weekly-doc";
	}
	@RequestMapping("/approval/detail/2")
	public String approvalAppClass2() {
		log.info("결재 문서 뷰어 : 휴가 페이지 이동");
		return "page/re-leave-doc";
	}
	@RequestMapping("/approval/detail/3")
	public String approvalAppClass3() {
		log.info("결재 문서 뷰어 : 사직 신청서 페이지 이동");
		return "page/re-resignation-doc";
	}
}
