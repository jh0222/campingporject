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
	<form action="usermember.join"
		method="post" enctype="multipart/form-data"
		name="joinForm" onsubmit="return joinCheck();">
		<table id="joinTable">
			<tr>
				<td colspan="2" align="center">
					사용자 회원가입
				</td>
			</tr>
			<tr>
				<td>ID</td>
				<td>
					<input id="id" name="id" placeholder="필수, 영어/숫자만" maxlength="10" autocomplete="off" autofocus="autofocus">
					<button id="Idckbtn" onclick="connectJoinIdInputEvent()">중복확인</button>
					<input type="hidden" id="idDoubleChk"/>
					
				</td>
			</tr>
			<tr>
				<td>PW</td>
				<td>
					<input name="pw" placeholder="필수, 숫자 하나이상 반드시" type="password" maxlength="10" autocomplete="off">
				</td>
			</tr>
			<tr>
				<td>PW확인</td>
				<td><input name="pwChk" placeholder="필수, 숫자 하나이상 반드시" type="password" maxlength="10" autocomplete="off"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input name="name" placeholder="필수" maxlength="10" autocomplete="off"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input placeholder="이메일입력" type="text" name="email" required><span id="middle">@</span><input placeholder="직접입력" type="text" name="email_address" list="email_address_list">
					<datalist id="email_address_list">
						<option value="naver.com"></option>
						<option value="daum.com"></option>
						<option value="google.com"></option>						
						<option value="hanmail.net"></option>
		                <option value="nate.com"></option>
					</datalist>
				</td>
			</tr>
			<tr>
				<td class="td1">주소</td>
				<td class="td2">
					<input id="addr3Input" readonly="readonly" name="u_addr3" maxlength="5" autocomplete="off" placeholder="우편번호">
					<span id="addrSearchBtn">[검색]</span><br>
					<input id="addr1Input" readonly="readonly" name="u_addr1" maxlength="30" autocomplete="off" placeholder="주소"><br>
					<input name="u_addr2" maxlength="30" autocomplete="off" placeholder="상세주소">
				</td>
			</tr>
			<tr> 
				<td>생년월일</td> 
				<td>
				  	<input min="1910-01-01" max="2021-12-31" type="date" name="birth"/> 
				</td>				
			</tr>
			<tr>
				<td>핸드폰번호</td>
				<td>
					<select name="phonenumber1">
                   		<option value="010">010</option>
		                <option value="011">011</option>
		                <option value="016">016</option>
		                <option value="017">017</option>
		                <option value="018">018</option>
		                <option value="019">019</option>
            		</select>
            		-<input name="phonenumber2" maxlength="4">
					-<input name="phonenumber3" maxlength="4">
				</td>
			</tr>
			<tr>
				<td class="td1">프로필 사진</td>
				<td class="td2"><input name="picture" type="file"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" style="background-color: #FFFFFF;">
					<button>가입</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>