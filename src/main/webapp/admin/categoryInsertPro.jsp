<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="book.admin.CategoryDTO"%>
<%@ page import="book.admin.CategoryDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bookList</title>
<link rel="stylesheet" href="/book/resources/css/common.css" />
</head>
<body>
	<%	CategoryDTO dto=new CategoryDTO();
		String caname=request.getParameter("caname");
		dto.setCaname(caname);
		CategoryDAO dao=CategoryDAO.getDAO();
		dao.insert(caname);
	%>
</body>
</html>

