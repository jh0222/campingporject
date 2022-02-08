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
			<td>작성날짜</td>
		</tr>
	<c:forEach var="r" items="${recipe}">
		<tr>
			<td>${r.rb_no}</td>
			<td><a href="">${r.rb_subject}</a></td>
			<td>${r.rb_readcount}</td>
			<td><fmt:formatDate value="${r.rb_date}"/></td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>