<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			<td>상품명</td>
			<td>상품수량</td>
			<td>구매가격</td>
			<td>구매주소지</td>
			<td>구매날짜</td>
			<td colspan="2" align="center">취소/환불</td>
		</tr>
		<tr>
			<td>${buy.b_p_no }</td>
			<td>${buy.b_p_name }</td>
			<td>${buy.b_number }</td>
			<td>${buy.b_number * buy.b_price}</td>		
			<c:choose>
				<c:when test="${buy.b_new_address !=null}">
					<td>${buy.b_new_address}</td>
				</c:when>
				<c:otherwise>
					<td>${buy.b_u_address}</td>
				</c:otherwise>
			</c:choose>
			<td><fmt:formatDate value="${buy.b_date }"/></td>
			<td><button onclick="buyproductdel('${buy.b_no}','${buy.b_u_bo_id}')">취소/환불</button></td>
		</tr>
	</table>
</c:forEach>
<br>
밀키트 구매목록
<c:forEach var="buy" items="${mealbuylist }">
	<table border="1">
		<tr>
			<td>상품번호</td>
			<td>상품명</td>
			<td>상품수량</td>
			<td>구매가격</td>
			<td>구매주소지</td>
			<td>구매날짜</td>
			
		</tr>
		<tr>
			<td>${buy.fb_p_no }</td>
			<td>${buy.fb_p_name }</td>
			<td>${buy.fb_number }</td>
			<td>${buy.fb_number * buy.fb_price}</td>
			<c:choose>
				<c:when test="${buy.fb_new_address !=null}">
					<td>${buy.fb_new_address}</td>
				</c:when>
				<c:otherwise>
					<td>${buy.fb_u_address}</td>
				</c:otherwise>
			</c:choose>
			<td><fmt:formatDate value="${buy.fb_date }"/></td>
			<td><button onclick="buymealdel('${buy.fb_no}','${buy.fb_u_bo_id }')">취소/환불</button></td>
		</tr>
	</table>
</c:forEach>
</body>
</html>