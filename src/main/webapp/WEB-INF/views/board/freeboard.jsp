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
자유게시판

	<table border="1">		
		<tr>
			<td>제목</td>
			<td>작성자</td>
			<td>조회수</td>
			<td>작성날짜</td>
		</tr>
		<c:forEach var="f" items="${fb }">
			<tr>
				<td>
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
	
	<c:choose>
		<c:when test = "${pg > block}">
            [<a href="freeboard.go?pg=1">◀◀</a>]
            [<a href="freeboard.go?pg=${fromPage -1}">◀</a>] 
        </c:when>
        <c:otherwise>
            [<span style="color:gray">◀◀</span>]   
            [<span style="color:gray">◀</span>]
        </c:otherwise>
    </c:choose>
    <c:forEach var="i" begin="${fromPage }" end="${toPage }">
      	<c:choose>
	       	<c:when test = "${i == pg }">
        		[${i }]
        	</c:when>        	
      	    <c:otherwise>
        		[<a href="freeboard.go?pg=${i }">${i }</a>]
       		</c:otherwise>
       	</c:choose>
    </c:forEach>       
    <c:choose>
       	<c:when test = "${toPage < allPage }">
       		[<a href="freeboard.go?pg=${toPage + 1}">▶</a>]
            [<a href="freeboard.go?pg=${allPage}">▶▶</a>]
      	</c:when>
     	<c:otherwise>
       		[<span style="color:gray">▶</span>]
            [<span style="color:gray">▶▶</span>]
       	</c:otherwise>       
    </c:choose>
	
	<button onclick="location.href='fbwrite.go'">글쓰기</button></br>
	<form action="fb.search">
		<select name="searchsort">
	    	<option value="f_subject">제목</option>
	    	<option value="f_u_id">작성자</option>
	    </select>
		<input name="search"> <button>검색</button>
	</form>
	
</body>
</html>