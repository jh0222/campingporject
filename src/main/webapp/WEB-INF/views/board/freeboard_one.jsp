<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
자유게시판
		<table border="1">		
			<tr>
				<td>제목</td>
				<td>작성자</td>
				<td>조회수</td>
				<td>작성날짜</td>
			</tr>
			<tr>
				<td>
					${fb.f_subject }
				</td>
				<td>
					${fb.f_u_id }
				</td>
				<td>
					${fb.f_readcount }
				</td>
				<td>
					<fmt:formatDate value="${fb.f_date }"/> 
				</td>
			</tr>
			<c:if test="${fb.f_u_id == sessionScope.loginMember.u_id 
						|| fb.f_u_id == sessionScope.loginMember2.bo_id 
						|| sessionScope.loginMember3 != null}">
				<tr>
					<td><button onclick="location.href='fbwrite.updatego?f_no=${fb.f_no}'">수정</button></td>
					<td><button onclick="fbdelete(${fb.f_no});">삭제</button></td>
				</tr>
			</c:if>
		</table>
		
		[댓글]
		<c:forEach var="fr" items="${fr }">
			<table border="1">
				<tr>
					<td>${fr.fr_u_id }</td>
					<td></td>
					<td><fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${fr.fr_date }"/></td>					
				</tr>
				<tr>
					<td colspan="2">${fr.fr_replytxt }</td>
					<c:if test="${fb.f_u_id == sessionScope.loginMember.u_id 
						|| fb.f_u_id == sessionScope.loginMember2.bo_id 
						|| sessionScope.loginMember3 != null}">
						<td><button>수정</button><button onclick="frdelete(${fr.fr_no},${fb.f_no});">삭제</button></td>
					</c:if>
				</tr>
				<tr><td colspan="3"><button id="rreply">답글달기</button></td></tr>
				<tr>
					<td>
						<form action="fb_rreply.insert">
							<table id="replyreply">
								<tr>
									<td>
										${sessionScope.loginMember.u_id }
										${sessionScope.loginMember2.bo_id }
										${sessionScope.loginMember3 }
										<input type="hidden" name="fr_u_id"
										value="${sessionScope.loginMember.u_id }
										${sessionScope.loginMember2.bo_id }
										${sessionScope.loginMember3 }">
									</td>
								</tr>
								<tr><td><input name="fr_replytxt"></td></tr>
								<tr>
									<td>
										<input type="hidden" name="fr_f_no" value="${fb.f_no}">
										<input type="hidden" name="f_no" value="${fb.f_no}">
										<input type="hidden" name="fr_owner_no" value="${fr.fr_no}">
										<input type="hidden" name="fr_owner_id" value="${fr.fr_u_id}">
										<button>등록</button>
									</td>
								</tr>
							</table>
						</form>
					</td>
				</tr>
			</table>
		</c:forEach>
		
		<c:if test="${sessionScope.loginMember.u_id != null
						|| sessionScope.loginMember2.bo_id != null
						|| sessionScope.loginMember3 != null}">
		<form action="fb_replyinsert">
			<table border="1">
				<tr><td>댓글달기</td></tr>
				<tr>
					<td>
						${sessionScope.loginMember.u_id }
						${sessionScope.loginMember2.bo_id }
						${sessionScope.loginMember3 }
						<input type="hidden" name="fr_u_id"
						value="${sessionScope.loginMember.u_id }
						${sessionScope.loginMember2.bo_id }
						${sessionScope.loginMember3 }">
					</td>
				</tr>
				<tr><td><input name="fr_replytxt"></td></tr>
				<tr>
					<td>
						<input type="hidden" name="fr_f_no" value="${fb.f_no}">
						<input type="hidden" name="f_no" value="${fb.f_no}">
						<button>등록</button>
					</td>
				</tr>
			</table>
		</form>
		</c:if>
</body>
</html>