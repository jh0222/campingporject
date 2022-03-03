<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/mypage.css" type="text/css" />
</head>
<body>
<div>
<p style="font-size: 30px;"><b>나의 캠핑 활동</b></p>
	<ul id="nav-v2">
		<li class="menu-v2"><a href="boss.info?bo_id=${sessionScope.loginMember2.bo_id}">회원 정보</a></li>
		<li class="menu-v2"><a href="boss_camping.info?cam_bo_id=${sessionScope.loginMember2.bo_id}">캠핑 정보</a></li>
		<li class="menu-v2"><a href="boss_campingreservation?cam_bo_id=${sessionScope.loginMember2.bo_id}">예약 내역</a></li>
		<li class="menu-v2"><a href="boss_buylist?b_u_bo_id=${sessionScope.loginMember2.bo_id}&fb_u_bo_id=${sessionScope.loginMember2.bo_id}">구매 내역</a></li>
		<li class="menu-v2">
			<a href="boss_productreview?pr_u_bo_id=${sessionScope.loginMember2.bo_id}&fpr_u_bo_id=${sessionScope.loginMember2.bo_id}">구매후기</a>
		</li>
	</ul>
<p style="font-size: 30px;"><b>커뮤니티</b></p>
	<ul id="nav-v2">
		<li class="menu-v2"><a href="boss_freeboard?f_u_id=${sessionScope.loginMember2.bo_id}">자유게시판</a></li>
		<li class="menu-v2"><a href="boss_campingtip?tip_u_id=${sessionScope.loginMember2.bo_id}">캠핑팁</a></li>
		<li class="menu-v2"><a href="boss_recipe?rb_u_id=${sessionScope.loginMember2.bo_id}">레시피</a></li>
		<li class="menu-v2"><a href="boss_freeboardreview?fr_u_id=${sessionScope.loginMember2.bo_id}">댓글</a></li>
		<li class="menu-v2"><a href="boss_campingtipreview?tipr_u_id=${sessionScope.loginMember2.bo_id}">캠핑팁 댓글</a></li>
		<li class="menu-v2"><a href="boss_recipereview?rr_u_id=${sessionScope.loginMember2.bo_id}">레시피 댓글</a></li>
	</ul>
</div>
</body>
</html>