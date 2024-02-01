<!-- picture_content_view.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div class="container mt-5">
		<form>
			<h2 class="mb-4">글 내용 보기</h2>
			<input type="hidden" name="ppageNum" value="${pageMaker.ppageNum}">
			<input type="hidden" name="pamount" value="${pageMaker.pamount}">
			<input type="hidden" id="pid" name="pid" value="${pageMaker.pid}">
			<!-- pid를 id로도 추가 -->
			<table class="table table-bordered" style="max-width: 500px;">
				<tr>
					<th scope="row">번호</th>
					<td>${pcontent_view.pid}</td>
				</tr>
				<tr>
					<th scope="row">조회수</th>
					<td>${pcontent_view.phit}</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>${pcontent_view.pname}</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td>${pcontent_view.ptitle}</td>
				</tr>
				<tr>
					<th scope="row">이미지</th>
					<td><img
						src="${pageContext.request.contextPath}/display2?fileName=${pcontent_view.filename}">
					</td>
				</tr>
				<tr>
					<th scope="row">내용</th>
					<td>${pcontent_view.pcontent}</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="수정하기"
						formaction="picture_modify?ppageNum=${pageMaker.ppageNum}&pamount=${pageMaker.pamount}&pid=${pageMaker.pid}">
						&nbsp;&nbsp;<input type="submit" value="목록보기"
						formaction="picture_list">
				</tr>
			</table>
		</form>
		<!-- 댓글 기능 -->
		<jsp:include page="preply_write.jsp"></jsp:include>
		<jsp:include page="preply_list.jsp"></jsp:include>
		<c:forEach var="reply" items="${prlist}">
    작성자: <c:out value="${reply.prwriter}" />
			<br>
    내용: <c:out value="${reply.prcontent}" />
			<br>
    작성일: <c:out value="${reply.pregdate}" />
			<br>
			<hr>
		</c:forEach>
		<!-- 댓글 기능 끝 -->
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.8/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

