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
			<td colspan="5" align="center">캠핑용품 리뷰</td>
		</tr>
		<tr>
			<td>번호</td>
			<td>내용</td>
			<td>작성날짜</td>
			<td colspan="2" align="center">수정/삭제</td>
		</tr>
	<c:forEach var="pr" items="${productreview}">
		<tr>
			<td id="pru${pr.pr_no}">${pr.pr_no}</td>
			<td><input name="pr_txt" value="${pr.pr_txt}"></td>
			<td><fmt:formatDate value="${pr.pr_date}"/></td>
			<td><button onclick="productreviewup('${pr.pr_no}','${pr.pr_u_bo_id}')">수정</button></td>
			<td><button onclick="productreviewdel('${pr.pr_no}','${pr.pr_u_bo_id}')">삭제</button></td>
		</tr>
	</c:forEach>
	</table>
<hr>
	<table border="1">
		<tr>
			<td colspan="5" align="center">밀키트 리뷰</td>
		</tr>
		<tr>
			<td>번호</td>
			<td>내용</td>
			<td>작성날짜</td>
			<td colspan="2" align="center">수정/삭제</td>
		</tr>
	<c:forEach var="m" items="${mealreview}">
		<tr>
			<td id="fpru${m.fpr_no}">${m.fpr_no}</td>
			<td><input name="fpr_txt" value="${m.fpr_txt}"></td>
			<td><fmt:formatDate value="${m.fpr_date}"/></td>
			<td><button onclick="mealreviewup('${m.fpr_no}','${m.fpr_u_bo_id}')">수정</button></td>
			<td><button onclick="mealreviewdel('${m.fpr_no}','${m.pr_u_bo_id}')">삭제</button></td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>