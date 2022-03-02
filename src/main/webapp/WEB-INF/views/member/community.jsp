<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br><p style="font-size: 20px;"><b>댓글</b></p><br>
<br><a href="freeboardreview?fr_u_id=${sessionScope.loginMember.u_id}">자유게시판</a> / <a href="campingtip?tip_u_id=${sessionScope.loginMember.u_id}">캠핑팁</a> / <a href="recipe?rb_u_id=${sessionScope.loginMember.u_id}">레시피</a><br>
</body>
</html>