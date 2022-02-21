<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="${myPage }"></jsp:include>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>예약자명</td>
			<td>예약한 전화번호</td>
			<td>전화번호</td>
			<td>예약한 날짜</td>
			<td>예약한 인원수</td>
			<td>최종금액</td>
		</tr>
	<c:forEach var="cr" items="${campingreserve}">
		<tr>
			<td id="cr${cr.r_no }">${cr.r_no}</td>
			<td>${cr.r_u_name}</td>
			<td>${cr.r_u_phonenumber}</td>
			<td>${cr.r_cam_name}</td>
			<td><fmt:formatDate value="${cr.r_campingstartdate}"/> ~ <fmt:formatDate value="${cr.r_campingenddate}"/></td>
			<td>${cr.r_campingheadcount}</td>
			<td>${cr.r_campingprice}</td>
			<td><button onclick="reservedel('${cr.r_no}','${cr.r_u_id }')">예약취소</button></td>
		</tr>
	</c:forEach>
	</table>

</body>
</html>