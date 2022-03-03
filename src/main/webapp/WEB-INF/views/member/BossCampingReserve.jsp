<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
  width: 20%;
}

.column.middle {
  width: 80%;
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
	<jsp:include page="${mypage2 }"></jsp:include>
  </div>
  <div class="topnav">
  </div>
  <div class="column middle">
		<c:choose>
			<c:when test="${campingreserve eq null}">
				<h1>예약된 내용이 없습니다.</h1>
			</c:when>
			<c:otherwise>
	<table>
				<tr>
					<td class="hidden"></td>
					<td class="td1">예약자명</td>
					<td class="td1">예약한 전화번호</td>
					<td class="td1">전화번호</td>
					<td class="td1">예약한 날짜</td>
					<td class="td1">예약한 인원수</td>
					<td class="td1">최종금액</td>
					<td class="td1">예약 취소</td>
				</tr>
				<c:forEach var="cr" items="${campingreserve}">
					<tr>
						<td class="hidden" id="cr${cr.r_no }"></td>
						<td class="td1">${cr.r_u_name}</td>
						<td class="td1">${cr.r_u_phonenumber}</td>
						<td class="td1">${cr.r_cam_name}</td>
						<td class="td1"><fmt:formatDate value="${cr.r_campingstartdate}" /> ~ <fmt:formatDate value="${cr.r_campingenddate}" /></td>
						<td class="td1">${cr.r_campingheadcount}</td>
						<td class="td1">${cr.r_campingprice}</td>
						<td class="td1"><button	onclick="reservedel('${cr.r_no}','${cr.r_u_id }')">예약취소</button></td>
					</tr>
				</c:forEach>
	</table>
</c:otherwise>
</c:choose>
</div>
</div>
</body>
</html>