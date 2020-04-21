package com.geist.domain;

import java.sql.Date;

import lombok.Data;
/*
 * 공지 페이지
 * 담당 : 홍예진
 * */
@Data
public class NoticeVO{

	private int noti_no;//key
	private String noti_title;//제목
	private String noti_content;//내용
	private Date noti_date;//날짜
}