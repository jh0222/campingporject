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
<h2>캠핑장 목록</h2>
${result }
<table border="1">
	<tr>
		<th>이름</th>
		<th>상세설명</th>
		<th>연락처</th>
		<th>가격</th>
		<th>주소</th>
		<th>별점</th>
	</tr>
	<c:forEach var="c" items="${places}">
		<tr>
			<td><a href='placedetail.go?cam_no=${c.cam_no }&c_cam_no=${c.cam_no }'>${c.cam_name }</a></td>
			<td>${c.cam_txt }</td>
			<td>${c.cam_phonenumber }</td>
			<td><fmt:formatNumber value="${c.cam_price}" pattern="###,###,###" type="currency" /></td>
			<td>${c.cam_address }</td>
			<td>${c.star }</td>
			<td>
			<form action="placelike2.go"> 
					<input type="hidden" name="h_cam_no" value="${c.cam_no }" />
					<input type="hidden" name="h_u_id" value="${sessionScope.loginMember.u_id}" /> 
					<input type="hidden" name="h_cam_name" value="${c.cam_name }" /> 
					<input type="hidden" name="h_cam_address" value="${c.cam_address }" /> 
					<input type="hidden" name="h_campingheart" value="1" /> 
					<button>찜</button>
			</form>
			</td>
		</tr>
	</c:forEach>
</table>
<c:if test="${sessionScope.loginMember3.root_id != null || sessionScope.loginMember2.bo_id != null}">
	<button onclick="location.href='placereg.go'">캠핑장 등록하기</button>
</c:if>
</body>
</html>