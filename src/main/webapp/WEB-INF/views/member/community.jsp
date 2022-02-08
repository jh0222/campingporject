<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<td onclick = "location.href='freeboard?f_u_id=${sessionScope.loginMember.u_id}'">자유게시판</td>		
		<td onclick = "location.href='campingtip?tip_u_id=${sessionScope.loginMember.u_id}'">캠핑팁</td>	
		<td onclick = "location.href='recipe?rb_u_id=${sessionScope.loginMember.u_id}'">레시피</td>	
		<td onclick = "location.href='campingreview?c_u_id=${sessionScope.loginMember.u_id}'">캠핑 리뷰</td>
		<td onclick = "location.href='productreview?pr_u_bo_id=${sessionScope.loginMember.u_id}&fpr_u_bo_id=${sessionScope.loginMember.u_id}'">구매용품 리뷰</td>
		<td onclick = "location.href='freeboardreview?fr_u_id=${sessionScope.loginMember.u_id}'">자유게시판 리뷰</td>
		<td onclick = "location.href='campingtipreview?tipr_u_id=${sessionScope.loginMember.u_id}'">캠핑팁 리뷰</td>
		<td onclick = "location.href='recipereview?rr_u_id=${sessionScope.loginMember.u_id}'">레시피 리뷰</td>
	</tr>
</table>
</body>
</html>