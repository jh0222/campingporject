<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
$(function() {
	$('#star a').click(function(){ 
		 $(this).parent().children("a").removeClass("on");    
		 $(this).addClass("on").prevAll("a").addClass("on");
		 console.log($(this).attr("value"));
	});
});


</script>
<style type="text/css">
#star a{
   text-decoration: none;
   color: gray;
  }
  #star a.on{
   color: red;
  } 
</style>
<meta charset="UTF-8">
<title>CampingPlace</title>
</head>
<body>

${result }
<br>
<div style="float:left">
<table border="1">
	<tr>
		<th>이름</th>
		<th>상세설명</th>
		<th>연락처</th>
		<th>가격</th>
		<th>주소</th>
	</tr>
	<tr>
			<td>${places.cam_name }</td>
			<td>${places.cam_txt }</td>
			<td>${places.cam_phonenumber }</td>
			<td><fmt:formatNumber value="${places.cam_price}" pattern="###,###,###" type="currency" /></td>
			<td>${places.cam_address }</td>			
			<td><img src="resources/img/${places.cam_picture }" width="300" height="200"></td>
		
		<!-- 자신의 아이디일 경우 -->
		<c:if test="${sessionScope.loginMember2.bo_id == places.cam_bo_id}">
			<td><button onclick="placedelete(${places.cam_no});">삭제</button></td>
			<td><button onclick="location.href='placeup.go?cam_no=${places.cam_no}'">수정</button></td>
		</c:if>
	</tr>
</table>
</div>

<div style="float:right">
<c:if test=""></c:if>
<form action="review.Reg">
<table border="1" style="width:500;">
	<tr>
		<td>ID:${sessionScope.loginMember2.bo_id}${sessionScope.loginMember.u_id}</td> 
		<td>별점
			<p id="star"> <!-- 부모 -->
			   <a href="#"><input type="hidden" name="c_campingstar" value="1">★</a> <!-- 자식들-->
			   <a href="#"><input type="hidden" name="c_campingstar" value="2">★</a>
			   <a href="#"><input type="hidden" name="c_campingstar" value="3">★</a>
			   <a href="#"><input type="hidden" name="c_campingstar" value="4">★</a>
			   <a href="#"><input type="hidden" name="c_campingstar" value="5">★</a>
			   
			<p>
		</td>	
		<td width="200" height="100"><textarea name="c_campingreview"></textarea></td>
	
		<td>
			<input type="hidden" name="c_cam_no" value="${places.cam_no }">
			<input type="hidden" name="cam_no" value="${places.cam_no }">
			<input type="hidden" name="c_u_id" value="${sessionScope.loginMember2.bo_id}${sessionScope.loginMember.u_id}">
			<input onclick="return star" type="submit" name="submit" value="등록">
		</td>
	</tr>
</table>

</form>

<table border="1" style="width:500;" >
	<c:forEach var="r" items="${reviews}">
	<tr>
		<td width="50"align="center">${r.c_u_id }</td>
		<td width="200" height="50">${r.c_campingreview }</td>
		<td width="50" align="center">${r.c_campingstar }</td>
		
		<c:if test="${sessionScope.loginMember.u_id == r.c_u_id}">
		<td colspan="2" width="100" align="center">
		<button onclick="reviewdelete(${r.c_no},${places.cam_no });">삭제</button>
		<button>수정</button></td>
		</c:if>
	</tr>
	</c:forEach>
</table>
</div>
</body>
</html>