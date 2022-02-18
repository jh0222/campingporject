<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<form action="reg.productreview" name="reviewcheck" onsubmit="check();">
			<table>
				
					<tr>
					<td><textarea name="pr_txt" rows="2"; cols="150"; style="margin-left: 167px; resize: none;"> </textarea>
						<input name="pr_u_bo_id" type="hidden" value="${sessionScope.loginMember2.bo_id }${sessionScope.loginMember.u_id }"></td>
					</tr> 
						<input name="p_no" type="hidden" value="${p.p_no }"> 
						<input name="pr_p_no" type="hidden" value="${p.p_no }">
					<tr>
					<td><button style="padding-left: 1067px; margin-left: 167px; text-align: center;" >등록!!</button></td>
					</tr>
					
				
			</table>
			</form>
</body>
</html>