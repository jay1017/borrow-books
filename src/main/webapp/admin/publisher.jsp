<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="book.admin.PublisherDTO"%>
<%@ page import="book.admin.PublisherDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<%
PublisherDAO dao = PublisherDAO.getDAO();
List<PublisherDTO> list = dao.selectList();
%>
<meta charset="UTF-8">
<title>publisherList</title>
<link rel="stylesheet" href="/book/resources/css/common.css" />
</head>
<body>
	<jsp:include page="/admin/include/header.jsp"></jsp:include>
	<div class="container">
		<table class="table">
			<tr>
				<th>출판사 번호</th>
				<th>출판사명</th>
			</tr>
			<button type="button" class="btn" onclick="location.href='publisherInsert.jsp'">등록</button>
			<%
			for (PublisherDTO dto : list) {
			%>
			<tr>
				<td><%=dto.getPnum()%></td>
				<td><%=dto.getPname()%></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>
