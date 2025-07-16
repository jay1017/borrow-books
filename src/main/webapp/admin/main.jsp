<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="book.admin.MainDAO"%>
<!DOCTYPE html>
<html>
<head>
<%
MainDAO dao = MainDAO.getDAO();

int mcount = dao.selectMemberCount(); //회원 수
int bcount = dao.selectBookCount();	//도서 수
int lcount = dao.selectLoanCount(); //대여 수
int ncount = dao.selectNotCount(); //미납 수
%>
<meta charset="UTF-8">
<title>메인</title>
<link rel="stylesheet" href="/book/resources/css/common.css" />
</head>
<body>
	<jsp:include page="/admin/include/header.jsp"></jsp:include>
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
