<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 CDN 추가 -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
	function fn_submit() {
		// 사용자가 입력한 값들 가져오기
		var bname = $("#bname").val();
		var btitle = $("#btitle").val();
		var bcontent = $("#bcontent").val();

		// 필수 입력 검사
		if (btitle.trim() === "" || bcontent.trim() === "") {
			alert("글 제목과 내용은 필수 입력 항목입니다.");
			return;
		}

		// Ajax로 서버에 전송
		$.ajax({
			type : "post",
			data : $("#frm").serialize(), // form 데이터를 직렬화하여 전송
			url : "write",
			success : function(data) {
				alert("등록 완료");
				location.href = "free_board_list";
			},
			error : function() {
				alert("오류 발생");
			}
		});
	}

	$(document).ready(
			function() {
				var profile = "${dto.getProfileimage()}";
				console.log("프로필사진명은 ==>" + profile);
				$("#profile-image").html(
						"<img src='./display?fileName=" + profile + "'>");

			});
</script>
<style>
.header {
	height: 70px;
	border-bottom: 1px solid #eee;
	background-color: #363945;
}
</style>
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
		<div class="container mt-5">
			<h2 class="mb-4">글 작성</h2>
			<form id="frm" method="post" action="write">
				<div class="form-group row">
					<label for="bname" class="col-sm-2 col-form-label">이름</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="bname" id="bname"
							value="${dto.name}" readonly>
					</div>
				</div>

				<div class="form-group row">
					<label for="btitle" class="col-sm-2 col-form-label">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="btitle" id="btitle"
							placeholder="제목을 입력하세요">
					</div>
				</div>

				<div class="form-group row">
					<label for="bcontent" class="col-sm-2 col-form-label">내용</label>
					<div class="col-sm-10">
						<textarea class="form-control" name="bcontent" id="bcontent"
							rows="5" placeholder="내용을 입력하세요"></textarea>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-sm-10 offset-sm-2">
						<input type="button" onclick="fn_submit()" class="btn btn-primary"
							value="등록"> <a href="free_board_list"
							class="btn btn-secondary">목록보기</a>
					</div>
				</div>
			</form>

		</div>
		<!-- 부트스트랩 JS 및 Popper.js CDN 추가 -->
		<script
			src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.8/dist/umd/popper.min.js"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
