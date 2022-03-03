<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<c:when test="${campinginfo eq null}">
		<h1>등록된 정보가 없습니다.</h1>
		<button onclick="">캠핑 등록하기</button>
	</c:when>
	
	<c:otherwise>
	<form action="boss_camping.infoupdate?cam_no=${campinginfo.cam_no }&cam_bo_id=${campinginfo.cam_bo_id}"
		method="post" enctype="multipart/form-data" name="updateCampingForm" onsubmit="return updateCampingCheck();">
	<table class="cd1">
			<tr>
				<td class="td1">캠핑명</td>
				<td><input name="name" value="${campinginfo.cam_name }"></td>
			</tr>
			<tr>
				<td class="td1">캠핑주소</td>
				<td class="td2">
					<input id="addr3Input" value="${addr[2] }" name="up_addr3" maxlength="5" autocomplete="off" placeholder="우편번호">
					<span id="addrSearchBtn">[검색]</span><br>
					<input id="addr1Input" value="${addr[0] }" name="up_addr1" maxlength="30" autocomplete="off" placeholder="주소">
					<input name="up_addr2" value="${addr[1] }" maxlength="30" autocomplete="off" placeholder="상세주소">
				</td>
			</tr>
			<tr>
				<td class="td1">캠핑사진</td>
				<td>
					<img src="resources/img/${campinginfo.cam_picture }"	id="updateMemberPhoto" width="100" height="100"><br> 
					<input type="hidden" name="oldpicture" value="${campinginfo.cam_picture }">
					<input name="newpicture" type="file">
				</td>
			</tr>
			<tr>
				<td class="td1">소개</td>
				<td><input name="txt" value="${campinginfo.cam_txt }"></td>
			</tr>
			<tr>
				<td class="td1">전화번호</td>  
				<td>
					<c:choose>
               			<c:when test="${fn:substring(campinginfo.cam_phonenumber, 0, 2) eq '02'}">
               				<select name="up_phonenumber1">
                     			<option value="02" selected>02</option>
                     			<option value="031">031</option>
                     			<option value="033">033</option>
                     			<option value="043">043</option>
                     			<option value="041">041</option>
                     			<option value="054">054</option>
                     			<option value="055">055</option>
                     			<option value="063">063</option>
                     			<option value="061">061</option>
                     			<option value="064">064</option>
                     			<option value="070">070</option>
              				</select>
            			</c:when>
            		<c:when test="${fn:substring(campinginfo.cam_phonenumber, 0, 3) eq '031'}">
               			<select name="up_phonenumber1">
                     			<option value="02">02</option>
                     			<option value="031" selected>031</option>
                     			<option value="033">033</option>
                     			<option value="043">043</option>
                     			<option value="041">041</option>
                     			<option value="054">054</option>
                     			<option value="055">055</option>
                     			<option value="063">063</option>
                     			<option value="061">061</option>
                     			<option value="064">064</option>
                     			<option value="070">070</option>
               			</select>
            		</c:when>
            		<c:when test="${fn:substring(campinginfo.cam_phonenumber, 0, 3) eq '033'}">
               			<select name="up_phonenumber1">
                     			<option value="02">02</option>
                     			<option value="031">031</option>
                     			<option value="033" selected>033</option>
                     			<option value="043">043</option>
                     			<option value="041">041</option>
                     			<option value="054">054</option>
                     			<option value="055">055</option>
                     			<option value="063">063</option>
                     			<option value="061">061</option>
                     			<option value="064">064</option>
                     			<option value="070">070</option>
               			</select>
            		</c:when>
            		<c:when test="${fn:substring(campinginfo.cam_phonenumber, 0, 3) eq '043'}">
              			<select name="up_phonenumber1">
                     			<option value="02">02</option>
                     			<option value="031">031</option>
                     			<option value="033">033</option>
                     			<option value="043" selected>043</option>
                     			<option value="041">041</option>
                     			<option value="054">054</option>
                     			<option value="055">055</option>
                     			<option value="063">063</option>
                     			<option value="061">061</option>
                     			<option value="064">064</option>
                     			<option value="070">070</option>
               			</select>
            		</c:when>
            		<c:when test="${fn:substring(campinginfo.cam_phonenumber, 0, 3) eq '041'}">
               			<select name="up_phonenumber1">
                     		<option value="02" selected>02</option>
                     			<option value="031">031</option>
                     			<option value="033">033</option>
                     			<option value="043">043</option>
                     			<option value="041" selected>041</option>
                     			<option value="054">054</option>
                     			<option value="055">055</option>
                     			<option value="063">063</option>
                     			<option value="061">061</option>
                     			<option value="064">064</option>
                     			<option value="070">070</option>
               			</select>
            		</c:when>
            		<c:when test="${fn:substring(campinginfo.cam_phonenumber, 0, 3) eq '054'}">
               			<select name="up_phonenumber1">
                     			<option value="02">02</option>
                     			<option value="031">031</option>
                     			<option value="033">033</option>
                     			<option value="043">043</option>
                     			<option value="041">041</option>
                     			<option value="054" selected>054</option>
                     			<option value="055">055</option>
                     			<option value="063">063</option>
                     			<option value="061">061</option>
                     			<option value="064">064</option>
                     			<option value="070">070</option>
               			</select>
            		</c:when>
            		<c:when test="${fn:substring(campinginfo.cam_phonenumber, 0, 3) eq '055'}">
               			<select name="up_phonenumber1">
                     			<option value="02">02</option>
                     			<option value="031">031</option>
                     			<option value="033">033</option>
                     			<option value="043">043</option>
                     			<option value="041">041</option>
                     			<option value="054">054</option>
                     			<option value="055" selected>055</option>
                     			<option value="063">063</option>
                     			<option value="061">061</option>
                     			<option value="064">064</option>
                     			<option value="070">070</option>
               			</select>
            		</c:when>
            		<c:when test="${fn:substring(campinginfo.cam_phonenumber, 0, 3) eq '063'}">
               			<select name="up_phonenumber1">
                     			<option value="02">02</option>
                     			<option value="031">031</option>
                     			<option value="033">033</option>
                     			<option value="043">043</option>
                     			<option value="041">041</option>
                     			<option value="054">054</option>
                     			<option value="055">055</option>
                     			<option value="063" selected>063</option>
                     			<option value="061">061</option>
                     			<option value="064">064</option>
                     			<option value="070">070</option>
               			</select>
            		</c:when>
            		<c:when test="${fn:substring(campinginfo.cam_phonenumber, 0, 3) eq '061'}">
               			<select name="up_phonenumber1">
                     			<option value="02">02</option>
                     			<option value="031">031</option>
                     			<option value="033">033</option>
                     			<option value="043">043</option>
                     			<option value="041">041</option>
                     			<option value="054">054</option>
                     			<option value="055">055</option>
                     			<option value="063">063</option>
                     			<option value="061" selected>061</option>
                     			<option value="064">064</option>
                     			<option value="070">070</option>
               			</select>
            		</c:when>
            		<c:when test="${fn:substring(campinginfo.cam_phonenumber, 0, 3) eq '064'}">
               			<select name="up_phonenumber1">
                     			<option value="02">02</option>
                     			<option value="031">031</option>
                     			<option value="033">033</option>
                     			<option value="043">043</option>
                     			<option value="041">041</option>
                     			<option value="054">054</option>
                     			<option value="055">055</option>
                     			<option value="063">063</option>
                     			<option value="061">061</option>
                     			<option value="064" selected>064</option>
                     			<option value="070">070</option>
               			</select>
            		</c:when>
            	<c:otherwise>
               		<select name="up_phonenumber1">
                     			<option value="02">02</option>
                     			<option value="031">031</option>
                     			<option value="033">033</option>
                     			<option value="043">043</option>
                     			<option value="041">041</option>
                     			<option value="054">054</option>
                     			<option value="055">055</option>
                     			<option value="063">063</option>
                     			<option value="061">061</option>
                     			<option value="064">064</option>
                     			<option value="070" selected>070</option>
               		</select>
            	</c:otherwise>
         	</c:choose>               
         	-
         	<input name="up_phonenumber2"class="phonenumber" maxlength='4' value="<c:out value="${fn:substring(campinginfo.cam_phonenumber, 3, 6)}"></c:out>">
         	-
         	<input name="up_phonenumber3"class="phonenumber" maxlength='4' value="<c:out value="${fn:substring(campinginfo.cam_phonenumber, 7, 11)}"></c:out>">
			</tr>
			<tr>
				<td class="td1">기본가격</td>
				<td><input name="price" value="${campinginfo.cam_price }"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" style="background-color: #FFFFFF;">
					<button>수정</button>
					<button onclick="campingBye('${campinginfo.cam_no }','${campinginfo.cam_bo_id}');" type="button">삭제</button>
				</td>
			</tr>
	</table>
</form>
	</c:otherwise>	
</c:choose>
</div>
</div>
</body>
</html>