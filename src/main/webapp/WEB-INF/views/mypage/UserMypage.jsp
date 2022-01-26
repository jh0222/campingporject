<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>이름</td>
			<td>${User.u_name}</td>
		</tr>
		<tr>
			<td>ID</td>
			<td>${User.u_id}</td>
		</tr>
		<tr>
			<td>PW</td>
			<td>${User.u_pw}</td>
		</tr>
		<tr>
			<td>email</td>
			<td>${User.u_email}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${User.u_address}</td>
		</tr>
	</table>
	<input type="button" value="수정">
	
	<ul>
 	<li> 캠핑예약 </li>
 	
 	<c:forEach items="${Ureservelist}" var="ur">
 	
 	<li>
  	<div class="thumb">
   		<img src="${ur.r_cam_picture}" />
  	</div>
  <div class="gdsInfo">
   <p>
    <span>예약번호</span>${ur.r_no}<br/>
    <span>ID</span>${ur.r_u_id}<br/>
    <span>HP</span>${ur.r_u_phonenumber}<br/>
    <span>캠핑장 이름</span>${ur.r_cam_name}<br/>
    <span>주소</span>${ur.r_cam_address}<br/>
    <span>예약날짜</span>${ur.r_campingstartdate}~${ur.r_campingenddate}<br/>
    <span>인원수</span>${ur.r_campingheadcount}<br/>
    <span>가격</span><fmt:formatNumber pattern="###,###,###" value="${ur.r_campingprice}"/> 원<br/>
    <span>총 가격</span><fmt:formatNumber pattern="###,###,###" value="${ur.r_campingheadcount * ur.r_campingprice}"/> 원
   </p>
   <div class="delete">
    <button type="button" class="delete_btn" >예약취소</button>
   </div>
  </div>   
 </li>
 </c:forEach>
</ul>
	
</body>
</html>