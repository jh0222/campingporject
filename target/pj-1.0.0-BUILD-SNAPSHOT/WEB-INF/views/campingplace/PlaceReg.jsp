<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function(){
	$("#cam_txt").summernote({
		height : 300, width : 800
	});
});
</script>
</head>
<body>
<br>
<div class="board_write_title">캠핑장 등록</div><br><br>

<form action="place.Reg" method="post" enctype="multipart/form-data"
		name="placeForm" onsubmit="return placeCheck();">
	<div class="board_write_content">
		<div class="board_write_subject">캠핑장 이름</div>
		<div><input class="board_write_txt1" name="cam_name"></div>		
	</div>
	<br>
	
	<div class="board_write_content2">
		<div class="board_write_subject2">캠핑장 상세설명</div>
		<div class="board_write_txt2"><textarea name="cam_txt" id="cam_txt" rows="10" cols="80"></textarea></div>
	</div>
	<br>
<div class="place_reg">
	<div class="board_write_subject2">캠핑장 사진
	<input name="cam_picture" type="file"></div>
	
	<div class="board_write_subject2">캠핑장 연락처
	<input name="cam_phonenumber"></div>
		
	<div class="board_write_subject2">캠핑장 가격
	<input  name="cam_price"></div>
	
	<div class="board_write_subject2">캠핑장 주소
	<input name="cam_address"></div>
	
	<div class="board_write_subject2">위도
	<input name="cam_latitude"></div>
	
	<div class="board_write_subject2">경도
	<input name="cam_longitude"></div>
	
	<div class="board_write_subject2">정원 수
	<input name="cam_headcount"></div>
	<br>
	<div class="board_write_subject2">				
		<input type="hidden" name="cam_bo_id" value="${sessionScope.loginMember2.bo_id }">
		<button>등록</button>
	</div>
</div>	
</form>
</body>
</html>