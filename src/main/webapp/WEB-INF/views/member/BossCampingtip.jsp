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
	<jsp:include page="${BossCommunities }"></jsp:include>
	<jsp:include page="${community }"></jsp:include>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>조회수</td>
			<td>작성 날짜</td>
		</tr>
		<c:forEach var="ct" items="${campingtip}">
			<c:choose>
				<c:when test="${ct.tip_no eq null}">
					<h1>작성된 내용이 없습니다.</h1>
				</c:when>
				<c:otherwise>
					<tr>
						<td>${ct.tip_no}</td>
						<td><a href="">${ct.tip_subject}</a></td>
						<td>${ct.tip_readcount}</td>
						<td><fmt:formatDate value="${ct.tip_date}" /></td>
					</tr>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</table>
</body>
</html>