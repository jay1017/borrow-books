<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="header">
	<div class="logo">신림도서관</div>
	<div class="nav">
		<a href="/book/info/info.jsp">도서</a> <a href="/search.jsp">카테고리</a> 
		<a href="">출판사</a> <a href="">회원</a>
	</div>
	<div class="nav">
		<%
		String mid = (String) session.getAttribute("admin");
		if (mid == null) {
		%>
		<a href="/book/admin/login.jsp">로그인</a> <a href="/mypage.jsp">마이페이지</a>
		<%
		} else {
		%>
		<a href="/book/admin/logout.jsp">로그아웃</a> <a href="/mypage.jsp">마이페이지</a>
		<%}%>
	</div>
</div>