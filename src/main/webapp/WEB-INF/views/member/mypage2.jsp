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
		<td onclick = "location.href='boss.info?bo_id=${sessionScope.loginMember.bo_id}'">내 정보</td>
		<td onclick = "location.href='boss.camping.info?cam_bo_id=${sessionScope.loginMember.bo_id}'">캠핑 정보</td>
		<td onclick = "location.href='boss.campingreview?h_u_id=${sessionScope.loginMember.bo_id}'">캠핑리뷰보기</td>	
		<td onclick = "location.href='boss.campingreservation?r_u_id=${sessionScope.loginMember.bo_id}'">사용자가 예약한 내용</td>
		<td onclick = "location.href='boss.buylist?b_u_bo_id=${sessionScope.loginMember.bo_id}'">구매목록</td>		
		<td onclick = "location.href='boss.communities?f_u_id=${sessionScope.loginMember.bo_id}'">내글</td>	
	</tr>
</table>
</body>
</html>