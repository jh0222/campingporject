<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${sucess != null }">
		<div class="search_title">
			비밀번호 재설정
		</div>
		<form onsubmit="return joinCheck2();" name="joinForm" action="pw_search_update" method="post">
			<div class="id_search">
				<div class="id_search2">
					<div class="id_search_title_name">
						비밀번호 
					</div>
					<div class="id_search_txt">
						<input name="pw"  type="password">
					</div>
				</div>
				<div class="id_search2">
					<div class="id_search_title">
						비밀번호확인 &nbsp;
					</div>
					<div class="id_search_txt">
						<input name="pwChk" type="password">
					</div>
				</div>
				<input type="hidden" name="id" value="${sucess}">
				<input type="hidden" name="division" value="${division }">
				<div style="text-align:center;">
					<button class="searchbtn">확인</button>
				</div>
			</div>
		</form>
	</c:when>
	<c:otherwise>
		<div class="idsearch_result">없는 회원 정보입니다</div>
	</c:otherwise>
</c:choose>
</body>
</html>