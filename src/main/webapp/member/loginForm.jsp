<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="book.member.MemberDAO" %>
<%@ page import="book.member.MemberDTO" %>



<title>Login Page</title>
<html>
<h1>로그인</h1>

<body>
	<form action="loginPro.jsp">
		<input type="text" name="mid" id="mid" placeholder="아이디를 입력하세요" /> <br>
		<input type="password" name="mpw" id="mpw" placeholder="비밀번호를 입력하세요" /> 
		<input type="submit" value="로그인">
	</form>
</body>
</html>