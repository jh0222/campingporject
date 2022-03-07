<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
<div class="board_write_title">캠핑장 수정</div><br><br>

<form action="place.Update?cam_no=${places.cam_no }" method="post" enctype="multipart/form-data"
		name="placeForm" onsubmit="return placeCheck();">
	<div class="board_write_content">
		<div class="board_write_subject">캠핑장 이름</div>
		<div><input class="board_write_txt1" name="cam_name" value="${places.cam_name }"></div>		
	</div>
	<br>
	
	<div class="board_write_content2">
		<div class="board_write_subject2">캠핑장 상세설명</div>
		<div class="board_write_txt2"><textarea name="cam_txt" id="cam_txt" rows="10" cols="80">${places.cam_txt }</textarea></div>
	</div>
	<br>
	

	<div class="board_write_subject2">캠핑장 사진<br>
	<img src="resources/img/${places.cam_picture }" width="300" height="200">
	<input name="new_picture" type="file"><input name="old_picture" type="hidden" value="${places.cam_picture }">
	</div>
	
	<div class="board_write_subject2">캠핑장 연락처
	<input name="cam_phonenumber" value="${places.cam_phonenumber }"></div>
		
	<div class="board_write_subject2">캠핑장 가격
	<input name="cam_price"  value="${places.cam_price }"></div>
	
	<div class="board_write_subject2">캠핑장 주소
	<input name="cam_address" value="${places.cam_address }"></div>
	
	<div class="board_write_subject2">위도
	<input name="cam_latitude" value="${places.cam_latitude }"></div>
	
	<div class="board_write_subject2">경도
	<input name="cam_longitude" value="${places.cam_longitude }"></div>
	
	<div class="board_write_subject2">정원 수
	<input name="cam_headcount" value="${places.cam_headcount }"></div>
	
	<div style="text-align: center;">		
	<input type="hidden" name="cam_bo_id" value="${sessionScope.loginMember2.bo_id }">
	<button class="board_write_btn">수정</button>
	</div>

</form>
</body>
</html>