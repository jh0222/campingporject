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
					${fb.rb_subject }
				</td>
				<td>
					${fb.rb_u_id }
				</td>
				<td>
					${fb.rb_readcount }
				</td>
				<td>
					<fmt:formatDate value="${fb.rb_date }"/> 
				</td>
			</tr>
			<tr>
				<td colspan="4">${fb.rb_txt }</td>
			</tr>
			<c:if test="${fb.rb_u_id == sessionScope.loginMember.u_id 
						|| fb.rb_u_id == sessionScope.loginMember2.bo_id 
						|| sessionScope.loginMember3 != null}">
				<tr>
					<td><button onclick="location.href='rwrite.updatego?rb_no=${fb.rb_no}'">수정</button></td>
					<td><button onclick="rdelete(${fb.rb_no} );">삭제</button></td>
				</tr>
			</c:if>
		</table>
		
		<!-- 댓글 insert -->
		<c:if test="${sessionScope.loginMember.u_id != null
						|| sessionScope.loginMember2.bo_id != null
						|| sessionScope.loginMember3 != null}">
		<form action="r_replyinsert" name="frwriteForm" onsubmit="return fr_writeCheck()">
			<table border="1">
				<tr><td colspan="2">댓글달기</td></tr>
				<tr>
					<td rowspan="2">
						<img src="resources/img/${sessionScope.loginMember.u_picture }
						${sessionScope.loginMember2.bo_picture }
						${sessionScope.loginMember3.root_picture }" width="30" height="30">
						<input type="hidden" name="rr_picture" 
						value="${sessionScope.loginMember.u_picture }${sessionScope.loginMember2.bo_picture }${sessionScope.loginMember3.root_picture }">				
					</td>					
					<td>
						${sessionScope.loginMember.u_id }
						${sessionScope.loginMember2.bo_id }
						${sessionScope.loginMember3.root_name }					
						<input type="hidden" name="rr_u_id"
						value="${sessionScope.loginMember.u_id }${sessionScope.loginMember2.bo_id }${sessionScope.loginMember3.root_name }">
					</td>
				</tr>
				<tr><td><input name="rr_replytxt"></td></tr>
				<tr>
					<td colspan="2">
						<input type="hidden" name="rr_rb_no" value="${fb.rb_no}">
						<input type="hidden" name="rb_no" value="${fb.rb_no}">
						<input type="hidden" name="rr_depth" value="3">		
										
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
						<img src="resources/img/${fr.rr_picture }" width="30" height="30">
					</td>
					<td colspan="2">${fr.rr_u_id }</td>
					<td><fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${fr.rr_date }"/></td>					
				</tr>
				<tr>
					<td colspan="3" class="replyTd">${fr.rr_replytxt }</td>	
					<c:if test="${fr.rr_u_id == sessionScope.loginMember.u_id 
						|| fr.rr_u_id == sessionScope.loginMember2.bo_id 
						|| sessionScope.loginMember3 != null}">
						<td colspan="3">
							<button class="rreplyUpdateBtn" value="updateGo">수정</button>
							<input type="hidden" value="${fb.rb_no}" class="fbVal">
							<input type="hidden" value="${fr.rr_no}" class="frVal1">
							<button onclick="rrdelete(${fr.rr_no},${fb.rb_no},${fr.rr_depth });">삭제</button>
						</td>		
					</c:if>								
				</tr>
				<tr>
					<c:choose>
						<c:when test="${fr.rr_u_id == sessionScope.loginMember.u_id 
								|| fr.rr_u_id == sessionScope.loginMember2.bo_id 
								|| sessionScope.loginMember3 != null}">
							<td colspan="4">
								<button id="replybtn" class="replybtn" value='0'>답글 보기▼</button>
							</td>
						</c:when>
						<c:when test="${fr.rr_u_id eq'(알수없음)'}">
							<c:choose>
								<c:when test="${sessionScope.loginMember.u_id == null
											|| sessionScope.loginMember2.bo_id == null
											|| sessionScope.loginMember3 == null}">
									<td colspan="4">
										<button id="replybtn" class="logout_replybtn" value='0'>답글 보기▼</button>
									</td>
								</c:when>
								<c:otherwise>
									<td colspan="4">
										<button id="replybtn" class="replybtn" value='0'>답글 보기▼</button>
									</td>
								</c:otherwise>
							</c:choose>
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
			<form action="r_replyinsert" name="frrwriteForm" onsubmit="return frr_writeCheck()">
				<table class="replyreply" border="1">
					<tr><td colspan="2">답글작성</td></tr>
					<tr>
						<td rowspan="2">
							<img src="resources/img/${sessionScope.loginMember.u_picture }
							${sessionScope.loginMember2.bo_picture }
							${sessionScope.loginMember3.root_picture }" width="30" height="30">
							<input type="hidden" name="rr_picture" 
							value="${sessionScope.loginMember.u_picture }${sessionScope.loginMember2.bo_picture }${sessionScope.loginMember3.root_picture }">
						</td>
						<td>
							${sessionScope.loginMember.u_id }
							${sessionScope.loginMember2.bo_id }
							${sessionScope.loginMember3.root_name }
							<input type="hidden" name="rr_u_id"
							value="${sessionScope.loginMember.u_id }${sessionScope.loginMember2.bo_id }${sessionScope.loginMember3.root_name }">					
						</td>
					</tr>
					<tr><td><input name="rr_replytxt"></td></tr>
					<tr>
						<td>
							<input type="hidden" name="rr_rb_no" value="${fb.rb_no}">
							<input type="hidden" name="rb_no" value="${fb.rb_no}">
							<input type="hidden" name="rr_owner_no" value="${fr.rr_no}">
							<input type="hidden" name="rr_owner_id" value="${fr.rr_u_id}">
							<input type="hidden" name="rr_depth" value="0">
							<button>등록</button>
						</td>
					</tr>
				</table>
			</form>
		</c:if>  
					
		<!-- 대댓글 select겸 insert -->
		<div class="asdasd" style="display: none">
		<c:forEach var="frr" items="${frr }">
		<c:if test="${frr.rr_owner_no == fr.rr_no }">				
			<table border="1" class="aabbcc">
				<tr>
					<td>
						<img src="resources/img/${frr.rr_picture }" width="30" height="30">
					</td>
					<c:if test="${frr.rr_depth == 1 }">
						<td style="color:red; background-color:yellow;">${frr.rr_owner_id }</td>
					</c:if>					
					<td style="background-color:orange;">${frr.rr_u_id }:</td>
					<td class="replyTd">${frr.rr_replytxt }</td>
					<td><fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${frr.rr_date }"/></td>
					<c:if test="${frr.rr_u_id == sessionScope.loginMember.u_id 
						|| frr.rr_u_id == sessionScope.loginMember2.bo_id 
						|| sessionScope.loginMember3 != null}">
						<td>
							<button class="rreplyUpdateBtn" value="updateGo">수정</button>
							<input type="hidden" value="${fb.rb_no}" class="fbVal">
							<input type="hidden" value="${frr.rr_no}" class="frVal1">
							<button onclick="rrrdelete(${frr.rr_no},${fb.rb_no},${frr.rr_depth },${frr.rr_owner_no });">삭제</button>
						</td>
					</c:if>	
					<td><button>답글</button></td>
				</tr>
			</table>
			<c:if test="${sessionScope.loginMember.u_id != null
						|| sessionScope.loginMember2.bo_id != null
						|| sessionScope.loginMember3 != null}">
			<form action="r_replyinsert">				
			<table border="1">
				<tr>							
					<td style="color:red;">
						${frr.rr_u_id }							
					</td>
					<td rowspan="2">
						<img src="resources/img/${sessionScope.loginMember.u_picture }
						${sessionScope.loginMember2.bo_picture }
						${sessionScope.loginMember3.root_picture }" width="30" height="30">
						<input type="hidden" name="rr_picture" 
						value="${sessionScope.loginMember.u_picture }${sessionScope.loginMember2.bo_picture }${sessionScope.loginMember3.root_picture }">
					</td>
					<td class="replyTd">
						${sessionScope.loginMember.u_id }
						${sessionScope.loginMember2.bo_id }
						${sessionScope.loginMember3.root_name }						
						<input name="rr_replytxt">
					</td>
					<td>
						<input type="hidden" name="rr_u_id"
							value="${sessionScope.loginMember.u_id }${sessionScope.loginMember2.bo_id }${sessionScope.loginMember3.root_name }">
						<input type="hidden" name="rr_rb_no" value="${frr.rr_rb_no }">
						<input type="hidden" name="rr_owner_no" value="${fr.rr_no }">
						<input type="hidden" name="rr_owner_id" value="${frr.rr_u_id }">
						<input type="hidden" name="rr_depth" value="1">
						<input type="hidden" name="rb_no" value="${fb.rb_no}">
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
            [<a href="r.onego?pg=1">◀◀</a>]
            [<a href="r.onego?pg=${fromPage -1}&rb_no=${fb.tip_no}">◀</a>] 
        </c:when>
        <c:otherwise>
            [<span style="color:gray">◀◀</span>]   
            [<span style="color:gray">◀</span>]
        </c:otherwise>
    </c:choose>
    <c:forEach var="i" begin="${fromPage }" end="${toPage }">
      	<c:choose>
	       	<c:when test = "${i == pg }"> 
        		[<span style="font-weight: bolder;">${i }</span>]
        	</c:when>        	
      	    <c:otherwise>
        		[<a href="r.onego?pg=${i }&rb_no=${fb.rb_no}">${i }</a>]
       		</c:otherwise>
       	</c:choose>
    </c:forEach>       
    <c:choose>
       	<c:when test = "${toPage < allPage }">
       		[<a href="r.onego?pg=${toPage + 1}&rb_no=${fb.rb_no}">▶</a>]
            [<a href="r.onego?pg=${allPage}&rb_no=${fb.rb_no}">▶▶</a>]
      	</c:when>
     	<c:otherwise>
       		[<span style="color:gray">▶</span>]
            [<span style="color:gray">▶▶</span>]
       	</c:otherwise>       
    </c:choose>
</div>
</body>
</html>
															