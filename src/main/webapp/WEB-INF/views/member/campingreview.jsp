<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  margin-left: 300px;
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
  <h2></h2>
  
	<table>
		<tr>
		 	<td class="hidden"></td>
			<td>내용</td>
			<td>평점</td>
			<td>작성날짜</td>
			<td colspan="2" align="center">수정 / 삭제</td>
		</tr>
	<c:forEach var="cr" items="${campingreview}">
		<tr>
			<td id="cru${cr.c_no }" class="hidden"></td>
			<td><input name="c_campingreview" value="${cr.c_campingreview}"></td>
			<td>${cr.c_campingstar}</td>
			<td><fmt:formatDate value="${cr.c_date}"/></td>
			<td>
				<button onclick="campingreviewupdate('${cr.c_no}','${cr.c_u_id }')">수정</button>
				<button onclick="campingreviewdel('${cr.c_no}','${cr.c_u_id }')">삭제</button>
			</td>
		</tr>
	</c:forEach>
	</table>
</div>
</div>
</body>
</html>