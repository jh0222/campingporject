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
		<li class="menu-v2"><a href="user.info?u_id=${sessionScope.loginMember.u_id}">회원 정보</a></li>
		<li class="menu-v2"><a href="campingjjim?h_u_id=${sessionScope.loginMember.u_id}">좋아요</a></li>
		<li class="menu-v2"><a href="campingreservation?r_u_id=${sessionScope.loginMember.u_id}">예약 캠핑 내역</a></li>
		<li class="menu-v2"><a href="campingreview?c_u_id=${sessionScope.loginMember.u_id}">캠핑후기</a></li>
		<li class="menu-v2"><a href="Cbuylist?b_u_bo_id=${sessionScope.loginMember.u_id}">구매 내역</a></li>
		<li class="menu-v2">
			<a href="Cproductreview?pr_u_bo_id=${sessionScope.loginMember.u_id}">구매후기</a>
		</li>
	</ul>
<p style="font-size: 30px;"><b>커뮤니티</b></p>
	<ul id="nav-v2">
		<li class="menu-v2"><a href="freeboard?f_u_id=${sessionScope.loginMember.u_id}">자유게시판</a></li>
		<li class="menu-v2"><a href="campingtip?tip_u_id=${sessionScope.loginMember.u_id}">캠핑팁</a></li>
		<li class="menu-v2"><a href="recipe?rb_u_id=${sessionScope.loginMember.u_id}">레시피</a></li>
		<li class="menu-v2"><a href="freeboardreview?fr_u_id=${sessionScope.loginMember.u_id}">댓글</a></li>
	</ul>
</div>
</body>
</html>