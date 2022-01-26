<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>이름</td>
			<td>${Mypagelist.u_name}</td>
		</tr>
		<tr>
			<td>ID</td>
			<td>${Mypagelist.u_id}</td>
		</tr>
		<tr>
			<td>PW</td>
			<td>${Mypagelist.u_pw}</td>
		</tr>
		<tr>
			<td>email</td>
			<td>${Mypagelist.u_email}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${Mypagelist.u_address}</td>
		</tr>
	</table>
	<input type="button" value="수정">
</body>
</html>