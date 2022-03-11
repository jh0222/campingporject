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
	} else if (form.new_picture.value == "" && form.old_picture.value == "") {
		alert("캠핑장 사진을 입력해 주세요.");
		//form.cam_picture.focus();
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
<h3 class="regh3_2" style="font-size: 30px;"><b>캠핑장 수정</b></h3>

<form action="place.Update?cam_no=${places.cam_no }" method="post" enctype="multipart/form-data"
		name="placeForm" onsubmit="return placeCheck();">
	 <table border="1" class="pr_regtb2">
        <tr class="active">
            <td class="pr_regtd" style="font-size: 20px;">캠핑장 이름</td>
		<td><input name="cam_name" value="${places.cam_name }"></td>	
		</tr>
        <tr>
            <td class="pr_regtd" style="font-size: 20px;">캠핑장 상세설명</td>
			<td><textarea name="cam_txt" rows="10" cols="80">${places.cam_txt }</textarea></td>
		</tr>
		<tr >
            <td class="pr_regtd" style="font-size: 20px;">캠핑장 사진</td>
			<td>
				<img src="resources/img/${places.cam_picture }" width="300" height="200">
				<input name="new_picture" type="file"><input name="old_picture" type="hidden" value="${places.cam_picture }">
			</td>
		</tr>	
		<tr>
            <td class="pr_regtd" style="font-size: 20px;">캠핑장 연락처</td>
			<td><input name="cam_phonenumber" value="${places.cam_phonenumber }"></td>
		<tr>
            <td class="pr_regtd" style="font-size: 20px;">캠핑장 가격</td>
			<td><input name="cam_price"  value="${places.cam_price }"></td>
		</tr>
		<tr>
            <td class="pr_regtd" style="font-size: 20px;">캠핑장 주소</td>
			<td><input name="cam_address" value="${places.cam_address }"></td>
		</tr>
		<tr>
            <td class="pr_regtd" style="font-size: 20px;">위도</td>
			<td><input name="cam_latitude" value="${places.cam_latitude }"></td>
		</tr>
		<tr>
            <td class="pr_regtd" style="font-size: 20px;">경도</td>
			<td><input name="cam_longitude" value="${places.cam_longitude }"></td>
		</tr>
		<tr>
            <td class="pr_regtd" style="font-size: 20px;">정원 수</td>
			<td><input name="cam_headcount" value="${places.cam_headcount }"></td>
		</tr>
	</table>
	<input type="hidden" name="cam_bo_id" value="${sessionScope.loginMember2.bo_id }">
	<button class="pr_regbtn">수정</button>
</form>
</body>
</html>