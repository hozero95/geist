<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Geist</title>
</head>
<body>
<div class="fixed-sidebar closed-sidebar" data-class="closed-sidebar">
    <!-- Side navbar -->
      <div class="app-sidebar">
          <div class="scrollbar-sidebar">
              <div class="app-sidebar-inner">
                  <ul class="vertical-nav-menu">
                      <li>
                          <a href="/main">
                              <i class="metismenu-icon pe-7s-home"></i>
                              Home
                          </a>
                      </li>
                      <li>
                          <a href="javascript:void(0);" onclick="ChangeMpage(2)">
                              <i class="metismenu-icon pe-7s-document"></i>
                              공지사항
                          </a>
                      </li>
                      <li>
                          <a href="javascript:void(0);" onclick="ChangeMpage(3)">
                              <i class="metismenu-icon pe-7s-project"></i>
                              프로젝트
                          </a>
                      </li>
                      <li>
                          <a href="#">
                              <i class="metismenu-icon pe-7s-ink"></i>
                              전자결재
                              <i class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
                          </a>
                          <ul>
                              <li>
                                  <a href="javascript:void(0);" onclick="ChangeMpage(4)">결재요청</a>  
                              </li>
                              <li>
                                  <a href="javascript:void(0);" onclick="ChangeMpage(5)">결재조회</a>
                              </li>
                              <li>
                                  <a href="javascript:void(0);" onclick="ChangeMpage(6)">결재승인</a>
                              </li>
                          </ul>
                      </li>
                      <li>
                          <a href="javascript:void(0);" onclick="ChangeMpage(7)">
                              <i class="metismenu-icon pe-7s-card"></i>
                              인사근태
                          </a>
                      </li>
                      <li>
                          <a href="javascript:void(0);" onclick="ChangeMpage(8)">
                              <i class="metismenu-icon pe-7s-book"></i>
                              주소록
                          </a>
                      </li>
                      <li>
                          <a href="javascript:void(0);" onclick="ChangeMpage(9)">
                              <i class="metismenu-icon pe-7s-user"></i>
                              마이페이지
                          </a>
                      </li>
                      <li>
                          <a href="#">
                              <i class="metismenu-icon pe-7s-master"></i>
                              관리자
                              <i class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
                          </a>
                          <ul>
                              <li>
                                  <a href="javascript:void(0);" onclick="ChangeMpage(10)">사원조회</a>
                              </li>
                              <li>
                                  <a href="javascript:void(0);" onclick="ChangeMpage(11)">가입승인</a>
                              </li>
                          </ul>
                      </li>
                  </ul>

              </div>
          </div>
      </div>
	<div class="scrollbar-container"></div>
    </div>
</body>
</html>