<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function(){
	$('#txt').summernote({
		height : 300, width : 800
	});
});
</script>
</head>
<body>
<div class="board_write_title">레시피</div>
		<form action="rwrite.update?rb_no=${fb.rb_no}"
			method="post" enctype="multipart/form-data"
			name="writeForm" onsubmit="return writeCheck();">
			<div class="board_write_content">
				<div class="board_write_subject">제목</div>
				<div><input class="board_write_txt1" name="subject" value="${fb.rb_subject }"></div>
			</div>
			<div class="board_write_content2">
				<div class="board_write_subject2">내용</div>
				<div class="board_write_txt2"><textarea name="txt" id="txt" rows="10" cols="80">${fb.rb_txt }</textarea></div>
			</div>
			<div class="board_write_content">
				<div class="board_write_subject3">썸네일 사진</div>
				<div>
					<input class="board_write_txt1" name="new_picture" type="file">            	
					<input name="old_picture" value="${fb.rb_picture }" type="hidden">	
           		</div>
           	</div>
			<div style="text-align: center;">
				<button class="board_write_btn">수정</button>
			</div>
		</form>
</body>
</html>