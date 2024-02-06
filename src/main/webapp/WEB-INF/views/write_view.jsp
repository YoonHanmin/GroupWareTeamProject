<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- 부트스트랩 CDN 추가 -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
            type: "post",
            data: $("#frm").serialize(),  // form 데이터를 직렬화하여 전송
            url: "write",
            success: function (data) {
                alert("등록 완료");
                location.href = "free_board_list";
            },
            error: function () {
                alert("오류 발생");
            }
        });
    }
</script>

</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">글 작성</h2>
    <form id="frm" method="post" action="write" >
        <div class="form-group row">
            <label for="bname" class="col-sm-2 col-form-label">이름</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="bname" id="bname" value="${dto.name}" readonly>
            </div>
        </div>
        
        <div class="form-group row">
            <label for="btitle" class="col-sm-2 col-form-label">제목</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="btitle" id="btitle" placeholder="제목을 입력하세요">
            </div>
        </div>
        
        <div class="form-group row">
            <label for="bcontent" class="col-sm-2 col-form-label">내용</label>
            <div class="col-sm-10">
                <textarea class="form-control" name="bcontent" id="bcontent" rows="5" placeholder="내용을 입력하세요"></textarea>
            </div>
        </div>
        
        <div class="form-group row">
            <div class="col-sm-10 offset-sm-2">
                <input type="button" onclick="fn_submit()" class="btn btn-primary" value="등록">
                <a href="free_board_list" class="btn btn-secondary">목록보기</a>
            </div>
        </div>
    </form>

</div>
<!-- 부트스트랩 JS 및 Popper.js CDN 추가 -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.8/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
