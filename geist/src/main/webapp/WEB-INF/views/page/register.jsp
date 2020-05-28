<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <link rel="stylesheet" href="../resources/css/register.css" />
  <title>Geist</title>
</head>

<body>
  <div class="wrap">
    <div class="header">
      <h1>GEIST</h1>
    </div>
    <form id="join-form">
      <div class="container">
        <div id="id-row">
          <h3>
            <label for="id">아이디</label>
          </h3>
          <span class="ps-box">
            <input type="text" id="id" class="int" name="id" maxlength="20" />
          </span>
          <span class="msg" id="id-error">아이디는 반드시 입력하세요.</span>
        </div>
        <div id="pwd-row">
          <h3>
            <label for="pwd1">비밀번호</label>
          </h3>
          <span class="ps-box">
            <input type="password" id="pwd1" class="int" name="pwd1" maxlength="20" />
          </span>
          <span class="msg" id="pwd-error1">비밀번호는 반드시 입력하세요</span>
          <h3>
            <label for="pwd2">비밀번호 재입력</label>
          </h3>
          <span class="ps-box">
            <input type="password" id="pwd2" class="int" name="pwd2" maxlength="20" />
          </span>
          <span class="msg" id="pwd-error2">비밀번호가 일치하지 않습니다</span>
        </div>
        <div id="name-row">
          <h3>
            <label for="name">이름</label>
          </h3>
          <span class="ps-box">
            <input type="text" id="name" class="int" name="name" maxlength="20" />
          </span>
          <span class="msg" id="name-error">이름은 반드시 입력하세요</span>
        </div>
        <div id="email-row">
          <h3>
            <label for="email">이메일</label>
          </h3>
          <span class="ps-box">
            <input type="text" id="email" class="int" name="email" maxlength="20" />
          </span>
          <span class="msg" id="email-error">이메일 형식이 잘못되었습니다</span>
        </div>

        <div id="birth">
          <div class="birwrap">
            <h3>
              <label for="year">생년월일</label>
            </h3>
            <div class="bir-yy">
              <span class="ps-box">
                <input type="text" id="year" class="int" name="year" placeholder="년(4자)" maxlength="4" />
              </span>
            </div>
            <div class="bir-mm">
              <span class="ps-box">
                <select id="mm" class="sel">
                  <option value="월">&nbsp; 월</option>
                  <option value="01">&nbsp; 1</option>
                  <option value="02">&nbsp; 2</option>
                  <option value="03">&nbsp; 3</option>
                  <option value="04">&nbsp; 4</option>
                  <option value="05">&nbsp; 5</option>
                  <option value="06">&nbsp; 6</option>
                  <option value="07">&nbsp; 7</option>
                  <option value="08">&nbsp; 8</option>
                  <option value="09">&nbsp; 9</option>
                  <option value="10">&nbsp; 10</option>
                  <option value="11">&nbsp; 11</option>
                  <option value="12">&nbsp; 12</option>
                </select>
              </span>
            </div>
            <div class="bir-dd">
              <span class="ps-box">
                <input type="text" id="dd" class="int" name="day" placeholder="일" mexlength="2" />
              </span>
            </div>
            <span class="msg" id="birth-error">생년월일은 반드시 입력하세요</span>
          </div>
        </div>
        <div id="phone-row">
          <h3>
            <label for="phone">휴대전화</label>
          </h3>
          <span class="ps-box">
            <input type="text" id="phone" class="int" name="phone" placeholder="전화번호 입력" oninput="noKorean(this);"
              onkeyup="inputPhoneNumber(this);" maxlength="13" />
          </span>
          <span class="msg" id="phone-error">입력하신 전화번호는 잘못된 정보입니다</span>
        </div>
        <div id="addr-row">
          <h3>
            <label for="addr">주소</label>
          </h3>
          <input type="text" id="postcode" name="postcode" placeholder="우편번호" />
          <input type="text" id="addr1" name="addr1" placeholder="주소" />
          <input type="button" id="pst-btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" /><br />
          <input type="text" id="addr2" name="addr2" placeholder="참고항목" />
          <input type="text" id="addr-etc" name="addr-etc" placeholder="상세주소" />
          <span class="msg" id="addr-error">주소는 반드시 입력하세요</span>
        </div>
      </div>
      <div class="btn-area">
        <input type="button" id="btn-join" class="btn-join" value="가 입 요 청" />
      </div>
    </form>
    
  </div>
  
<script type="text/JavaScript" src="../resources/js/register.js"></script>
</body>

</html>