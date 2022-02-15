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
<jsp:include page="${myPage}"></jsp:include>
<jsp:include page="${community}"></jsp:include>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>내용</td>
			<td>작성날짜</td>
			<td colspan="2" align="center">수정/삭제</td>
		</tr>
	<c:forEach var="f" items="${freeboardreview}">
		<tr>
			<td id="fu${f.fr_no}">${f.fr_no}</td>
			<td><input name="fr_replytxt" value="${f.fr_replytxt}"></td>
			<td><fmt:formatDate value="${f.fr_date}"/></td>
			<td><button onclick="freeboardreviewup('${f.fr_no}','${f.fr_u_id}')">수정</button></td>
			<td><button onclick="freeboardreviewdel('${f.fr_no}','${f.fr_u_id}')">삭제</button></td>	
		</tr>
	</c:forEach>
	</table>
</body>
</html>