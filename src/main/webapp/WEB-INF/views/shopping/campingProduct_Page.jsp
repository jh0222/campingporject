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
	<table style="margin-top:15px">
	<tr>
	<td>
		<form action="search.product">
		<input name="p_name">
		<button>검색</button>
	</form>
	</td>
	<td>
	<button onClick="location.href='regproduct.go'">상품등록</button>
	</td>
	</tr>
	</table>
	
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
				</div>
				<td>${p.p_name }</td>
				</div>
				<td><fmt:formatNumber value="${p.p_price}" type="currency" />
					${p_txt }
					</div></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>