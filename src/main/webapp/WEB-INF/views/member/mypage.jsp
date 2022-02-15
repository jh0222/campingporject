<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<td onclick = "location.href='user.info?u_id=${sessionScope.loginMember.u_id}'">내 정보</td>
		<td onclick = "location.href='campingjjim?h_u_id=${sessionScope.loginMember.u_id}'">캠핑찜</td>	
		<td onclick = "location.href='campingreservation?r_u_id=${sessionScope.loginMember.u_id}'">캠핑예약</td>
		<td onclick = "location.href='userbuylist?b_u_bo_id=${sessionScope.loginMember.u_id}'">구매목록</td>		
		<td onclick = "location.href='communities?f_u_id=${sessionScope.loginMember.u_id}'">내글</td>	
	</tr>
</table>
</body>
</html>