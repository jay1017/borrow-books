<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="book.member.MemberDTO" %>
<%@ page import="book.member.MemberDAO" %>
<%@ page import="book.member.LoginDAO" %>
<%
//loginForm에서 입력한 값
String mid = request.getParameter("mid");
String mpw = request.getParameter("mpw");

MemberDAO dao = MemberDAO.getInstance();
MemberDTO dto = new MemberDTO();
dto.setMid(mid);
dto.setMpw(mpw);

LoginDAO ldao = LoginDAO.getInstance();
int log = ldao.Login(mid, mpw);

if(log == 1){
	session.setAttribute("mid",dto.getMid());
	response.sendRedirect("/book/main/main.jsp");
}else{%>
	<script >
	alert("아이디와 비밀번호를 확인해주세요");
	history.go(-1);
</script>
<%}
%>
<h1></h1>