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
<jsp:include page="${BossCommunities }"></jsp:include>
캠핑 용품 구매목록
<c:forEach var="p" items="${pbuylist }">
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
			<td>${p.b_p_no }</td>
			<td>${p.b_p_name }</td>
			<td>${p.b_number }</td>
			<td>${p.b_number * p.b_price}</td>		
			<c:choose>
				<c:when test="${p.b_new_address !=null}">
					<td>${p.b_new_address}</td>
				</c:when>
				<c:otherwise>
					<td>${p.b_u_address}</td>
				</c:otherwise>
			</c:choose>
			<td><fmt:formatDate value="${p.b_date }"/></td>
			<td><button onclick="buyproductdel('${p.b_no}','${p.b_u_bo_id}')">취소/환불</button></td>
		</tr>
	</table>
</c:forEach>
<br>
밀키트 구매목록
<c:forEach var="p" items="${mbuylist }">
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
			<td>${p.fb_p_no }</td>
			<td>${p.fb_p_name }</td>
			<td>${p.fb_number }</td>
			<td>${p.fb_number * p.fb_price}</td>
			<c:choose>
				<c:when test="${p.fb_new_address !=null}">
					<td>${p.fb_new_address}</td>
				</c:when>
				<c:otherwise>
					<td>${p.fb_u_address}</td>
				</c:otherwise>
			</c:choose>
			<td><fmt:formatDate value="${p.fb_date }"/></td>
			<td><button onclick="buymealdel('${p.fb_no}','${p.fb_u_bo_id }')">취소/환불</button></td>
		</tr>
	</table>
</c:forEach>
</body>
</html>