<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="reg.milkitreview">
			<table>
				
					<tr>
					<td><textarea name="fpr_txt" rows="10"; cols="150"; style="margin-left: 167px; resize: none;"> </textarea>
						<input name="fpr_u_bo_id" type="hidden" value="${sessionScope.loginMember2.bo_id }${sessionScope.loginMember.u_id }"></td>
					</tr> 
						<input name="fp_no" type="hidden" value="${fp.fp_no }">
						<input name="fpr_fp_no" type="hidden" value="${fp.fp_no }">
					<tr>
					<td><button style="padding-left: 1067px; margin-left: 167px; text-align: center;" >등록!!</button></td>
					</tr>
				
			</table>
			</form>
</body>
</html>