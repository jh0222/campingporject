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
</head>
<body>
<jsp:include page="${myPage }"></jsp:include>
	<form action="user.update?u_id=${sessionScope.loginMember.u_id }"
		method="post" enctype="multipart/form-data" name="updateUserForm" onsubmit="return updateUserCheck();">
		<table id="joinTable">
			<tr>
				
			</tr>
			<tr>
				<td colspan="2" align="center">	내 정보  </td>
			</tr>
			<tr>
				<td>ID</td>
				<td>
					${sessionScope.loginMember.u_id }
				</td>
			</tr>
			<tr>
				<td>PW</td>
				<td>
					<input name="up_pw" value="${sessionScope.loginMember.u_pw }" placeholder="필수, 숫자 하나이상 반드시"  maxlength="10" autocomplete="off">
				</td>
			</tr>
			<tr>
				<td>PW확인</td>
				<td><input name="up_pwChk" value="${sessionScope.loginMember.u_pw }" placeholder="필수, 숫자 하나이상 반드시" type="password" maxlength="10" autocomplete="off"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${sessionScope.loginMember.u_name }</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input name="up_email" value="${email[0] }" type="text" readonly="readonly" required><span id="middle">@</span>
					<input name="up_email_address" value="${email[1] }" type="text" readonly="readonly" required>					
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
				  	<input value="${sessionScope.birth }" type="date" name="up_birth">
				</td>				
			</tr>
			<tr>
				<td>핸드폰번호</td>
				<td>
			<c:choose>
               <c:when test="${fn:substring(sessionScope.loginMember.u_phonenumber, 0, 3) eq '010'}">
               <select name="up_phonenumber1">
                     <option value="010" selected>010</option>
                     <option value="011">011</option>
                     <option value="016">016</option>
                     <option value="017">017</option>
                     <option value="018">018</option>
                     <option value="019">019</option>
               </select>
            </c:when>
            <c:when test="${fn:substring(sessionScope.loginMember.u_phonenumber, 0, 3) eq '011'}">
               <select name="up_phonenumber1">
                     <option value="010">010</option>
                     <option value="011" selected>011</option>
                     <option value="016">016</option>
                     <option value="017">017</option>
                     <option value="018">018</option>
                     <option value="019">019</option>
               </select>
            </c:when>
            <c:when test="${fn:substring(sessionScope.loginMember.u_phonenumber, 0, 3) eq '016'}">
               <select name="up_phonenumber1">
                     <option value="010">010</option>
                     <option value="011">011</option>
                     <option value="016" selected>016</option>
                     <option value="017">017</option>
                     <option value="018">018</option>
                     <option value="019">019</option>
               </select>
            </c:when>
            <c:when test="${fn:substring(sessionScope.loginMember.u_phonenumber, 0, 3) eq '017'}">
               <select name="up_phonenumber1">
                     <option value="010">010</option>
                     <option value="011">011</option>
                     <option value="016">016</option>
                     <option value="017" selected>017</option>
                     <option value="018">018</option>
                     <option value="019">019</option>
               </select>
            </c:when>
            <c:when test="${fn:substring(sessionScope.loginMember.u_phonenumber, 0, 3) eq '018'}">
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
         <input name="up_phonenumber2"class="phonenumber" maxlength='4' value="<c:out value="${fn:substring(sessionScope.loginMember.u_phonenumber, 3, 7)}"></c:out>">
         -
         <input name="up_phonenumber3"class="phonenumber" maxlength='4' value="<c:out value="${fn:substring(sessionScope.loginMember.u_phonenumber, 7, 11)}"></c:out>">
				</td>
			</tr>
			<tr>
				<td class="td1">프로필 사진</td>
				<td>
					<img src="resources/img/${sessionScope.loginMember.u_picture }" id="updateMemberPhoto" width="100" height="100">
				    <input type="hidden" name="oldpicture" value="${sessionScope.loginMember.u_picture }">
				    <input name="newpicture" type="file">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" style="background-color: #FFFFFF;">
					<button>수정</button>
					<button onclick="userBye();" type="button">탈퇴</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>