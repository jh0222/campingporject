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
<jsp:include page="${BossCommunities }"></jsp:include>
<jsp:include page="${community }"></jsp:include>
<c:choose>
	<c:when test="${f.f_no eq null}">
		<h1>작성한 내용이 없습니다.</h1>
	</c:when>
	<c:otherwise>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>조회수</td>
			<td>작성 날짜</td>
		</tr>
	<c:forEach var="f" items="${freeboard}">
		<tr>
			<td>${f.f_no }</td>
			<td><a href="">${f.f_subject }</a></td>
			<!-- 제목 클릭하면 내가 쓴 자유게시판으로 넘어가기 -->
			<td>${f.f_readcount }</td>
			<td><fmt:formatDate value="${f.f_date}"/></td>
		</tr>
	</c:forEach>
	</table>
</c:otherwise>
</c:choose>
</body>
</html>