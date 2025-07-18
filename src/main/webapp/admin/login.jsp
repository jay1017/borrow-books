<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/book/resources/css/common.css" />
</head>
<body class="body">
	<jsp:include page="/admin/include/header.jsp"></jsp:include>
	<div class="container">
	<form action="loginPro.jsp" class="form-box">
		<input type="text" name="mid" id="mid" placeholder="아이디를 입력하세요" /><br/> 
		<input type="password" name="mpw" id="mpw" placeholder="비밀번호를 입력하세요" /><br/> 
		<input class="btn" type="submit" value="로그인">
	</form>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>