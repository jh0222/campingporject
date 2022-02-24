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
<c:choose>
	<c:when test="${campinginfo.cam_no eq null}">
		<h1>등록된 정보가 없습니다.</h1>
		<button onclick="">캠핑 등록하기</button>
	</c:when>
	<c:otherwise>
<form action="boss_camping.infoupdate?cam_no=${campinginfo.cam_no }&cam_bo_id=${campinginfo.cam_bo_id}"
	method="post" enctype="multipart/form-data" name="updateBossForm" onsubmit="return updateBossCheck();">
	<table border="1">
			<tr>
				<td>캠핑명</td>
				<td><input name="name" value="${campinginfo.cam_name }"></td>
			</tr>
			<tr>
				<td>캠핑주소</td>
				<td><input name="address" value="${campinginfo.cam_address }"></td>
			</tr>
			<tr>
				<td>캠핑사진</td>
				<td>
					<img src="resources/img/${campinginfo.cam_picture }"	id="updateMemberPhoto" width="100" height="100"><br> 
					<input type="hidden" name="oldpicture" value="${campinginfo.cam_picture }">
					<input name="newpicture" type="file">
				</td>
			</tr>
			<tr>
				<td>소개</td>
				<td><input name="txt" value="${campinginfo.cam_txt }"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>  
					<input name="phonenumber" value="${campinginfo.cam_phonenumber }">
				</td>
			</tr>
			<tr>
				<td>기본가격</td>
				<td><input name="price" value="${campinginfo.cam_price }"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" style="background-color: #FFFFFF;">
					<button>수정</button>
					<button onclick="campingBye('${campinginfo.cam_no }','${campinginfo.cam_bo_id}');" type="button">삭제</button>
				</td>
			</tr>
	</table>
</form>
	</c:otherwise>	
</c:choose>
</body>
</html>