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

.header {
	height: 70px;
	border-bottom: 1px solid #eee;
	background-color: #363945;
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
	<main>
		<div class="header">
			<nav id="main_nav"
				class="navbar navbar-expand-lg bg-dark border-bottom border-body"
				style="width: 100%; height: 70px;">
				<div class="container-fluid">
					<a class="navbar-brand" href="main"
						style="color: white; margin-left: 50px;">메인</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">

							<li class="nav-item" style="margin-left: 50px;"><a
								class="nav-link" href="myinfo" style="color: white">마이페이지</a></li>
							<li class="nav-item dropdown" style="margin-left: 50px;"><a
								class="nav-link dropdown-toggle" style="color: white" href="#"
								role="button" data-bs-toggle="dropdown" aria-expanded="false"
								font-size="1.25rem"> 내 업무 </a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="approval"
										style="color: black">전자결재</a></li>
									<li><a class="dropdown-item" href="receive"
										style="color: black">메신저</a></li>
									<li><hr class="dropdown-divider" /></li>
									<li><a class="dropdown-item" href="vacationRequest"
										style="color: black">자원요청</a></li>
								</ul></li>

						</ul>
						<form class="d-flex" role="search">
							<input class="form-control me-2" type="search" placeholder="사원명"
								aria-label="Search" />
							<button class="btn btn-outline-success" type="submit"
								style="color: white">Search</button>
						</form>
					</div>
				</div>
			</nav>
		</div>
		<div class="content">
			<div class="container mt-5">
				<h2 class="mb-4">글 내용 보기</h2>
				<form method="post" action="pmodify" enctype="multipart/form-data">
					<input type="hidden" name="ppageNum" value="${pageMaker.ppageNum}">
					<input type="hidden" name="pamount" value="${pageMaker.pamount}">
					<input type="hidden" name="pid" value="${pageMaker.pid}">
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
							<td><input type="text" class="form-control" name="pname"
								value="${pcontent_view.pname}" readonly="readonly"></td>
						</tr>
						<tr>
							<th scope="row">제목</th>
							<td><input type="text" class="form-control" name="ptitle"
								value="${pcontent_view.ptitle}"></td>
						</tr>
						<tr>
							<th scope="row">이미지</th>
							<td><img
								src="${pageContext.request.contextPath}/display2?fileName=${pcontent_view.filename}">
								<input type="file" name="uploadFile"></td>
						</tr>
						<tr>
							<th scope="row">내용</th>
							<td><textarea class="form-control" name="pcontent">${pcontent_view.pcontent}</textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" class="btn btn-primary"
								value="수정" onclick="return confirm('수정하시겠습니까?');">
								&nbsp;&nbsp;<input type="submit" value="목록보기"
								formaction="picture_list" class="btn btn-secondary">
								&nbsp;&nbsp;<input type="submit" value="삭제" formaction="pdelete"
								onclick="return confirm('삭제하시겠습니까?');"
								class="btn btn-danger btn"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</main>
</body>
</html>

