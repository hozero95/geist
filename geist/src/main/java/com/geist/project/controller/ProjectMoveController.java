package com.geist.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;
/*프로젝트 페이지
 * 담당: 홍예진
 * 페이지 이동을 위한 controller
 */
@Controller
@Log4j
public class ProjectMoveController {

	@RequestMapping(value = "/project/projectUpdate", method = RequestMethod.GET)
	public String projectUpdate() {
		log.info("프로젝트 수정 페이지 이동");
		return "/page/project-update-page";
	}
	
	@RequestMapping(value = "/project/projectWrite", method = RequestMethod.GET)
	public String address() {
		log.info("프로젝트 작성 페이지 이동");
		return "/page/project-write-page";
	}
	
}
