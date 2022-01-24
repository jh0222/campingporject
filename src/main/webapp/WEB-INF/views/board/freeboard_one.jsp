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
			<tr>
				<td colspan="4">${fb.f_txt }</td>
			</tr>
			<tr>
				<td colspan="4" align="center"><img src="resources/img/${fb.f_picture }" width="200" height="100"></td>
			</tr>
			<c:if test="${fb.f_u_id == sessionScope.loginMember.u_id 
						|| fb.f_u_id == sessionScope.loginMember2.bo_id 
						|| sessionScope.loginMember3 != null}">
				<tr>
					<td><button onclick="location.href='fbwrite.updatego?f_no=${fb.f_no}'">수정</button></td>
					<td><button onclick="fbdelete(${fb.f_no} });">삭제</button></td>
				</tr>
			</c:if>
		</table>
		
		<!-- 댓글 insert -->
		<c:if test="${sessionScope.loginMember.u_id != null
						|| sessionScope.loginMember2.bo_id != null
						|| sessionScope.loginMember3 != null}">
		<form action="fb_replyinsert" >
			<table border="1">
				<tr><td colspan="2">댓글달기</td></tr>
				<tr>
					<td rowspan="2">
						<img src="resources/img/${sessionScope.loginMember.u_picture }
						${sessionScope.loginMember2.bo_picture }
						${sessionScope.loginMember3.root_picture }" width="30" height="30">
						<input type="hidden" name="fr_picture" 
						value="${sessionScope.loginMember.u_picture }${sessionScope.loginMember2.bo_picture }${sessionScope.loginMember3.root_picture }">				
					</td>					
					<td>
						${sessionScope.loginMember.u_id }
						${sessionScope.loginMember2.bo_id }
						${sessionScope.loginMember3.root_name }					
						<input type="hidden" name="fr_u_id"
						value="${sessionScope.loginMember.u_id }${sessionScope.loginMember2.bo_id }${sessionScope.loginMember3.root_name }">
					</td>
				</tr>
				<tr><td><input name="fr_replytxt"></td></tr>
				<tr>
					<td colspan="2">
						<input type="hidden" name="fr_f_no" value="${fb.f_no}">
						<input type="hidden" name="f_no" value="${fb.f_no}">
						<input type="hidden" name="fr_depth" value="3">		
										
						<button>등록</button>
					</td>
				</tr>
			</table>
		</form>
		</c:if>
			
			
	<c:forEach var="fr" items="${fr }">	
		[댓글]		
		<!-- 댓글 select -->			
			<table border="1">	
				<tr><td colspan="3" style="background-color:red;">댓글</td></tr>	
				<tr>
					<td>
						<img src="resources/img/${fr.fr_picture }" width="30" height="30">
					</td>
					<td>${fr.fr_u_id }</td>
					<td><fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${fr.fr_date }"/></td>					
				</tr>
				<tr>
					<td colspan="3">${fr.fr_replytxt }</td>								
				</tr>
				<c:if test="${fr.fr_u_id == sessionScope.loginMember.u_id 
						|| fr.fr_u_id == sessionScope.loginMember2.bo_id 
						|| sessionScope.loginMember3 != null}">
					<tr>
						<td colspan="3">
							<button onclick="frupdate(${fr.fr_u_id},${fr.fr_txt })">수정</button>
							<button onclick="frdelete(${fr.fr_no},${fb.f_no},${fr.fr_depth });">삭제</button>
						</td>	
					</tr>	
				</c:if>		
			</table>

		<c:if test="${sessionScope.loginMember.u_id != null
				|| sessionScope.loginMember2.bo_id != null
				|| sessionScope.loginMember3 != null}">
		<!-- 대댓글 inset -->
			<form action="fb_replyinsert">
				<table id="replyreply" border="1">
					<tr><td colspan="2">답글작성</td></tr>
					<tr>
						<td rowspan="2">
							<img src="resources/img/${sessionScope.loginMember.u_picture }
							${sessionScope.loginMember2.bo_picture }
							${sessionScope.loginMember3.root_picture }" width="30" height="30">
							<input type="hidden" name="fr_picture" 
							value="${sessionScope.loginMember.u_picture }${sessionScope.loginMember2.bo_picture }${sessionScope.loginMember3.root_picture }">
						</td>
						<td>
							${sessionScope.loginMember.u_id }
							${sessionScope.loginMember2.bo_id }
							${sessionScope.loginMember3.root_name }
							<input type="hidden" name="fr_u_id"
							value="${sessionScope.loginMember.u_id }${sessionScope.loginMember2.bo_id }${sessionScope.loginMember3.root_name }">					
						</td>
					</tr>
					<tr><td><input name="fr_replytxt"></td></tr>
					<tr>
						<td>
							<input type="hidden" name="fr_f_no" value="${fb.f_no}">
							<input type="hidden" name="f_no" value="${fb.f_no}">
							<input type="hidden" name="fr_owner_no" value="${fr.fr_no}">
							<input type="hidden" name="fr_owner_id" value="${fr.fr_u_id}">
							<input type="hidden" name="fr_depth" value="0">
							<button>등록</button>
						</td>
					</tr>
				</table>
			</form>
		</c:if>
					
		<!-- 대댓글 select겸 insert -->
		<c:forEach var="frr" items="${frr }">
		<c:if test="${frr.fr_owner_no == fr.fr_no }">				
			<table border="1">
				<tr>
					<td>
						<img src="resources/img/${frr.fr_picture }" width="30" height="30">
					</td>
					<c:if test="${frr.fr_depth == 1 }">
						<td style="color:red; background-color:yellow;">${frr.fr_owner_id }</td>
					</c:if>					
					<td style="background-color:orange;">${frr.fr_u_id }:</td>
					<td>${frr.fr_replytxt }</td>
					<td><fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${frr.fr_date }"/></td>
					<c:if test="${frr.fr_u_id == sessionScope.loginMember.u_id 
						|| frr.fr_u_id == sessionScope.loginMember2.bo_id 
						|| sessionScope.loginMember3 != null}">
						<td>
							<button>수정</button>
							<button onclick="frrdelete(${frr.fr_no},${fb.f_no},${frr.fr_depth },${frr.fr_owner_no });">삭제</button>
						</td>
					</c:if>	
					<td><button>답글</button></td>
				</tr>
			</table>
			<c:if test="${sessionScope.loginMember.u_id != null
						|| sessionScope.loginMember2.bo_id != null
						|| sessionScope.loginMember3 != null}">
			<form action="fb_replyinsert">				
			<table border="1">
				<tr>							
					<td style="color:red;">
						${frr.fr_u_id }							
					</td>
					<td rowspan="2">
						<img src="resources/img/${sessionScope.loginMember.u_picture }
						${sessionScope.loginMember2.bo_picture }
						${sessionScope.loginMember3.root_picture }" width="30" height="30">
						<input type="hidden" name="fr_picture" 
						value="${sessionScope.loginMember.u_picture }${sessionScope.loginMember2.bo_picture }${sessionScope.loginMember3.root_picture }">
					</td>
					<td>
						${sessionScope.loginMember.u_id }
						${sessionScope.loginMember2.bo_id }
						${sessionScope.loginMember3.root_name }
						<input type="hidden" name="fr_u_id"
						value="${sessionScope.loginMember.u_id }${sessionScope.loginMember2.bo_id }${sessionScope.loginMember3.root_name }">
						<input name="fr_replytxt">
					</td>
					<td>
						<input type="hidden" name="fr_f_no" value="${frr.fr_f_no }">
						<input type="hidden" name="fr_owner_no" value="${fr.fr_no }">
						<input type="hidden" name="fr_owner_id" value="${frr.fr_u_id }">
						<input type="hidden" name="fr_depth" value="1">
						<input type="hidden" name="f_no" value="${fb.f_no}">
						<button>등록</button>
					</td>
				</tr>
			</table>
			</form>
			</c:if>	
		</c:if>
		</c:forEach>				
	</c:forEach>

	<table id="snsWriteArea" style="bottom: -150px">
		<tr>
			<td align="center"><span id="snsWriteFormSummoner"><img
					src="resources/img/write_update.png"
					width=30 height=30>
			</span></td>
		</tr>
		<tr>
			<td align="center">
				<form name="snsWriteForm" action="sns.write" method="post">
					<table id="snsWriteTable">
						<tr>
							<td id="swtTd1"><textarea name="s_txt" maxlength="200"></textarea></td>
							<td id="swtTd2"><button>수정</button></td>
						</tr>
					</table>
				</form>

			</td>
		</tr>
	</table>

		
</body>
</html>
															