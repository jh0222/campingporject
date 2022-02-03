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
<jsp:include page="${myPage }"></jsp:include>
캠핑 용품 구매목록
<c:forEach var="buy" items="${userbuylist }">
	<table border="1">
		<tr>
			<td>상품번호</td>
			<td>${buy.b_p_no }</td>
		</tr>
		<tr>
			<td>상품명</td>
			<td>${buy.b_p_name }</td>
		</tr>
		<tr>
			<td>상품수량</td>
			<td>${buy.b_number }</td>
		</tr>
		<tr>
			<td>구매가격</td>
			<td>${buy.b_number * buy.b_price}</td>
		</tr>
		<tr>
			<td>구매주소지</td>			
			<c:choose>
				<c:when test="${buy.b_new_address !=null}">
					<td>${buy.b_new_address}</td>
				</c:when>
				<c:otherwise>
					<td>${buy.b_u_address}</td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<td>구매날짜</td>
			<td>${buy.b_date }</td>
		</tr>
		<tr>
			<td><button onclick="buydel(${buy.b_no})">취소/환불</button></td>
		</tr>
	</table>
</c:forEach>
<br>
밀키트 구매목록
<c:forEach var="buy" items="${mealbuylist }">
	<table border="1">
		<tr>
			<td>상품번호</td>
			<td>${buy.fb_p_no }</td>
		</tr>
		<tr>
			<td>상품명</td>
			<td>${buy.fb_p_name }</td>
		</tr>
		<tr>
			<td>상품수량</td>
			<td>${buy.fb_number }</td>
		</tr>
		<tr>
			<td>구매가격</td>
			<td>${buy.fb_number * buy.fb_price}</td>
		</tr>
		<tr>
			<td>구매주소지</td>			
			<c:choose>
				<c:when test="${buy.fb_new_address !=null}">
					<td>${buy.fb_new_address}</td>
				</c:when>
				<c:otherwise>
					<td>${buy.fb_u_address}</td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<td>구매날짜</td>
			<td>${buy.fb_date }</td>
		</tr>
		<tr>
			<td><button onclick="buydel(${buy.fb_no})">취소/환불</button></td>
		</tr>
	</table>
</c:forEach>
</body>
</html>