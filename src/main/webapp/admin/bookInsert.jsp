<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="book.admin.MainDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bookInsert</title>
<link rel="stylesheet" href="/book/resources/css/common.css" />
</head>
<body class="body">
	<jsp:include page="/admin/include/header.jsp"></jsp:include>
		<%String admin=(String) session.getAttribute("admin"); %>
		<%if(admin==null){ %>
			<script>
				alert("로그인 후 이용 가능 합니다.");
				location.href="shop/admin/login.jsp";
			</script>
		<%} else {%>
			
		<%} %>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>
