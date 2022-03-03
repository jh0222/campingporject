<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  	<a href = "Cproductreview?pr_u_bo_id=${sessionScope.loginMember.u_id}">캠핑용품</a> /
  	<a href = "Mproductreview?fpr_u_bo_id=${sessionScope.loginMember.u_id}">밀키트</a>
  </div>
	
  <div class="column middle">
  <h2>밀키트</h2>
	<table>
		<tr>
			<td class="hidden"></td>
			<td class="td1">내용</td>
			<td class="td1">작성날짜</td>
			<td colspan="2" class="td1">수정/삭제</td>
		</tr>
	<c:forEach var="m" items="${mealreview}">
		<tr>
			<td class="hidden" id="fpru${m.fpr_no}"></td>
			<td class="td1"><input name="fpr_txt" value="${m.fpr_txt}"></td>
			<td class="td1"><fmt:formatDate value="${m.fpr_date}"/></td>
			<td class="td1">
				<button onclick="mealreviewup('${m.fpr_no}','${m.fpr_u_bo_id}')">수정</button>
				<button onclick="mealreviewdel('${m.fpr_no}','${m.pr_u_bo_id}')">삭제</button>
			</td>
		</tr>
	</c:forEach>
	</table>
</div>
</div>
</body>
</html>