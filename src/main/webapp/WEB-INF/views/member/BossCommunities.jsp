<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/community/community.css">
</head>
<body>
<ul>
	<li><a href="boss.info?bo_id=${sessionScope.loginMember2.bo_id}">내정보</a></li>
	<li><a href="boss_camping.info?cam_bo_id=${sessionScope.loginMember2.bo_id}">캠핑 정보</a></li>
	<li><a href="boss_campingreservation?cam_bo_id=${sessionScope.loginMember2.bo_id}">예약목록</a></li>
	<li><a href="boss_buylist?b_u_bo_id=${sessionScope.loginMember2.bo_id}&fb_u_bo_id=${sessionScope.loginMember2.bo_id}">구매목록</a></li>
	<li><a href="boss_communities?f_u_id=${sessionScope.loginMember2.bo_id}">내글</a>
		<ul class="submenu">
			<li><a href="#">SubMenu 1</a></li>

		</ul>	
	</li>
</ul>
</body>
</html>