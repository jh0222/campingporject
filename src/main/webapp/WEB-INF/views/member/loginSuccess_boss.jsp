<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>			
			<td>${sessionScope.loginMember2.bo_id }사장님</td>
			<td>(${sessionScope.loginMember2.bo_name })</td>
			<td>
				<button>장바구니</button>
				<button onclick="goMemberInfo()">내 정보</button>
				<button onclick="logout()">로그아웃</button>
			</td>
		<tr>
	</table>
</body>
</html>