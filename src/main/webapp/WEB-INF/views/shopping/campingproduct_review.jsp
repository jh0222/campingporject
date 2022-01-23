<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

			<table>
				<form action="reg.productreview?pr_u_id=${sessionScope.loginMember2.bo_id }${sessionScope.loginMember.u_id }">
					<tr><td><textarea name="pr_txt" rows="10"; cols="150"; style="margin-left: 167px; resize: none;"></textarea></td></tr> 
					<tr><td><button style="padding-left: 1067px; margin-left: 167px;text-align: center;" >등록</button></td></tr>
				</form>
			</table>
</body>
</html>