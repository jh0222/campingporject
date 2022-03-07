<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
  box-sizing: border-box;
}

.row {
  margin-right: 150px;
  margin-left: 150px;
}

/* Style the header */
.header {
  background-color: #f1f1f1;
  padding: 5px;
  text-align: center;
}

/* Style the top navigation bar */
.topnav {
  overflow: hidden;
  background-color: #333;
}

/* Style the topnav links */
.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

/* Change color on hover */
.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.column {
  float: left;
  padding: 10px;
}

.column.side {
  width: 25%;
}

.column.middle {
  width: 75%;
}

.row:after {
  content: "";
  display: table;
  clear: both;
}

@media screen and (max-width: 600px) {
  .column.side, .column.middle {
    width: 100%;
  }
}

.footer {
  background-color: #f1f1f1;
  padding: 10px;
  text-align: center;
}

table, td, th {
    border-collapse : collapse;
    border-bottom: 1px solid black;
    padding : 10px;
}

.td1 {
	text-align: center;
}

.hidden {
	display: none;
}
</style>
</head>
<body>
<div class="row">
  <div class="column side">
	<jsp:include page="${myPage }"></jsp:include>
  </div>
  
  <div class="topnav">
  	<a href = "Cbuylist?b_u_bo_id=${sessionScope.loginMember.u_id}">캠핑용품</a> /
  	<a href = "Mbuylist?fb_u_bo_id=${sessionScope.loginMember.u_id}">밀키트</a>
  </div>
	
  <div class="column middle">
  <c:choose>
	<c:when test="${mealbuylist eq null}">
		<h1>구매 내역이 없습니다.</h1>
	</c:when>
	<c:otherwise>
	<table>
		<tr>
			<td class="hidden"></td>
			<td class="td1">상품명</td>
			<td class="td1">상품수량</td>
			<td class="td1">구매가격</td>
			<td class="td1">구매주소지</td>
			<td class="td1">구매날짜</td>
			<td colspan="2" class="td1">취소/환불</td>
		</tr>
	<c:forEach var="buy" items="${mealbuylist }">
		<tr>
			<td class="hidden"></td>
			<td class="td1">${buy.fb_p_name }</td>
			<td class="td1">${buy.fb_number }</td>
			<td class="td1">${buy.fb_number * buy.fb_price}</td>
			<c:choose>
				<c:when test="${buy.fb_new_address !=null}">
					<td>${buy.fb_new_address}</td>
				</c:when>
				<c:otherwise>
					<td>${buy.fb_u_address}</td>
				</c:otherwise>
			</c:choose>
			<td class="td1"><fmt:formatDate value="${buy.fb_date }"/></td>
			<td class="td1"><button onclick="buymealdel('${buy.fb_no}','${buy.fb_u_bo_id }')">취소/환불</button></td>
		</tr>
	</c:forEach>
	</table>
</c:otherwise>
</c:choose>
</div>
</div>
</body>
</html>