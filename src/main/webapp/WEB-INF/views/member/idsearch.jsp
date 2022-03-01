<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
<div class="search_title">아이디 찾기</div>
<form action="id.search">
	<div class="id_search">
		<div class="search_title2">가입했던 이름과 전화번호를 적어주세요.</div>
		<div class="id_search2">
			<div class="id_search_title_name">
				이름
			</div>
			<div class="id_search_txt">
				<input name="name" placeholder="ex) 김태희">
			</div>
		</div>
		<div class="id_search2">
			<div class="id_search_title">
				전화번호&nbsp;&nbsp;
			</div>
			<div class="id_search_txt">
				<input name="phonenumber" placeholder="ex) 01000000000">
			</div>
		</div>
		<div style="text-align:center;">
		<button class="searchbtn">찾기</button>
		</div>
	</div>
</form>
</body>
</html>