<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
</head>
<body>
<table>
		<tr>
			<td > 
				<a href="home.go">홈</a>
				<a href="">캠핑장</a>
				<a href="">자유게시판</a>
				<a href="">레시피</a>
				<a href="">꿀팁</a>
				<a href="">오픈채팅방</a>
				<a href="shopping.go">쇼핑</a>
			</td>
		</tr>
		
		<tr>
			<td>
				<jsp:include page="${contentPage }"></jsp:include>	
			</td>
		</tr>
	</table>
</body>
</html>