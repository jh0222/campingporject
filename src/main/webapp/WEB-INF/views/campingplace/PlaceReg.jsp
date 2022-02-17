<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="place.Reg" method="post" enctype="multipart/form-data"
		name="placeForm" onsubmit="return placeCheck();">
	<table border="1">
		<tr>
			<td>캠핑장 이름</td>
			<td><input name="cam_name"></td>		
		</tr>
		<tr>
			<td>캠핑장 사진</td>
			<td><input name="cam_picture" type="file"></td>
		</tr>
		<tr>
			<td>캠핑장 상세설명</td>
			<td><input name="cam_txt"></td>
		</tr>
		<tr>
			<td>캠핑장 연락처</td>
			<td><input name="cam_phonenumber"></td>
		</tr>
		<tr>
			<td>캠핑장 가격</td>
			<td><input name="cam_price"></td>
		</tr>
		<tr>
			<td>캠핑장 주소</td>
			<td><input name="cam_address"></td>
		</tr>
		<tr>
			<td>위도</td>
			<td><input name="cam_latitude"></td>
		</tr>	
		<tr>
			<td>경도</td>
			<td><input name="cam_longitude"></td>
		</tr>
		<tr>
			<td>정원 수</td>
			<td><input name="cam_headcount"></td>
		</tr>
		<tr>
			<td colspan="2">				
				<input type="hidden" name="cam_bo_id" value="${sessionScope.loginMember2.bo_id }">
				<button>등록</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>