<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main</title>
    <link rel="stylesheet" href="resources/css/bootstrap.css">
    <link rel="stylesheet" href="resources/css/login.css">
    <script src="resources/js/jquery.js"></script>

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Noto+Sans+KR&display=swap');
    body {
       font-family: 'Noto Sans KR', sans-serif;
  margin: 0;
  
}
main {
margin-left: 250px; /* nav의 너비만큼 main을 오른쪽으로 이동 */
        padding: 1px 16px;
        height: 1000px;
}
nav .profile{
    background-color: #f1f1f1;
    height: 20%;
    
    padding: 20px;
}
.profile img {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        cursor: pointer; /* 클릭 가능한 요소로 설정 */
    }

nav {
    margin: 0;
        padding-top: 10px; /* nav 상단에 여백 추가 */
        width: 250px;
        background-color: #f1f1f1;
        position: fixed;
        height: 100%;
        overflow: auto;
}
nav ul{
    list-style-type: none;
    margin: 0;
  padding: 0;
}

li a {
  display: block;
  color: #000;
  padding:20px 16px;
  text-decoration: none;
}

li a.active {
  background-color: #eee;
  color: #555;
}

li a:hover:not(.active) {
  background-color: #555;
  color: white;
}
.profile{
 text-align: center; /* 텍스트 정렬을 가운데로 조정 */
    background-color: #f1f1f1;
        height: 20%;
        padding: 20px;
}
.user-info {
        text-align: center; /* 텍스트 정렬을 가운데로 조정 */
        margin-top: 10px; /* 이미지와 텍스트 사이의 간격 조정 */
    }
    .profile img {
        width: 80px; /* 프로필 이미지의 너비 설정 */
        height: 80px; /* 프로필 이미지의 높이 설정 */
        border-radius: 50%; /* 이미지를 원 모양으로 만들기 위해 원형 모양으로 잘라냅니다. */
    }
    nav li ul {
        display: none;
    font-size: 14px; /* 서브메뉴의 폰트 크기 조절 */
    padding: 10px; /* 서브메뉴의 패딩 조절 */
    max-height: 200px;
    }
   
</style>
<body>
    <!-- <nav>~</nav> 메인 페이지 좌측 Nav바 -->
    <nav>
    <div class="profile">
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
    <main>
      <div style="margin-left:25%;padding:1px 16px;height:1000px;">
      <h1>Main page</h1>
      </div>
    </main>
</body>
<script>
    $(document).ready(function () {
        $('nav li').click(function () {
            // 클릭한 li 요소의 하위 ul 요소를 토글하여 보이거나 감춤
            $(this).find('ul').slideToggle();
        });
	// 문서 읽어올때 showImage 함수 호출 - 파라미터는 세션값등으로 부터 개인 유저별 정보 넣어줘야함
        showImage('profile2.jpg');
        
        
    });

    function openPop(){
    	var width = 400;
        var height = 300;
        var left = (screen.width - width) / 2;
        var top = (screen.height - height) / 2;

        var windowFeatures = 'width=' + width + ',height=' + height + ',left=' + left + ',top=' + top;
		window.open('profile','_blank',windowFeatures);
      
    }
//     	컨트롤러를 호출해서 이미지정보를 가져와 보여주는 함수
    	function showImage(fileCallPath){

    		console.log("##@#@# fileCallpath : "+fileCallPath);
//     		profile-img 클래스의 div의 html요소에 컨트롤러 메소드 호출하여 원본 이미지 파일을 출력하는 img태그를 삽입한다. 
    		$(".profile-img").html("<img src='./display?fileName="+encodeURI(fileCallPath)+"'>")
    		
    	}
</script>
</html>