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

function placeCheck() {
	var form = document.placeForm;
	if (form.cam_name.value == ""){
		alert("캠핑장 이름을 입력해 주세요.");
		form.cam_name.focus();
		return false;
	} else if (form.cam_txt.value == "") {
		alert("캠핑장 상세설명을 입력해 주세요.");
		form.cam_txt.focus();
		return false;
	} else if (form.cam_picture.value == "") {
		alert("캠핑장 사진을 입력해 주세요.");
		form.cam_picture.focus();
		return false;
	} else if (form.cam_phonenumber.value == "") {
		alert("캠핑장 연락처를 입력해 주세요.");
		form.cam_phonenumber.focus();
		return false;
	} else if (isNaN(form.cam_phonenumber.value)) {
		alert("캠핑장 연락처는 숫자만 입력 가능합니다.");
		form.cam_phonenumber.select();
		return false;
	} else if (form.cam_price.value == "") {
		alert("캠핑장 가격을 입력해 주세요.");
		form.cam_price.focus();
		return false;
	} else if (isNaN(form.cam_price.value)) {
		alert("캠핑장 가격은 숫자만 입력 가능합니다.");
		form.cam_price.select();
		return false;
	} else if (form.cam_address.value == "") {
		alert("캠핑장 주소를 입력해 주세요.");
		form.cam_address.focus();
		return false;
	} else if (form.cam_latitude.value == "") {
		alert("위도를 입력해 주세요.");
		form.cam_latitude.focus();
		return false;
	}else if (isNaN(form.cam_latitude.value)) {
		alert("위도는 숫자만 입력 가능합니다.");
		form.cam_latitude.select();
		return false;
	} else if (form.cam_longitude.value == "") {
		alert("경도를 입력해 주세요.");
		form.cam_longitude.focus();
		return false;
	}else if (isNaN(form.cam_longitude.value)) {
		alert("경도는 숫자만 입력 가능합니다.");
		form.cam_longitude.select();
		return false;
	} else if (form.cam_headcount.value == "") {
		alert("정원 수를 입력해 주세요.");
		form.cam_headcount.focus();
		return false;
	}else if (isNaN(form.cam_headcount.value)) {
		alert("정원 수는 숫자만 입력 가능합니다.");
		form.cam_headcount.select();
		return false;
	}
//form.submit();
}
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
	<div style="text-align: center;">				
		<input type="hidden" name="cam_bo_id" value="${sessionScope.loginMember2.bo_id }">
		<button  class="board_write_btn">등록</button>
	</div>
</div>	
</form>
</body>
</html>