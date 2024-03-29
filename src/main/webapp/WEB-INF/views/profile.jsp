<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
    <link rel="stylesheet" href="resources/css/login.css">
    <script src="resources/js/jquery.js"></script>

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style>
.profile img {
        width: 80px; /* 프로필 이미지의 너비 설정 */
        height: 80px; /* 프로필 이미지의 높이 설정 */
        border-radius: 50%; /* 이미지를 원 모양으로 만들기 위해 원형 모양으로 잘라냅니다. */
    }
.profile{
    background-color: #f1f1f1;
        height: 20%;
        padding: 20px;
        text-align: center; /* 텍스트 정렬을 가운데로 조정 */
}
</style>
 <script>
        function showPreview(input) {
            if (input.files && input.files[0]) {
            	

                var reader = new FileReader();

                reader.onload = function (e) {
                    $('.profile-photo').attr('src', e.target.result);
                }
            	
 				
 
            } // end of 파일확장자 유효성 검사
                reader.readAsDataURL(input.files[0]);
        }
        

        $(document).ready(function () {
            // 파일 선택 시 미리보기 함수 호출
            $('input[type=file]').change(function () {
            	
                showPreview(this);            		
            	
            });
        });
    </script>
</head>

<body>

<div class="profileImg">
		<div class="profile">
		<img src = "" class = "profile-photo">
		</div>
	</div>
	<div class="uploadDiv">
	<form method="post" action="uploadFormAction" enctype="multipart/form-data">
		<input type="file" name="uploadFile" multiple>
		<input type="hidden" name="name" value="${empno} ">
		<input type="submit" value="변경하기">
		</form>
	</div>
<!-- 	<button type="button" id="uploadBtn" class="btn btn-primary btn-sm">변경하기</button> -->
</body>
</html>
