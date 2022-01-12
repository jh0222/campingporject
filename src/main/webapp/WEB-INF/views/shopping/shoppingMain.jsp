<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑</title>
</head>
<body>

	<div align="center">
		<a href="camping.product">캠핑용품</a>
		<a href="camping.milkit">밀키트</a>
	</div>
	
	<button onClick="location.href='regProduct.jsp'">jsp페이지이동</button>

	<jsp:include page="${shoppigListPage }"></jsp:include>
</body>
</html>