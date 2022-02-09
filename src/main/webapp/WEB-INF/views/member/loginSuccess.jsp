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
<c:choose>
<c:when test="${sessionScope.loginMember.u_id != null}">
	<table>
		<tr>	
			<td onclick="location.href='home'">홈</td>		
			<td>${sessionScope.loginMember.u_id }</td>
			<td>(${sessionScope.loginMember.u_name })</td>
			<td>
				<button>장바구니</button>
				<button onclick="goMemberInfo()">내 정보</button>
				<button onclick="logout()">로그아웃</button>
			</td>
		<tr>
	</table>
</c:when>
<c:when test="${sessionScope.loginMember2.bo_id != null}">
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
</c:when>
<c:when test="${sessionScope.loginMember3.root_id != null}">
	<table>
		<tr>			
			<td>${sessionScope.loginMember3.root_id }</td>
			<td>(관리자)</td>
			<td>
				<button>장바구니</button>
				<button onclick="goMemberInfo()">내 정보</button>
				<button onclick="logout()">로그아웃</button>
			</td>
		<tr>
	</table>
</c:when>
</c:choose>
</body>
</html>