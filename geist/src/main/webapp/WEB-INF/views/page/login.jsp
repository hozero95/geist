<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="/resources/css/login.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Geist</title>
</head>
<body class="wrap">
        <div class="header">
            <div class="logo">GEIST</div>
        </div>
        <div class="conteiner">
            <form id="loginForm">
                <div class="login-area">
                    <div class="id-area">
                        <span class="ps-box">
                            <input type="text" id="id" name="emp_id" placeholder="아이디" maxlength="20" />
                        </span>
                        <span class="msg" id="id-error">아이디를 입력하세요.</span>
                    </div>
                    <br />
                    <div class="pwd-area">
                        <span class="ps-box">
                            <input type="password" id="pwd" name="emp_pw" placeholder="비밀번호" maxlength="20" />
                        </span>
                        <span class="msg" id="pwd-error">비밀번호를 입력하세요.</span>
                    </div>
                </div>
                <br /> <input type="button" class="btn-login" value="로 그 인" /> <br />
                <br />
            </form>
            <br />
            <div class="find-info">
                <a href="#" class="idSearchLink">아이디 찾기</a> 
                <span> | </span> 
                <a href="#" class="pwSearchLink">비밀번호 찾기</a> 
                <span> | </span> 
                <a href="#" class="registerLink">회원가입</a>
            </div>
            <br />
            
        </div>
    
    <script type="text/javascript" src="/resources/js/login.js"></script>
    
    </body>
</html>