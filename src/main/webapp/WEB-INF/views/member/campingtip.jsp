<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="${myPage }"></jsp:include>
<jsp:include page="${community }"></jsp:include>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>조회수</td>
			<td>작성 날짜</td>
		</tr>
	<c:forEach var="ct" items="${campingtip}">
		<tr>
			<td>${ct.tip_no}</td>
			<td><a href="">${ct.tip_subject}</a></td>
			<td>${ct.tip_readcount}</td>
			<td><fmt:formatDate value="${ct.tip_date}"/></td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>