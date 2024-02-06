<!-- picture_modify.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.8/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.content {
	margin-left: 300px;
}
</style>
<script>
	$(document).ready(
			function() {
				var profile = "${dto.getProfileimage()}";
				console.log("프로필사진명은 ==>" + profile);
				$("#profile-image").html(
						"<img src='./display?fileName=" + profile + "'>");

			});
</script>
</head>
<body>
	<jsp:include page="nav2.jsp" />

	<div class="content">
		<div class="container mt-5">
			<h2 class="mb-4">글 내용 보기</h2>
			<form method="post" action="modify" enctype="multipart/form-data">
				<input type="hidden" name="pageNum" value="${pageMaker.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.amount}">
				<input type="hidden" name="bid" value="${pageMaker.bid}">
				<table class="table table-bordered" style="max-width: 500px;">
					<tr>
						<th scope="row">번호</th>
						<td>${content_view.bid}</td>
					</tr>
					<tr>
						<th scope="row">조회수</th>
						<td>${content_view.bhit}</td>
					</tr>
					<tr>
						<th scope="row">작성자</th>
						<td><input type="text" class="form-control" name="bname"
							value="${content_view.bname}" readonly="readonly"></td>
					</tr>
					<tr>
						<th scope="row">제목</th>
						<td><input type="text" class="form-control" name="btitle"
							value="${content_view.btitle}"></td>
					</tr>
					<tr>
						<th scope="row">내용</th>
						<td><textarea class="form-control" name="bcontent">${content_view.bcontent}</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" class="btn btn-primary"
							value="수정" onclick="return confirm('수정하시겠습니까?');">
							&nbsp;&nbsp;<input type="submit" value="목록보기"
							formaction="free_board_list" class="btn btn-secondary">
							&nbsp;&nbsp;<input type="submit" value="삭제" formaction="delete"
							onclick="return confirm('삭제하시겠습니까?');"
							class="btn btn-danger btn"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>

