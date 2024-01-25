<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"></script>
<script>
        // 창 크기를 조절하는 JavaScript 함수
        function resizeWindow() {
            // 원하는 가로, 세로 크기로 조절
            window.resizeTo(400, 200);
        }
        
        // 페이지 로드 시 자동으로 창 크기를 조절하도록 설정
        window.onload = resizeWindow;
    </script>
</head>
<body>
	<h3>프로필 사진 변경 실패!<br>파일 이름에 . 이 포함되어있습니다. 파일명을 변경해주세요.</h3>

</body>
</html>