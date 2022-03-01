<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="idsearch_result">
<c:choose>
	<c:when test="${id !=null }">
		당신의 아이디는 ${fn:substring(id,0,fn:length(id) - 2) } 
		<c:forEach var="i" begin="${fn:length(id) }" end="${fn:length(id) + 1}">
			*
		</c:forEach>
		입니다.
	</c:when>
	<c:otherwise>
		없는 회원정보입니다.
	</c:otherwise>
</c:choose>
</div>
</body>
</html>