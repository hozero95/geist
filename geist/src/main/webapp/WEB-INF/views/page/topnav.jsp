<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Geist</title>

</head>
<body>

	<!-- top header -->
	<div class="fixed-header">
		<div class="app-header header-shadow">
	        <div class="app-header-logo">
	            <a href="/main"><img src="/resources/img/logo.png"></a>
	        </div>
	        <div class="app-header-content">
	            <div class="app-header-right">
	                <div class="header-btn-lg pr-0">
	                    <div class="widget-content p-0">
	                        <div class="widget-content-wrapper">
	                            <div class="widget-content-left">
	                                <div class="btn-group" data-toggle="dropdown">
	                                    <i class="fas fa-user-circle fa-2x"></i>
	                                    <a aria-haspopup="true" aria-expanded="false" class="p-0 btn" style="top:20px">
	                                        <i class="fa fa-angle-down ml-2 opacity-8" ></i>
	                                    </a>
	                                    <div tabindex="-1" role="menu" aria-hidden="true" class="dropdown-menu dropdown-menu-right">
	                                        <button type="button" tabindex="0" class="dropdown-item" onclick="ChangeMpage(0)">Settings</button>
	                                        <div tabindex="-1" class="dropdown-divider"></div>
	                                        <button type="button" tabindex="0" class="dropdown-item" onclick="ChangeMpage(1)">Logout</button>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
    	</div>
	</div>

</body>
</html>