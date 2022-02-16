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
레시피
		<form action="rwrite.update?rb_no=${fb.rb_no}"
			method="post" enctype="multipart/form-data"
			name="writeForm" onsubmit="return writeCheck();">
		<table border="1">		
			<tr>
			<td>제목</td>
			<td><input name="subject" value="${fb.rb_subject }"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="txt" id="txt" rows="10" cols="80">${fb.rb_txt }</textarea>	            	
            	</td>
			</tr>
			<tr>
				<td>썸네일 사진</td>
				<td>
					<input name="old_picture" value="${fb.rb_picture }" type="hidden">	
					<input name="new_picture" type="file">            	
            	</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><button>수정</button></td>
			</tr>
		</table>
		</form>
		<button>삭제</button>
</body>
</html>