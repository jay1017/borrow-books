<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/book/resources/css/common.css" />
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<div>
		<img src="/book/resources/img/slide.jpg" style="width: 100%;"/>
	</div>
	<div class="container">
		<h4>인기순</h4>
		<h4>대출순</h4>
		<h4>최신순</h4>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>