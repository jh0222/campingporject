<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑용품</title>
</head>
<body>
	<h3>캠핑용품페이지</h3>
	<button onClick="location.href='reg.product'">상품등록</button>

	<h3>상품목록</h3>
	<table border="1">
		<tr>
			<th>사진</th>
			<th>상품명</th>
			<th>가격</th>
		</tr>

		<c:forEach var="p" items="${products}">

			<tr>
				<td><img src="resources/img/${p.p_picture }"
					style="width: 120px; height: 110px;"></td>
				<td>${p.p_name }</td>
				<td><fmt:formatNumber value="${p.p_price}" pattern="###,###,###"
						type="currency" /></td>
				<!--상품가격의 가독성을 높이기 위해 숫자3자리마다 콤마  -->
			</tr>
		</c:forEach>
	</table>

</body>
</html>