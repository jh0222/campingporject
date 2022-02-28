<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/stylemain.css"> 
<title>Insert title here</title>
</head>
<body>

	<h3 class="text1">캠핑용품 인기순위<br></h1>
	<div>
	<c:forEach var="p" items="${productrank }">
		<table border="1" class="rank_producttable">
			<tr>
				<td>${p.ROWNUM }</td>
			</tr>
			<tr>				
				<td><img src="resources/img/${p.p_picture }" width="100" height="100"></td>
			</tr>
			<tr>
				<td>${p.p_name }</td>
			</tr>
			<tr>
				<td>${p.p_price }</td>
			</tr>
		</table>
	</c:forEach>
	
</section>

<h3 class="text1">밀키트 인기순위<br></h1>
<c:forEach var="fp" items="${milkitrank }">
		<table border="1" class="rank_milkittable">
			<tr>
				<td>${fp.ROWNUM }</td>
			</tr>
			<tr>				
				<td><img src="resources/img/${fp.fp_picture }" width="100" height="100"></td>
			</tr>
			<tr>
				<td>${fp.fp_name }</td>
			</tr>
			<tr>
				<td>${fp.fp_price }</td>
			</tr>
		</table>
	</c:forEach>
	</div>



</body>
</html>