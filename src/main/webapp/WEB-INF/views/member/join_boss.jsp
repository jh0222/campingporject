<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<table id="joinTable">
			<tr>
				<td colspan="2" align="center">
					회원가입
				</td>
			</tr>
			<tr>
				<td>ID</td>
				<td>
					<input name="u_id" placeholder="필수, 영어/숫자만" maxlength="10" autocomplete="off" autofocus="autofocus">
					<button>중복확인</button>
				</td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input name="u_pw" placeholder="필수, 숫자 하나이상 반드시" type="password" maxlength="10" autocomplete="off"></td>
			</tr>
			<tr>
				<td>PW확인</td>
				<td><input name="u_pwChk" placeholder="필수, 숫자 하나이상 반드시" type="password" maxlength="10" autocomplete="off"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input name="u_name" placeholder="필수" maxlength="10" autocomplete="off"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input name="u_email">
				</td>
			</tr>
			<tr>
				<td class="td1">주소</td>
				<td class="td2">
					<input readonly="readonly" name="m_addr3" maxlength="5" autocomplete="off" placeholder="우편번호">
					<span id="addrSearchBtn">[검색]</span><br>
					<input readonly="readonly" name="m_addr1" maxlength="30" autocomplete="off" placeholder="주소"><br>
					<input name="m_addr2" maxlength="30" autocomplete="off" placeholder="상세주소">
				</td>
			</tr>
			<tr>
				<td class="td1">사진</td>
				<td class="td2"><input name="u_picture" type="file"></td>
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