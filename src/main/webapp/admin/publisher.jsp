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
// 페이징 처리 파라미터
String pageParam = request.getParameter("page");
int currentPage = (pageParam != null) ? Integer.parseInt(pageParam) : 1;
int pageSize = 10; // 페이지당 보여줄 레코드 수

PublisherDAO dao = PublisherDAO.getDAO();
List<PublisherDTO> list = dao.selectList(currentPage, pageSize);
int totalCount = dao.getTotalCount();
int totalPages = dao.getTotalPages(pageSize);
%>
<meta charset="UTF-8">
<title>publisherList</title>
<link rel="stylesheet" href="/book/resources/css/common.css" />
</head>
<body>
	<jsp:include page="/admin/include/header.jsp"></jsp:include>
	<div class="container">
		<h2>출판사 목록</h2>
		
		<!-- 등록 버튼 -->
		<div style="text-align: right; margin-bottom: 10px;">
			<button type="button" class="btn" onclick="location.href='publisherInsert.jsp'">등록</button>
		</div>
		
		<!-- 목록 정보 -->
		<div class="info">
			총 <%= totalCount %>개의 출판사 (전체 <%= totalPages %>페이지 중 <%= currentPage %>페이지)
		</div>
		
		<!-- 출판사 목록 테이블 -->
		<table class="table">
			<tr>
				<th>출판사 번호</th>
				<th>출판사명</th>
			</tr>
			<%
			if (list.isEmpty()) {
			%>
			<tr>
				<td colspan="2" style="text-align: center;">등록된 출판사가 없습니다.</td>
			</tr>
			<%
			} else {
				for (PublisherDTO dto : list) {
			%>
			<tr>
				<td><%=dto.getPnum()%></td>
				<td><%=dto.getPname()%></td>
				<td><button type="button" class="btn" onclick="location.href='publisherInsert.jsp?<%=dto.getPnum()%>&<%=dto.getPname()%>'">update</button></td>
				<td><button type="button" class="btn" onclick="location.href='publisherInsert.jsp?<%=dto.getPnum()%>&<%=dto.getPname()%>'">delete</button></td>
			</tr>
			<%
				}
			}
			%>
		</table>
		
		<!-- 페이징 네비게이션 -->
		<div class="pagination">
			<%
			// 이전 페이지 블록 (1~10, 11~20, ...)
			int pageBlock = 10; // 한 번에 보여줄 페이지 번호 개수
			int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
			int endPage = Math.min(startPage + pageBlock - 1, totalPages);
			
			// 맨 처음 페이지로
			if (currentPage > 1) {
			%>
				<a href="/book/admin/publisher.jsp?page=1">처음</a>
			<%
			} else {
			%>
				<span class="disabled">처음</span>
			<%
			}
			
			// 이전 페이지 블록
			if (startPage > 1) {
			%>
				<a href="/book/admin/publisher.jsp?page=<%= startPage - 1 %>">이전</a>
			<%
			} else {
			%>
				<span class="disabled">이전</span>
			<%
			}
			
			// 페이지 번호들
			for (int i = startPage; i <= endPage; i++) {
				if (i == currentPage) {
			%>
				<span class="current"><%= i %></span>
			<%
				} else {
			%>
				<a href="/book/admin/publisher.jsp?page=<%= i %>"><%= i %></a>
			<%
				}
			} 
			
			// 다음 페이지 블록
			if (endPage < totalPages) {
			%>
				<a href="/book/admin/publisher.jsp?page=<%= endPage + 1 %>">다음</a>
			<%
			} else {
			%>
				<span class="disabled">다음</span>
			<%
			}
			
			// 맨 마지막 페이지로
			if (currentPage < totalPages) {
			%>
				<a href="/book/admin/publisher.jsp?page=<%= totalPages %>">끝</a>
			<%
			} else {
			%>
				<span class="disabled">끝</span>
			<%
			}
			%>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>