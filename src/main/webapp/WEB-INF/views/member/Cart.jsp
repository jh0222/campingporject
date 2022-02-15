<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>캠핑용품 장바구니 목록</h1>
		<table>
			<tr>
				<td>상품명</td>
				<td>가격</td>
				<td>수량</td>
				<td>총합</td>
			</tr>
			<c:forEach var="c" items="${Carts }">
			<tr>
				<td>${c.ba_p_name }</td>
				<td><fmt:formatNumber value="${c.ba_price }" type="currency"/></td>
				<td>${c.ba_number}</td>
				<td>${c.ba_price }*${c.ba_number}</td>
			</tr>
			</c:forEach>
		</table>
<br>
	<h1>밀키트 장바구니 목록</h1>
		<table>
			<tr>
				<td>상품명</td>
				<td>가격</td>
				<td>수량</td>
				<td>총합</td>
			</tr>
			<c:forEach var="c" items="${Carts }">
			<tr>
				<td>${c.fba_fp_name }</td>
				<td><fmt:formatNumber value="${c.fba_price }" type="currency"/></td>
				<td>${c.fba_number}</td>
				<td>${c.fba_price }*${c.fba_number}</td>
			</tr>
			</c:forEach>
		</table>
</body>
</html>