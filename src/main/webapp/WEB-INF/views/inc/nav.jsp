<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/bootstrap.css">
    <link rel="stylesheet" href="resources/css/main.css">
    <script src="resources/js/jquery.js"></script>

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<title>Insert title here</title>
<script>
    $(document).ready(function () {
        $('nav li').click(function () {
            // 클릭한 li 요소의 하위 ul 요소를 토글하여 보이거나 감춤
            $(this).find('ul').slideToggle();
        });
	// 문서 읽어올때 showImage 함수 호출 - 파라미터는 세션값등으로 부터 개인 유저별 정보 넣어줘야함
        showImage(${empno});
        
        
    });

    function openPop(){
    	var width = 500;
        var height = 400;
        var left = (screen.width - width) / 2;
        var top = (screen.height - height) / 2;

        var windowFeatures = 'width=' + width + ',height=' + height + ',left=' + left + ',top=' + top;
		window.open('profile','_blank',windowFeatures);
      
    }
//     	컨트롤러를 호출해서 이미지정보를 가져와 보여주는 함수
    	function showImage(fileCallPath){

    		console.log("##@#@# fileCallpath : "+fileCallPath);
//     		profile-img 클래스의 div의 html요소에 컨트롤러 메소드 호출하여 원본 이미지 파일을 출력하는 img태그를 삽입한다. 
    		$(".profile-img").html("<img src='./display?fileName="+encodeURI(fileCallPath)+".jpg"+"'>")
    		
    	}
</script>
</head>
<body>
  <!-- <nav>~</nav> 메인 페이지 좌측 Nav바 -->
    <nav>
    <div class="profile">
<!--     	<button style="float:left;">로그아웃</button> -->
        <div class="profile-img">
        
        </div>
            <div class="user-info">
                <p><b>고윤정</b></p>
                <p><b>개발2팀 사원</b></p>
            </div>
            </div>
    <!-- ul 태그내 메뉴 -->
    <ul>
        <li ><a href="#"><i class="bi bi-person-circle"></i> 사원정보</a>
            <!-- 서브메뉴는 제이쿼리 이용해서 토글처리(아래 제이쿼리 코드 참조) -->
            <ul>
                <li><a href="#" target="_blank" onclick="openPop()" >프로필사진 변경</a></li>
                <li><a href="#">서브메뉴2</a></li>
            </ul>
        </li>
        <li><a href="#"><i class="bi bi-calendar-week"></i>  휴가관리</a>
            <ul>
                <li><a href="#">서브메뉴1</a></li>
                <li><a href="#">서브메뉴2</a></li>
            </ul>
        </li>
        <li><a href="#"><i class="bi bi-file-earmark-check"></i>  전자결재</a> 
            <ul>
                <li><a href="#">서브메뉴1</a></li>
                <li><a href="#">서브메뉴2</a></li>
            </ul>
        </li>
        <li><a href="#"><i class="bi bi-boxes"></i> 자원요청</a>
            <ul>
                <li><a href="#">서브메뉴1</a></li>
                <li><a href="#">서브메뉴2</a></li>
            </ul>
        </li>
        <li><a href="#"><i class="bi bi-people-fill"></i> 커뮤니티</a>
            <ul>
                <li><a href="#">서브메뉴1</a></li>
                <li><a href="#">서브메뉴2</a></li>
            </ul>
        </li>
      </ul>
    </nav>
</body>
</html>