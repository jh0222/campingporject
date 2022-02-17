<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="cart/Cart.css">
<script src="/resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<h1>캠핑용품</h1>
<table border="1">
	<tr>
		<td></td>
		<td>상품명</td>
		<td>가격</td>
		<td>수량</td>
		<td>최종가격</td>
	</tr>
 	<c:forEach items="${campingproduct}" var="c">
	<tr>
		<td><img src="resources/img/${c.ba_p_picture}" width="100" height="100"></td>
		<td>${c.ba_p_name}</td>
		<td><fmt:formatNumber pattern="###,###,###" value="${c.ba_price}" /> 원</td>
		<td>${c.ba_number} 개</td>
		<td><fmt:formatNumber pattern="###,###,###" value="${c.ba_price * c.ba_number}"/> 원</td>
	</tr>
	</c:forEach>
</table>

<hr>
<h1>밀키트</h1>
   <table border="1">
	<tr>
		<td></td>
		<td>상품명</td>
		<td>가격</td>
		<td>수량</td>
		<td>최종가격</td>
	</tr>
 	<c:forEach items="${mealkit}" var="m">
	<tr>
		<td><img src="resources/img/${m.fba_fp_picture}" width="100" height="100"></td>
		<td>${m.fba_fp_name}</td>
		<td><fmt:formatNumber pattern="###,###,###" value="${m.fba_price}" /> 원</td>
		<td>${m.fba_number} 개</td>
		<td><fmt:formatNumber pattern="###,###,###" value="${m.fba_price * m.fba_number}"/> 원</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>