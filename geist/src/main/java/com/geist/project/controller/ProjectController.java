package com.geist.project.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.geist.project.domain.ProjectCriVO;
import com.geist.project.domain.ProjectVO;
import com.geist.project.service.ProjectService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/*
 * 프로젝트
 * 담당 : 홍예진
 * */

@RestController
@RequestMapping("/project")
@AllArgsConstructor
@Log4j
public class ProjectController {

		private ProjectService service;
		
		//프로젝트의 목록을 보여주는 부분
		@GetMapping(value = "/projectList/{dept_no}/{page}",
				produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
		public ResponseEntity<List<ProjectVO>> projectList(@PathVariable("page") int page,
				@PathVariable("dept_no") int dept_no){
			ProjectCriVO vo = new ProjectCriVO(page, 10);
			return new ResponseEntity<List<ProjectVO>>(service.projectList(vo), HttpStatus.OK);
		}
		
		//프로젝트를 작성하는 부분
		@PostMapping(value = "/projectWrite", consumes = "application/json",
				produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> projectWrite(@RequestBody ProjectVO vo){
			
			//로그를 찍는 부분
			log.info("projectWrite Controller");
			
			//작성시 projectWrite를 통해 내용을 저장하고 projectMWrite를 통해 부서 번호를 할당한다
			service.projectWrite(vo);
			service.projectMWrite(vo);
			
			return new ResponseEntity<>(HttpStatus.OK);
		}
		
		@RequestMapping(method = { RequestMethod.PUT,
				RequestMethod.PATCH }, value = "/projectUpdate/{proj_no}", consumes = "application/json", produces = {
						MediaType.TEXT_PLAIN_VALUE })
		public ResponseEntity<String> projectUpdate(@RequestBody ProjectVO vo, @PathVariable("proj_no") int proj_no) {
			
			vo.setProj_no(proj_no);
			log.info("projectUpdate Controller");

			service.projectUpdate(vo);

			return new ResponseEntity<>(HttpStatus.OK);
		}
		
		@GetMapping(value = "/projectUpdate/{proj_no}",  produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
		public ResponseEntity<ProjectVO> noticeUpdate(@PathVariable("proj_no") int proj_no){
			
			log.info("projectUpdate Controller Get()");
			
			return new ResponseEntity<ProjectVO>(service.projectRead(proj_no), HttpStatus.OK);
		}
		
		@DeleteMapping(value ="/projectDelete/{proj_no}", produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> remove(@PathVariable("proj_no") int proj_no){
			log.info("projectDelete Controller");
			service.projectDelete(proj_no);
			return new ResponseEntity<>("success", HttpStatus.OK);
		}
}

