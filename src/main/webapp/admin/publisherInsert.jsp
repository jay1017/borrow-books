<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="book.admin.MainDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>publisherInsert.jsp</title>
<link rel="stylesheet" href="/book/resources/css/common.css" />
</head>
<body>
	<jsp:include page="/admin/include/header.jsp"></jsp:include>
		<div class="container">
			<h2>출판사</h2>
				<form action="publisherInsertPro.jsp" class="form-box">
					<input type="text" name="pname" id="pname"/>
					<input type="submit" value="등록" class="btn"/>
				</form>
		</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>
