<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="book.admin.MainDAO"%>
<!DOCTYPE html>
<html>
<head>
<%
MainDAO dao = MainDAO.getDAO();

int mcount = dao.memberCount();
int bcount = dao.bookCount();
int lcount = dao.loanCount();
int ncount = dao.notCount();
%>
<meta charset="UTF-8">
<title>메인</title>
<link rel="stylesheet" href="/book/resources/css/common.css" />
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<div>
		<img src="/book/resources/img/slide.jpg" style="width: 100%;" />
	</div>
	<table class="table">
		<tr>
			<th>회원 수</th>
			<th>도서 수</th>

		</tr>
		<tr>
			<td><%=mcount %></td>
			<td><%=bcount %></td>
		</tr>
		<tr>
			<th>대출 수</th>
			<th>미납 수</th>
		</tr>
		<tr>
			<td><%=lcount %></td>
			<td><%=ncount %></td>
		</tr>
	</table>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>
