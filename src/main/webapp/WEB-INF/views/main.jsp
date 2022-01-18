<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>Insert title here</title>
<html>
<head>

<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/site_jquery.js"></script>
<script type="text/javascript" src="resources/js/member.js"></script>
<script type="text/javascript" src="resources/js/validCheck.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
${result }
<jsp:include page="${loginPage }"></jsp:include>
<button onclick="location.href='mypage'">마이페이지</button>
<hr>
<jsp:include page="${contentPage }"></jsp:include>

</body>
</html>