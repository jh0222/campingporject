<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#heart a {
	text-decoration: none;
	color: gray;
}

#heart a.on {
	color: red;
}
</style>
<meta charset="UTF-8">
<title>CampingPlace</title>
</head>
<body>
<h2>캠핑장 목록</h2>
${result }
<button onclick="location.href='place.search?searchplace=star'">별점 높은 순</button>
<form action="place.search">
	가격 : <input name="from_p"> ~ <input name="to_p">
	<input name="searchplace" value="p" type="hidden">
	<button>검색</button> 
</form>

<form action="place.search">
		<select name="searchplace">
	    	<option value="placename">캠핑장 이름</option>	  
	    	<option value="placearea">캠핑장 주소</option>
	    </select>
		<input name="search"> <button>검색</button>
</form>
<!-- 
<form action="place.search">
	<select name="place">
	    	<option value="inSeoul">서울</option>
	    	<option value="inGyeonggi">경기도</option>
	        <option value="inGangwon">강원도</option>
	    	<option value="inIncheon">인천</option>
	    	<option value="inChungbuk">충청북도</option>
	    	<option value="inChungnam">충청남도</option>
	    	<option value="inGyeongbuk">경상북도</option>
	    	<option value="inGyeongnam">경상남도</option>
	    	<option value="inJeonbuk">전라북도</option>
	    	<option value="inJeonnam">전라남도</option>
	    	<option value="inJeju">제주</option>
	</select>
	<button>검색</button>
</form>
 -->
<table border="1">
	<tr>
		<th>이름</th> 
		<th>상세설명</th>
		<th>연락처</th>
		<th>가격</th>
		<th>주소</th>
		<th>별점</th>
	</tr>
	
	<c:forEach var="c" items="${places}">
		<tr>
			<td><a href='placedetail.go?r_cam_no=${c.cam_no }&r_u_id=${sessionScope.loginMember.u_id}&cam_no=${c.cam_no }&c_cam_no=${c.cam_no }&cr_cam_no=${c.cam_no }&h_cam_no=${c.cam_no }&h_u_id=${sessionScope.loginMember.u_id}'>${c.cam_name }</a></td>
			<td>${c.cam_txt }</td>
			<td>${c.cam_phonenumber }</td>
			<td><fmt:formatNumber value="${c.cam_price}" pattern="###,###,###" type="currency" /></td>
			<td>${c.cam_address }</td>
			<td><fmt:formatNumber value="${c.star }" pattern="0.0"/></td>
		</tr>
	</c:forEach>
	
</table>
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
        		[${i }]
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
    
<c:if test="${sessionScope.loginMember3.root_id != null || sessionScope.loginMember2.bo_id != null}">
	<button onclick="location.href='placereg.go'">캠핑장 등록하기</button>
</c:if>

<script>


</script>




</body>
</html>