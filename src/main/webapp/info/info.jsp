<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/book/resources/css/common.css" />
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<div class="section-title">이용시간</div>
	<div class="container">
		<h4>이용시간</h4>
		<table class="table">
			<tr>
				<th>구분</th>
				<th colspan="2">이용시간</th>
			</tr>
			<tr>
				<td rowspan="2">화요일 ~ 금요일</td>
				<td>어린이 자료실</td>
				<td>09:00 ~ 18:00</td>
			</tr>
			<tr>
				<td>종합 자료실</td>
				<td>09:00 ~ 19:00</td>
			</tr>
			<tr>
				<td>토요일 ~ 일요일</td>
				<td>도서관 전체</td>
				<td>09:00 ~ 18:00</td>
			</tr>
		</table>
		<h4 style="margin-top: 40px;">자료 대출</h4>
		<table class="table">
			<tr>
				<th>대출 자격</th>
				<td>도서관 정회원</td>
			</tr>
			<tr>
				<th>대출 조건</th>
				<td>회원증은 본인만 사용가능</td>
			</tr>
			<tr>
				<th>대출 권수</th>
				<td>1인당 최대 "도서 5권" 또는 "도서 4권 +비도서 1점"</td>
			</tr>
			<tr>
				<th>대출 기간</th>
				<td>2주(14일) / 비도서 1주(7일)</td>
			</tr>
		</table>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>