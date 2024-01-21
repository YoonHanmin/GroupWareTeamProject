<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
</head>
<body>
	<h2>문서 목록</h2>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>제목</th>
			<th>내용</th>
			<th>상태</th>
			<th>조회</th>
		</tr>
		<c:forEach var="document" items="${documents}">
			<tr>
				<td>${document.doc_id}</td>
				<td>${document.doc_title}</td>
				<td>${document.doc_content}</td>
				<td>${document.doc_status}</td>
				<td><a
					href="${pageContext.request.contextPath}/documents/${document.doc_id}">상세
						보기</a></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<h3>새로운 문서 생성</h3>
	<form action="${pageContext.request.contextPath}/documents/create"
		method="post">
		제목: <input type="text" name="title" required><br> 내용:
		<textarea name="content" rows="4" cols="50" required></textarea>
		<br> <input type="submit" value="문서 생성">
	</form>
</body>
</html>