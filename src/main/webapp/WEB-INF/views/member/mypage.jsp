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
		<td onclick = "location.href='userbuylist?b_u_bo_id=${sessionScope.loginMember.u_id} ${sessionScope.loginMember2.bo_id}'">구매목록</td>		
		<td onclick = "location.href='usercommunities?'">내글</td>	
		<td onclick = "location.href='usercampingjjim'">캠핑찜</td>	
		<td onclick = "location.href='usercampingreservation'">캠핑예약</td>
		<td onclick = "location.href='usercart'">장바구니</td>
		<td onclick = "location.href='userinformation?u_id=${sessionScope.loginMember.u_id} ${sessionScope.loginMember2.bo_id}'">내 정보</td>
	</tr>
</table>
</body>
</html>