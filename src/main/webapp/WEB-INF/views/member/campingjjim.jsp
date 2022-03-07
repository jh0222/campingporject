<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  </div>
	
  <div class="column middle">
  <c:choose>
		<c:when test="${cj.h_no eq null}">
			<h1>좋아요 목록이 없습니다.</h1>
		</c:when>
	<c:otherwise>
	<table>
		<tr>
			<td class="hidden"></td>
			<td>캠핑명</td>
			<td>캠핑주소</td>
			<td></td>
		</tr>
	<c:forEach var="cj" items="${campingjjim}">
		<tr>	
			<td id="cj${cj.h_no}" class="hidden"></td>
			<td><a href="">${cj.h_cam_name}</a></td>
			<td>${cj.h_cam_address }</td>
			<td><button value="${cj.h_campingheart }" onclick="jjimdel('${cj.h_no }','${cj.h_u_id }')">삭제</button></td>
		</tr>
	</c:forEach>
	</table>
</c:otherwise>
</c:choose>
</div>
</div>
</body>
</html>