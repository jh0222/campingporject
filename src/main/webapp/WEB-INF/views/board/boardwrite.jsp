<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
${title }
	<form action="${sort }write.insert?${sort2 }_u_id=${sessionScope.loginMember.u_id }${sessionScope.loginMember2.bo_id }"
		method="post" enctype="multipart/form-data"
		name="writeForm" onsubmit="return writeCheck();">
	<table border="1">
		<tr>
			<td>제목</td>
			<td><input name="subject"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea name="txt" id="txt" rows="10" cols="80"></textarea>            	
            </td>
		</tr>
		<tr>
			<td colspan="2" align="center"><button>등록</button></td>
		</tr>
	</table>
	</form>
</body>
</html>