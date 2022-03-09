<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>		
			<form action="reg.productreview" name="reviewcheck" onsubmit="return Check1();">
			<div class="pr_reviewtd1"><h3 class="pr_reviewh3">리뷰작성</h3></div>
			<table>
					<tr>
					<td><textarea name="pr_txt" placeholder="내용을 입력해 주세요."  class="pr_reviewtext"></textarea>
						<input name="pr_u_bo_id" type="hidden" value="${sessionScope.loginMember2.bo_id }${sessionScope.loginMember.u_id }"></td>
					</tr> 
						<input name="p_no" type="hidden" value="${p.p_no }"> 
						<input name="pr_p_no" type="hidden" value="${p.p_no }">
					<tr>
					<td><input type="submit" class="pr_reviewregbtn" value="등록"></td>
					</tr>
					
				
			</table>
			</form>
</body>
</html>