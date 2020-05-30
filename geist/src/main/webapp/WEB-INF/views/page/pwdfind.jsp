<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pwdfind.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>비밀번호 찾기</title>
</head>
<body>
<div class="wrap">
    <div id="header">
        <div class="top">
            <h1>
                <a href="javascript:void(0)" class="logo btn-login"><span>GEIST</span></a>
            </h1>
        </div>
        <div class="menu">
            <ul class="menu_type">
                <li><a href="javascript:void(0)" onclick="location.href='/idSearch'" class="idclick"><span>아이디 찾기</span></a></li>
                <span class="menu-bar">&nbsp;|&nbsp;</span>
                <li><a href="javascript:void(0)" onclick="location.herf='/pwSearch'" class="pwdclick"><span>비밀번호 찾기</span></a></li>
            </ul>
        </div>
    </div>
    <div id="conteiner">
        <div class="content">
            <div class="content_header">
                <h3>비밀번호 찾기</h3>
            </div>
            <hr>
            <p>각 정보들을 입력해 주세요</p>
            <form id="pwdfind">
                <span class="ps_box">
                    <input type="text" id="userid" name="userid" maxlength="20" placeholder="아이디를 입력하세요"> 
                </span>
                <span class="ps_box">
                    <input type="text" id="name" name="name" maxlength="20" placeholder="이름을 입력하세요"> 
                </span>
                <span class="ps_box">
                    <input type="text" id="phone" name="phone" maxlength="13" placeholder="휴대폰 번호를 입력하세요" oninput="noKorean(this);" onkeyup="inputPhoneNumber(this);"> 
                </span>
                <span class="ps_box">
                    <input type="text" id="email" name="email" maxlength="20" placeholder="이메일을 입력하세요"> 
                </span>
                <div class="btn-row">
                    <input type="button" class="btn-find" value="찾 기">
                </div>
                <div class="btn-row">
                    <input type="button" class="btn-login btn-find" value="로그인 하러가기">
                </div>
            </form>
        </div>
    </div>
    
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/pwdFind.js"></script>

</body>
</html>