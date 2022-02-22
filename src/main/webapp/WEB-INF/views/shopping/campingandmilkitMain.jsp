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
 


<section>
	<h3 class="text1">캠핑용품 인기순위<br></h1>
	<div class="campingrank">
	<c:forEach var="p" items="${productrank }">
		<table border="1" class="table_product">
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
	
	</div>
</section>
</body>
</html>