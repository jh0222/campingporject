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
	<form action="bossmember.update"
		method="post" enctype="multipart/form-data" name="updateBossForm" onsubmit="return updateBossCheck();">
		<table id="joinTable">
			<tr>
				<td colspan="2" align="center">	사장 정보	</td>
			</tr>
			<tr>
				<td>
					<img src="resources/img/${sessionScope.loginMember2.bo_picture }" id="updateMemberPhoto"><br>
				</td>
				<td>ID</td>
				<td>
					<input readonly="readonly" value="${sessionScope.loginMember2.bo_id }">
				</td>
			</tr>
			<tr>
				<td>PW</td>
				<td>
					<input name="pw" value="${sessionScope.loginMember2.bo_pw }" placeholder="필수, 숫자 하나이상 반드시"  maxlength="10" autocomplete="off">
				</td>
			</tr>
			<tr>
				<td>PW확인</td>
				<td><input name="pwChk" value="${sessionScope.loginMember2.bo_pw }" placeholder="필수, 숫자 하나이상 반드시" type="password" maxlength="10" autocomplete="off"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input readonly="readonly" name="name" value="${sessionScope.loginMember2.bo_name }" placeholder="필수" maxlength="10" autocomplete="off"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input readonly="readonly" placeholder="이메일입력" type="text" name="email" required><span id="middle">@</span><input placeholder="직접입력" type="text" name="email_address" list="email_address_list">
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
					<input id="addr3Input" readonly="readonly" value="${addr[2] }" name="u_addr3" maxlength="5" autocomplete="off" placeholder="우편번호">
					<span id="addrSearchBtn">[검색]</span><br>
					<input id="addr1Input" readonly="readonly" value="${addr[0] }" name="u_addr1" maxlength="30" autocomplete="off" placeholder="주소">
					<input name="u_addr2" value="${addr[1] }" maxlength="30" autocomplete="off" placeholder="상세주소">
				</td>
			</tr>
			<tr> 
				<td>생년월일</td> 
				<td>
				  	<input readonly="readonly" value="${sessionScope.loginMember2.bo_birth }" name="birth" type="date"/> 
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
            		-<input readonly="readonly" name="phonenumber2" maxlength="4">
					-<input readonly="readonly" name="phonenumber3" maxlength="4">
				</td>
			</tr>
			<tr>
				<td class="td1">프로필 사진</td>
				<td class="td2"><input type="hidden" name="oldpicture" value="${sessionScope.loginMember.u_picture }"><input name="newpicture" type="file"></td>
				<td class="td2"><input name="picture" type="file"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" style="background-color: #FFFFFF;">
					<button>수정</button>
					<button onclick="bossBye();" type="button">탈퇴</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>