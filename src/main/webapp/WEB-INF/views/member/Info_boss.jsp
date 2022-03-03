<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<form action="boss.update?bo_id="${sessionScope.loginMember2.bo_id }
		method="post" enctype="multipart/form-data" name="updateBossForm" onsubmit="return updateBossCheck();">
		<table id="joinTable">
			<tr>
				<td>ID</td>
				<td>
					${sessionScope.loginMember2.bo_id }
				</td>
			</tr>
			<tr>
				<td>PW</td>
				<td>
					<input name="up_pw" value="${sessionScope.loginMember2.bo_pw }" placeholder="필수, 숫자 하나이상 반드시"  maxlength="10" autocomplete="off">
				</td>
			</tr>
			<tr>
				<td>PW확인</td>
				<td><input name="up_pwChk" value="${sessionScope.loginMember2.bo_pw }" placeholder="필수, 숫자 하나이상 반드시" type="password" maxlength="10" autocomplete="off"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${sessionScope.loginMember2.bo_name }</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input name="up_email" value="${email[0] }" type="text" required><span id="middle">@</span>
					<input name="up_email_address" value="${email[1] }" type="text" required>					
				</td>
			</tr>
			<tr>
				<td class="td1">주소</td>
				<td class="td2">
					<input id="addr3Input" value="${addr[2] }" name="up_addr3" maxlength="5" autocomplete="off" placeholder="우편번호">
					<span id="addrSearchBtn">[검색]</span><br>
					<input id="addr1Input" value="${addr[0] }" name="up_addr1" maxlength="30" autocomplete="off" placeholder="주소">
					<input name="up_addr2" value="${addr[1] }" maxlength="30" autocomplete="off" placeholder="상세주소">
				</td>
			</tr>
			<tr> 
				<td>생년월일</td> 
				<td>
				  	<input value="${sessionScope.birth }" type="date" name="newbirth">
				</td>				
			</tr>
			<tr>
				<td>핸드폰번호</td>
				<td>
			<c:choose>
               <c:when test="${fn:substring(sessionScope.loginMember2.bo_phonenumber, 0, 3) eq '010'}">
               <select name="up_phonenumber1">
                     <option value="010" selected>010</option>
                     <option value="011">011</option>
                     <option value="016">016</option>
                     <option value="017">017</option>
                     <option value="018">018</option>
                     <option value="019">019</option>
               </select>
            </c:when>
            <c:when test="${fn:substring(sessionScope.loginMember2.bo_phonenumber, 0, 3) eq '011'}">
               <select name="up_phonenumber1">
                     <option value="010">010</option>
                     <option value="011" selected>011</option>
                     <option value="016">016</option>
                     <option value="017">017</option>
                     <option value="018">018</option>
                     <option value="019">019</option>
               </select>
            </c:when>
            <c:when test="${fn:substring(sessionScope.loginMember2.bo_phonenumber, 0, 3) eq '016'}">
               <select name="up_phonenumber1">
                     <option value="010">010</option>
                     <option value="011">011</option>
                     <option value="016" selected>016</option>
                     <option value="017">017</option>
                     <option value="018">018</option>
                     <option value="019">019</option>
               </select>
            </c:when>
            <c:when test="${fn:substring(sessionScope.loginMember2.bo_phonenumber, 0, 3) eq '017'}">
               <select name="up_phonenumber1">
                     <option value="010">010</option>
                     <option value="011">011</option>
                     <option value="016">016</option>
                     <option value="017" selected>017</option>
                     <option value="018">018</option>
                     <option value="019">019</option>
               </select>
            </c:when>
            <c:when test="${fn:substring(sessionScope.loginMember2.bo_phonenumber, 0, 3) eq '018'}">
               <select name="up_phonenumber1">
                     <option value="010">010</option>
                     <option value="011">011</option>
                     <option value="016">016</option>
                     <option value="017">017</option>
                     <option value="018" selected>018</option>
                     <option value="019">019</option>
               </select>
            </c:when>
            <c:otherwise>
               <select name="up_phonenumber1">
                     <option value="010">010</option>
                     <option value="011">011</option>
                     <option value="016">016</option>
                     <option value="017">017</option>
                     <option value="018">018</option>
                     <option value="019" selected>019</option>
               </select>
            </c:otherwise>
         </c:choose>               
         -
         <input name="up_phonenumber2"class="phonenumber" maxlength='4' value="<c:out value="${fn:substring(sessionScope.loginMember2.bo_phonenumber, 3, 7)}"></c:out>">
         -
         <input name="up_phonenumber3"class="phonenumber" maxlength='4' value="<c:out value="${fn:substring(sessionScope.loginMember2.bo_phonenumber, 7, 11)}"></c:out>">
				</td>
			</tr>
			<tr>
				<td class="td1">프로필 사진</td>
				<td>
					<img src="resources/img/${sessionScope.loginMember2.bo_picture }" id="updateMemberPhoto" width="100" height="100"><br>
				    <input type="hidden" name="oldpicture" value="${sessionScope.loginMember2.bo_picture }">
				    <input name="newpicture" type="file">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" style="background-color: #FFFFFF;">
					<button>수정</button>
					<button onclick="bossBye();" type="button">탈퇴</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</div>
</body>
</html>