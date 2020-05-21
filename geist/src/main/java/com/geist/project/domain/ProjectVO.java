package com.geist.project.domain;

import java.sql.Date;

import lombok.Data;

/*
 * 프로젝트
 * 담당 : 홍예진
 * 
 * create table project(
proj_no number(10) not null,
proj_name varchar2(20) not null,
proj_agency varchar2(20) not null,
proj_start date,
proj_end date,
constraint pk_project primary key(proj_no)
);

create table proj_management(
proj_no number(10) not null,
dept_no number(10) not null,
constraint pk_proj_management primary key(proj_no, dept_no),
constraint fk_proj_management_proj_no foreign key(proj_no) references project(proj_no),
constraint fk_proj_management_dept_no foreign key(dept_no) references department(dept_no)
);
 * */

@Data
public class ProjectVO {
	private int proj_no;
	private int dept_no;
	private String proj_name;
	private String proj_agency;
	private Date proj_start;
	private Date proj_end;
}
