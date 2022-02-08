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
			<td colspan="3">캠핑용품 리뷰</td>
		</tr>
		<tr>
			<td>번호</td>
			<td>내용</td>
			<td>작성날짜</td>
		</tr>
	<c:forEach var="pr" items="${productreview}">
		<tr>
			<td>${pr.pr_no}</td>
			<td>${pr.pr_txt}</td>
			<td><fmt:formatDate value="${pr.pr_date}"/></td>
		</tr>
	</c:forEach>
	</table>
<hr>
	<table border="1">
		<tr>
			<td colspan="3">밀키트 리뷰</td>
		</tr>
		<tr>
			<td>번호</td>
			<td>내용</td>
			<td>작성날짜</td>
		</tr>
	<c:forEach var="m" items="${mealreview}">
		<tr>
			<td>${m.fpr_no}</td>
			<td>${m.fpr_txt}</td>
			<td><fmt:formatDate value="${m.fpr_date}"/></td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>