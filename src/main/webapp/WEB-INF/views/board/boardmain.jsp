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
<div class="recipe_popular_board">
<h1>인기 레시피 게시판</h1>
<div class="more_board_recipe">
<a href="freeboard.go">
	더보기>
</a>
</div>
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
</div>
<br>
<div class="text_board">
	<div class="text_board_1">
		<h1>인기 자유게시판</h1>
		<div class="more_board">
			<a href="freeboard.go">
				더보기>
			</a>
		</div>
		<hr>
		<c:forEach var="f" items="${fb }">
			<div class="popular_board">
				<div class="popular_subject">
					<a href="fbwrite.onego?f_no=${f.f_no}&f_readcount=${f.f_readcount}">${f.f_subject }</a>
				</div>
				${f.f_readcount }
				<br>
			</div>
		</c:forEach>	
	</div>
	<div class="text_board_1">
		<h1>인기 캠핑팁 게시판</h1>
		<div class="more_board">
			<a href="freeboard.go">
				더보기>
			</a>
		</div>
		<hr>
		<c:forEach var="c" items="${cb }">
			<div class="popular_board">
				<div class="popular_subject">
					<a href="ctwrite.onego?tip_no=${c.tip_no}&tip_readcount=${c.tip_readcount}">${c.tip_subject }</a>
				</div>
				${c.tip_readcount }
			</div>
		</c:forEach>	
	</div>
</div>

</body>
</html>