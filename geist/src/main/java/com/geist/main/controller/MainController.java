package com.geist.main.controller;

import javax.servlet.http.HttpSession;

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
	@RequestMapping({"/", "/login"})
	public String login() {
		log.info("로그인 페이지 이동");
		return "/test/login";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
	
	@RequestMapping("/register")
	public String register() {
		log.info("회원가입 페이지 이동");
		return "/test/register";
	}
	
	@RequestMapping("/idSearch")
	public String idSearch() {
		log.info("아이디 찾기 페이지 이동");
		return "/test/idSearch";
	}
	
	@RequestMapping("/pwSearch")
	public String pwSearch() {
		log.info("비밀번호 찾기 페이지 이동");
		return "/test/pwSearch";
	}
	
	@RequestMapping("/main")
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
	
	@RequestMapping("/joinRequest")
	public String joinRequest() {
		log.info("가입 승인 페이지 이동");
		return "/test/joinRequest";
	}
}
