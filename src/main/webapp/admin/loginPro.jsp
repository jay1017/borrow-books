<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="book.admin.LoginDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String mid = request.getParameter("mid");
	String mpw = request.getParameter("mpw");

	LoginDAO dao = LoginDAO.getDAO();
	boolean result = dao.LoginCheck(mid, mpw);

	if (result) {
	%>
	<script>
		alert("로그인 되었습니다");
		location.href = "/book/admin/main.jsp";
	</script>
	<%
	session.setAttribute("admin", mid);
	} else {
	%>
	<script>
		alert("로그인에 실패하였습니다");
		history.go(-1);
	</script>
	<%
	}
	%>
</body>
</html>