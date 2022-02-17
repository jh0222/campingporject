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
<form action="boss_camping.infoupdate?cam_bo_id="${sessionScope.loginMember2.bo_id}
		method="post" enctype="multipart/form-data" name="updateBossForm" onsubmit="return updateBossCheck();">
	<table border="1">
		<c:forEach var="ci" items="${campinginfo}">
			<tr>
				<td>번호</td>
				<td id="cam${ci.cam_no}">${ci.cam_no }</td>
			</tr>
			<tr>
				<td>캠핑명</td>
				<td><input name="name" value="${ci.cam_name }"></td>
			</tr>
			<tr>
				<td>캠핑주소</td>
				<td><input name="address" value="${ci.cam_address }"></td>
			</tr>
			<tr>
				<td>캠핑사진</td>
				<td>
					<img src="resources/img/${ci.cam_picture }"	id="updateMemberPhoto" width="100" height="100"><br> 
					<input type="hidden" name="oldpicture" value="${ci.cam_picture }">
					<input name="newpicture" type="file">
				</td>
			</tr>
			<tr>
				<td>소개</td>
				<td><input name="txt" value="${ci.cam_txt }"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input name="phonenumber" value="${ci.cam_phonenumber }"></td>
			</tr>
			<tr>
				<td>기본가격</td>
				<td><input name="price" value="${ci.cam_price }"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" style="background-color: #FFFFFF;">
					<button>수정</button>
					<button onclick="campingBye('${ci.cam_no}','${ci.cam_bo_id}');" type="button">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</form>
</body>
</html>