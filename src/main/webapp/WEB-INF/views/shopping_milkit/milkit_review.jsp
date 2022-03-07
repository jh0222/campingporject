<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="reg.milkitreview" name="reviewcheck" onsubmit="return Check2();">
			<div class="pr_reviewtd1"><h3 class="pr_reviewh3">리뷰작성</h3></div>
			<table>
					<tr>
					<td><textarea name="fpr_txt" placeholder="내용을 입력해 주세요."  class="pr_reviewtext"></textarea>
						<input name="fpr_u_bo_id" type="hidden" value="${sessionScope.loginMember2.bo_id }${sessionScope.loginMember.u_id }"></td>
					</tr> 
						<input name="fp_no" type="hidden" value="${fp.fp_no }"> 
						<input name="fpr_fp_no" type="hidden" value="${fp.fp_no }">
					<tr>
					<td><input type="submit" class="pr_reviewregbtn" value="등록"></td>

					</tr>
					
				
			</table>
			</form>
</body>
</html>