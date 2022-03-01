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
<div class="board">
	<table class="table2">
		<tr>
			<td colspan="4" id="titleTd"><span class="title">레시피</span></td>
		</tr>	
	</table>
	<c:forEach var="b" items="${b }">
	<table class="table_recipe">	
		<tr>
			<td colspan="2">
				<a href="rwrite.onego?rb_no=${b.rb_no}&rb_readcount=${b.rb_readcount}">
					<img src="resources/img/${b.rb_picture }" width="300" height="300">
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
	<br>
	<c:choose>
		<c:when test = "${pg > block}">
            [<a href="${c }pg=1">◀◀</a>]
            [<a href="${c }pg=${fromPage -1}">◀</a>] 
        </c:when>
        <c:otherwise>
            [<span style="color:gray">◀◀</span>]   
            [<span style="color:gray">◀</span>]
        </c:otherwise>
    </c:choose>
    <c:forEach var="i" begin="${fromPage }" end="${toPage }">
      	<c:choose>
	       	<c:when test = "${i == pg }">
        		[<span style="font-weight: bolder;">${i }</span>]
        	</c:when>        	
      	    <c:otherwise>
        		[<a href="${c }pg=${i }">${i }</a>]
       		</c:otherwise>
       	</c:choose>
    </c:forEach>       
    <c:choose>
       	<c:when test = "${toPage < allPage }">
       		[<a href="${c }pg=${toPage + 1}">▶</a>]
            [<a href="${c }pg=${allPage}">▶▶</a>]
      	</c:when>
     	<c:otherwise>
       		[<span style="color:gray">▶</span>]
            [<span style="color:gray">▶▶</span>]
       	</c:otherwise>       
    </c:choose>
    
	<c:if test="${sessionScope.loginMember.u_id != null
				|| sessionScope.loginMember2.bo_id != null
				|| sessionScope.loginMember3 != null}">
	<button onclick="location.href='${sort }write.go'">글쓰기</button></br>
	</c:if>
	
	<form action="${sort }.search">
		<select name="searchsort">
	    	<option value="subject">제목</option>
	    	<option value="id">작성자</option>
	    </select>
		<input name="search"> <button>검색</button>
	</form>
</div>	
</body>
</html>