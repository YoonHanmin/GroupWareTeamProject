<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
</head>
<body>
	<h2>문서 상세 정보</h2>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>제목</th>
			<th>내용</th>
			<th>상태</th>
		</tr>
		<tr>
			<td>${document.doc_id}</td>
			<td>${document.doc_title}</td>
			<td>${document.doc_content}</td>
			<td>${document.doc_status}</td>
		</tr>
	</table>
	<br>
	<h3>문서 처리</h3>
	<form
		action="${pageContext.request.contextPath}/documents/approve/${document.doc_id}"
		method="post">
		<input type="submit" value="문서 승인">
	</form>
	<form
		action="${pageContext.request.contextPath}/documents/reject/${document.doc_id}"
		method="post">
		<input type="submit" value="문서 거부">
	</form>
</body>
</html>