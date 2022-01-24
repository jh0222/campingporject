<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CampingPlace</title>
</head>
<body>
${result }
<table border="1">
	<tr>
		<th>이름</th>
		<th>상세설명</th>
		<th>연락처</th>
		<th>가격</th>
		<th>주소</th>
	</tr>
	<tr>
			<td>${places.cam_name }</td>
			<td>${places.cam_txt }</td>
			<td>${places.cam_phonenumber }</td>
			<td><fmt:formatNumber value="${places.cam_price}" pattern="###,###,###" type="currency" /></td>
			<td>${places.cam_address }</td>			
			<td><img src="resources/img/${places.cam_picture }" width="300" height="200"></td>
		
		<!-- 자신의 아이디일 경우 -->
		<c:if test="${sessionScope.loginMember2.bo_id == places.cam_bo_id}">
			<td><button onclick="placedelete(${places.cam_no});">삭제</button></td>
			<td><button onclick="location.href='placeup.go?cam_no=${places.cam_no}'">수정</button></td>
		</c:if>
	</tr>

</table>
<h4>캠핑장 리뷰</h4>
<c:if test="${sessionScope.loginMember.u_id }">
<table border="1">
	<tr>
		<td>ID</td> 
		<td colspan="2">				
			<input name="review" >
		</td>
		<td> 
		<button onclick="location.href='review.Reg'">리뷰등록</button></td>
	</tr>
</table>
</c:if>

<table border="1">
	<c:forEach var="r" items="${reviews}">
	<tr>
		<td>${r.c_u_id }</td>
	</tr>
	<tr>
		<td>${r.c_campingreview }</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>