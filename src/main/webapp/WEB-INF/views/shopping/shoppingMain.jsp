<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑</title>
</head>
<body>

	<div align="center" style="position:absolute; right:1120px; fixed;">
		<a href="camping.product">캠핑용품</a>
		<a href="camping.milkit">밀키트</a>
	</div>

	<jsp:include page="${shoppigListPage }"></jsp:include>
</body>
</html>