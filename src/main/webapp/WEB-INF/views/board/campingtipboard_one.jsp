<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="board">
	<table class="table2">
		<tr>
			<td colspan="4" id="titleTd"><span class="title">캠핑팁게시판</span></td>
		</tr>	
	</table>
	
		<table border="1" class="table">		
			<tr>
				<td>제목</td>
				<td>작성자</td>
				<td>조회수</td>
				<td>작성날짜</td>
			</tr>
			<tr>
				<td>
					${fb.tip_subject }
				</td>
				<td>
					${fb.tip_u_id }
				</td>
				<td>
					${fb.tip_readcount }
				</td>
				<td>
					<fmt:formatDate value="${fb.tip_date }"/> 
				</td>
			</tr>
			<tr>
				<td colspan="4">${fb.tip_txt }</td>
			</tr>
			<c:if test="${fb.tip_u_id == sessionScope.loginMember.u_id 
						|| fb.tip_u_id == sessionScope.loginMember2.bo_id 
						|| sessionScope.loginMember3 != null}">
				<tr>
					<td><button onclick="location.href='ctwrite.updatego?tip_no=${fb.tip_no}'">수정</button></td>
					<td><button onclick="fbdelete(${fb.tip_no} );">삭제</button></td>
				</tr>
			</c:if>
		</table>
		
		<!-- 댓글 insert -->
		<c:if test="${sessionScope.loginMember.u_id != null
						|| sessionScope.loginMember2.bo_id != null
						|| sessionScope.loginMember3 != null}">
		<form action="ct_replyinsert" name="frwriteForm" onsubmit="return fr_writeCheck()">
			<table border="1">
				<tr><td colspan="2">댓글달기</td></tr>
				<tr>
					<td rowspan="2">
						<img src="resources/img/${sessionScope.loginMember.u_picture }
						${sessionScope.loginMember2.bo_picture }
						${sessionScope.loginMember3.root_picture }" width="30" height="30">
						<input type="hidden" name="tipr_picture" 
						value="${sessionScope.loginMember.u_picture }${sessionScope.loginMember2.bo_picture }${sessionScope.loginMember3.root_picture }">				
					</td>					
					<td>
						${sessionScope.loginMember.u_id }
						${sessionScope.loginMember2.bo_id }
						${sessionScope.loginMember3.root_name }					
						<input type="hidden" name="tipr_u_id"
						value="${sessionScope.loginMember.u_id }${sessionScope.loginMember2.bo_id }${sessionScope.loginMember3.root_name }">
					</td>
				</tr>
				<tr><td><input name="tipr_replytxt"></td></tr>
				<tr>
					<td colspan="2">
						<input type="hidden" name="tipr_tip_no" value="${fb.tip_no}">
						<input type="hidden" name="tip_no" value="${fb.tip_no}">
						<input type="hidden" name="tipr_depth" value="3">		
										
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
				<tr><td colspan="4" style="background-color:red;">댓글</td></tr>	
				<tr>
					<td>
						<img src="resources/img/${fr.tipr_picture }" width="30" height="30">
					</td>
					<td colspan="2">${fr.tipr_u_id }</td>
					<td><fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${fr.tipr_date }"/></td>					
				</tr>
				<tr>
					<td colspan="3" class="replyTd">${fr.tipr_replytxt }</td>	
					<c:if test="${fr.tipr_u_id == sessionScope.loginMember.u_id 
						|| fr.tipr_u_id == sessionScope.loginMember2.bo_id 
						|| sessionScope.loginMember3 != null}">
						<td colspan="3">
							<button class="replyUpdateBtn" value="updateGo">수정</button>
							<input type="hidden" value="${fb.tip_no}" class="fbVal">
							<input type="hidden" value="${fr.tipr_no}" class="frVal1">
							<button onclick="frdelete(${fr.tipr_no},${fb.tip_no},${fr.tipr_depth });">삭제</button>
						</td>		
					</c:if>								
				</tr>
				<tr>
					<c:choose>
						<c:when test="${fr.tipr_u_id == sessionScope.loginMember.u_id 
								|| fr.tipr_u_id == sessionScope.loginMember2.bo_id 
								|| sessionScope.loginMember3 != null}">
							<td colspan="4">
								<button id="replybtn" class="replybtn" value='0'>답글 보기▼</button>
							</td>
						</c:when>
						<c:otherwise>
							<td colspan="4">
								<button id="replybtn" class="logout_replybtn" value='0'>답글 보기▼</button>
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</table>

		<c:if test="${sessionScope.loginMember.u_id != null
				|| sessionScope.loginMember2.bo_id != null
				|| sessionScope.loginMember3 != null}">
		<!-- 대댓글 inset -->
			<form action="ct_replyinsert" name="frrwriteForm" onsubmit="return frr_writeCheck()">
				<table class="replyreply" border="1">
					<tr><td colspan="2">답글작성</td></tr>
					<tr>
						<td rowspan="2">
							<img src="resources/img/${sessionScope.loginMember.u_picture }
							${sessionScope.loginMember2.bo_picture }
							${sessionScope.loginMember3.root_picture }" width="30" height="30">
							<input type="hidden" name="tipr_picture" 
							value="${sessionScope.loginMember.u_picture }${sessionScope.loginMember2.bo_picture }${sessionScope.loginMember3.root_picture }">
						</td>
						<td>
							${sessionScope.loginMember.u_id }
							${sessionScope.loginMember2.bo_id }
							${sessionScope.loginMember3.root_name }
							<input type="hidden" name="tipr_u_id"
							value="${sessionScope.loginMember.u_id }${sessionScope.loginMember2.bo_id }${sessionScope.loginMember3.root_name }">					
						</td>
					</tr>
					<tr><td><input name="tipr_replytxt"></td></tr>
					<tr>
						<td>
							<input type="hidden" name="tipr_tip_no" value="${fb.tip_no}">
							<input type="hidden" name="tip_no" value="${fb.tip_no}">
							<input type="hidden" name="tipr_owner_no" value="${fr.ftip_no}">
							<input type="hidden" name="tipr_owner_id" value="${fr.ftip_u_id}">
							<input type="hidden" name="tipr_depth" value="0">
							<button>등록</button>
						</td>
					</tr>
				</table>
			</form>
		</c:if>  
					
		<!-- 대댓글 select겸 insert -->
		<div class="asdasd" style="display: none">
		<c:forEach var="frr" items="${frr }">
		<c:if test="${frr.tipr_owner_no == fr.tipr_no }">				
			<table border="1" class="aabbcc">
				<tr>
					<td>
						<img src="resources/img/${frr.tipr_picture }" width="30" height="30">
					</td>
					<c:if test="${frr.tipr_depth == 1 }">
						<td style="color:red; background-color:yellow;">${frr.tipr_owner_id }</td>
					</c:if>					
					<td style="background-color:orange;">${frr.tipr_u_id }:</td>
					<td class="replyTd">${frr.tipr_replytxt }</td>
					<td><fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${frr.tipr_date }"/></td>
					<c:if test="${frr.tipr_u_id == sessionScope.loginMember.u_id 
						|| frr.tipr_u_id == sessionScope.loginMember2.bo_id 
						|| sessionScope.loginMember3 != null}">
						<td>
							<button class="replyUpdateBtn" value="updateGo">수정</button>
							<input type="hidden" value="${fb.tip_no}" class="fbVal">
							<input type="hidden" value="${frr.tipr_no}" class="frVal1">
							<button onclick="frrdelete(${frr.tipr_no},${fb.tip_no},${frr.tipr_depth },${frr.tipr_owner_no });">삭제</button>
						</td>
					</c:if>	
					<td><button>답글</button></td>
				</tr>
			</table>
			<c:if test="${sessionScope.loginMember.u_id != null
						|| sessionScope.loginMember2.bo_id != null
						|| sessionScope.loginMember3 != null}">
			<form action="ct_replyinsert">				
			<table border="1">
				<tr>							
					<td style="color:red;">
						${frr.fr_u_id }							
					</td>
					<td rowspan="2">
						<img src="resources/img/${sessionScope.loginMember.u_picture }
						${sessionScope.loginMember2.bo_picture }
						${sessionScope.loginMember3.root_picture }" width="30" height="30">
						<input type="hidden" name="tipr_picture" 
						value="${sessionScope.loginMember.u_picture }${sessionScope.loginMember2.bo_picture }${sessionScope.loginMember3.root_picture }">
					</td>
					<td class="replyTd">
						${sessionScope.loginMember.u_id }
						${sessionScope.loginMember2.bo_id }
						${sessionScope.loginMember3.root_name }						
						<input name="tipr_replytxt">
					</td>
					<td>
						<input type="hidden" name="tipr_u_id"
							value="${sessionScope.loginMember.u_id }${sessionScope.loginMember2.bo_id }${sessionScope.loginMember3.root_name }">
						<input type="hidden" name="tipr_f_no" value="${frr.tipr_f_no }">
						<input type="hidden" name="tipr_owner_no" value="${fr.tipr_no }">
						<input type="hidden" name="tipr_owner_id" value="${frr.tipr_u_id }">
						<input type="hidden" name="tipr_depth" value="1">
						<input type="hidden" name="tip_no" value="${fb.tip_no}">
						<button  class="replyinsert">등록</button>
					</td>
				</tr>
			</table>
			</form>
			</c:if>	
		</c:if>
		</c:forEach>				
	</div>
	</c:forEach>
	
	<c:choose>
		<c:when test = "${pg > block}">
            [<a href="ct.onego?pg=1">◀◀</a>]
            [<a href="ct.onego?pg=${fromPage -1}&tip_no=${fb.tip_no}">◀</a>] 
        </c:when>
        <c:otherwise>
            [<span style="color:gray">◀◀</span>]   
            [<span style="color:gray">◀</span>]
        </c:otherwise>
    </c:choose>
    <c:forEach var="i" begin="${fromPage }" end="${toPage }">
      	<c:choose>
	       	<c:when test = "${i == pg }"> 
        		[${i }]
        	</c:when>        	
      	    <c:otherwise>
        		[<a href="ct.onego?pg=${i }&tip_no=${fb.tip_no}">${i }</a>]
       		</c:otherwise>
       	</c:choose>
    </c:forEach>       
    <c:choose>
       	<c:when test = "${toPage < allPage }">
       		[<a href="ct.onego?pg=${toPage + 1}&tip_no=${fb.tip_no}">▶</a>]
            [<a href="ct.onego?pg=${allPage}&tip_no=${fb.tip_no}">▶▶</a>]
      	</c:when>
     	<c:otherwise>
       		[<span style="color:gray">▶</span>]
            [<span style="color:gray">▶▶</span>]
       	</c:otherwise>       
    </c:choose>
</div>
</body>
</html>
															