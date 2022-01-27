<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript" src="resources/js/place.js"></script>
<script type="text/javascript" src="resources/js/place_review.js"></script>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/site_jquery.js"></script>
<script type="text/javascript" src="resources/js/member.js"></script>
<script type="text/javascript" src="resources/js/board.js"></script>
<script type="text/javascript" src="resources/js/validCheck.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<table id="siteLoginArea">
	<tr>
		<td><jsp:include page="${loginPage }"></jsp:include></td>
	</tr>
</table>
<table id="siteContnetArea">
	<tr>
		<td align="center"><jsp:include page="${contentPage }"></jsp:include></td>
	</tr>
</table>


</body>
</html>