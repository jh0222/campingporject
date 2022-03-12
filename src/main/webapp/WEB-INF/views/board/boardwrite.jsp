<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(function(){
	$("#txt").summernote({
		height : 300, width : 800
	});
});
</script>
</head>
<body> 
<div class="board_write_title">${title }</div>
	<form action="${sort }write.insert?${sort2 }_u_id=${sessionScope.loginMember.u_id }${sessionScope.loginMember2.bo_id }"
		method="post" enctype="multipart/form-data"
		name="writeForm" onsubmit="return writeCheck();">
		<div class="board_write_content">
			<div class="board_write_subject">제목</div>
			<div><input  class="board_write_txt1" name="subject"></div>
		</div>
		<div class="board_write_content2">
			<div class="board_write_subject2">내용</div>
			<div class="board_write_txt2"><textarea name="txt" id="txt" rows="10" cols="80"></textarea></div>         	
		</div>
		<div class="board_write_content3">
		<c:if test="${r != null }">
			<div class="board_write_subject">썸네일 사진&nbsp;&nbsp;<input name="picture" type="file"></div>
		</c:if>
		</div>
		<div style="text-align: center;">
			<button class="board_write_btn">등록</button>
		</div>
	</form>
</body>
</html>