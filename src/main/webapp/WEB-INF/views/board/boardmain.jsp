<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>인기 자유게시판</h1>
<a href="freeboard.go">
	자유게시판으로 가기<img src="resources/img/free-icon-curved-up-arrow-20901.png" width="15" height="15">
</a>
	<table border="1">	
		<tr>
			<th class="subject">제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성날짜</th>
		</tr>
		<c:forEach var="f" items="${fb }">
			<tr>
				<td class="subject">
					<a href="fbwrite.onego?f_no=${f.f_no}&f_readcount=${f.f_readcount}">${f.f_subject }</a>
				</td>
				<td>
					${f.f_u_id }
				</td>
				<td>
					${f.f_readcount }
				</td>
				<td>
					<fmt:formatDate value="${f.f_date }"/> 
				</td>
			</tr>	
		</c:forEach>	
	</table>
<hr>
<h1>인기 캠핑팁 게시판</h1>
<a href="freeboard.go">
	캠핑팁게시판으로 가기<img src="resources/img/free-icon-curved-up-arrow-20901.png" width="15" height="15">
</a>
	<table border="1">	
		<tr>
			<th class="subject">제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성날짜</th>
		</tr>
		<c:forEach var="c" items="${cb }">
			<tr>
				<td class="subject">
					<a href="ctwrite.onego?tip_no=${c.tip_no}&tip_readcount=${c.tip_readcount}">${c.tip_subject }</a>
				</td>
				<td>
					${c.tip_u_id }
				</td>
				<td>
					${c.tip_readcount }
				</td>
				<td>
					<fmt:formatDate value="${c.tip_date }"/> 
				</td>
			</tr>	
		</c:forEach>	
	</table>
<hr>
<h1>인기 레시피 게시판</h1>
<a href="freeboard.go">
	레시피게시판으로 가기<img src="resources/img/free-icon-curved-up-arrow-20901.png" width="15" height="15">
</a>
<br>
	<c:forEach var="b" items="${rb }">
	<table class="table_recipe">	
		<tr>
			<td colspan="2">
				<a href="rwrite.onego?rb_no=${b.rb_no}&rb_readcount=${b.rb_readcount}">
					<img src="resources/img/${b.rb_picture }" width="200" height="200">
				</a>
			</td>
		</tr>
		<tr>  
			<td>
				<a href="rwrite.onego?rb_no=${b.rb_no}&rb_readcount=${b.rb_readcount}">${b.rb_subject }</a>
			</td>			
		</tr>	
		<tr>
			<td>
				${b.rb_u_id }
			</td>
			<td>
				조회수:${b.rb_readcount }
			</td>
		</tr>
	</table>
	</c:forEach>
</body>
</html>