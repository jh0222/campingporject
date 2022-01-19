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
	<table style="margin-top: 25px">
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
	<table border="0" style="position: absolute; width: 100%";>
		<!--  <tr>
			<th>사진</th>
			<th>상품명</th>
			<th>가격</th>
		</tr>
		-->
		<c:set var="i" value="0" />
		<c:set var="j" value="2" />

		<c:forEach var="p" items="${products}">
			<c:if test="${i%j == 0 }">
				<tr>
			</c:if>
			<td><img src="resources/img/${p.p_picture }"
				style="width: 120px; height: 110px;"
				onclick="location.href = 'detail.product?p_no=${p.p_no}&ProductName=${p.p_name}'">
			</td>
			<td onclick="location.href = 'detail.product?p_no=${p.p_no}&ProductName=${p.p_name}'">${p.p_name }</td>

			<td><fmt:formatNumber value="${p.p_price}" type="currency" />
				${p_txt }</td>
			<td><button onclick="del(${p.p_no})">삭제</button></td>
			<c:if test="${i%j == j-1 }">
				</tr>
			</c:if>
			<c:set var="i" value="${i+1 }" />
		</c:forEach>
	</table>

</body>
</html>