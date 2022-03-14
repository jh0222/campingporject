<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="bossmember.join"
		method="post" enctype="multipart/form-data"
		name="joinForm" onsubmit="return joinCheck();">
		<div class="join">
			<div class="join_title">
				<br>
				사장님 회원가입
			</div>
			<div class="join_title2">	
				아이디
			</div>
			<div class="join_txt">
				<div class="join_id">
				<input id="id" name="id" placeholder="필수, 영어/숫자만" maxlength="10" autocomplete="off" autofocus="autofocus">
				<button id="Idckbtn" onclick="connectJoinIdInputEvent()">중복확인</button>
				<input type="hidden" id="idDoubleChk"/>
				</div>
			</div>
			<div class="join_title2">
				비밀번호
			</div>
			<div class="join_txt">
				<input name="pw" placeholder="필수, 숫자 하나이상 반드시" type="password" maxlength="10" autocomplete="off">
			</div>
			<div class="join_title2">
				비밀번호 확인
			</div>
			<div class="join_txt">
				<input name="pwChk" placeholder="필수, 숫자 하나이상 반드시" type="password" maxlength="10" autocomplete="off">
			</div>
			<div class="join_title2">
				이름
			</div>
			<div class="join_txt">
				<input name="name" placeholder="필수" maxlength="10" autocomplete="off">
			</div>
			<div class="join_title2">
				생년월일
			</div>
			<div class="join_txt">
				<input min="1910-01-01" max="2021-12-31" type="date" name="birth"/> 
			</div>
			<div class="join_title2">
				이메일
			</div>
			<div class="join_txt">
				<div class="join_email">
					<div>	
					<input placeholder="이메일입력" type="text" name="email" required>
					<span id="middle">@</span>
					</div>
					<div class="join_email_addr">
						<input placeholder="직접입력" type="text" name="email_address" list="email_address_list">
						<datalist id="email_address_list">
							<option value="naver.com"></option>
							<option value="daum.com"></option>
							<option value="google.com"></option>						
							<option value="hanmail.net"></option>
			                <option value="nate.com"></option>
						</datalist>
					</div>
				</div>
			</div>
			<div class="join_title2">
				주소
			</div>
			<div class="join_txt">
				<div class="join_addr">
					<input id="addr3Input" readonly="readonly" name="addr3" maxlength="5" autocomplete="off" placeholder="우편번호">
					<span id="addrSearchBtn">[검색]</span><br>
				</div>
				<input id="addr1Input" readonly="readonly" name="addr1" maxlength="30" autocomplete="off" placeholder="주소"><br>
				<input name="addr2" maxlength="30" autocomplete="off" placeholder="상세주소">
			</div>
			<div class="join_phonenumber">
				<div class="join_title2">
					핸드폰번호
				</div>
				<div class="join_txt">
					<select name="phonenumber1">
                   		<option value="010">010</option>
		                <option value="011">011</option>
		                <option value="016">016</option>
		                <option value="017">017</option>
		                <option value="018">018</option>
		                <option value="019">019</option>
            		</select>
            		- <input name="phonenumber2" maxlength="4">
					- <input name="phonenumber3" maxlength="4">
				</div>
			</div>
			<div class="join_title2">
				프로필 사진
			</div>
			<div class="join_file">
				<input name="picture" type="file">
			</div>
			<div style="text-align:center;">
				<button class="joinbtn">가입하기</button>
			</div>
		</div>
	</form>
</body>
</html>