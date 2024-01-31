<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html lang="en">
<head>
<style>
 @import url('https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Noto+Sans+KR&display=swap');
    body {
       font-family: 'Noto Sans KR', sans-serif;
  margin: 0; 
  }
/*  메인 레이아웃 양식 */
  .header{
height : 80px;
border-bottom: 1px solid #eee;
display : flex;
}

.info{
height : 100px;
border-bottom: 1px solid #eee;
}

.item a {
font-weight : bold;
font-size : 25px;
margin-top: 20px; 
 text-decoration: none; /* 밑줄 제거 */
color : black;
}
.item ul li a{
margin-top : 20px;}
.item ul {
/* margin-top : 10px; */
height : 80px;
}
.item {
list-style: none;
}
.content{
width : 100%;

}
  
/*   메인 레이아웃 양식 끝 */
  
  .profile-tool{
  margin : 0;
  border-bottom: 1px solid #eee;
  }
  .profile-bar{
  display : flex;
  flex-direction : row;
  justify-content: space-between; /* 양쪽 끝에 배치하도록 설정 */
  }
  .profile-bar li {
  text-align : center;
  list-style: none; /* 기본 리스트 스타일 제거 */
  margin : 0;
  padding : 5px 30px;
  cursor: pointer;
}

.profile-tool .profile-bar li:hover {
  background-color: #555; /* 호버 시 배경색 */
  color: white; /* 호버 시 텍스트 색상 */
}
.popup_bg{
position: absolute;
top:0;
left:0;
width:100%;
height:100%;
background: rgba(0,0,0,0.7);
display:none;
z-index: 1; /* z-index 값 설정 */
}

.popup{
position : absolute;
left : calc(30% - 300px);
top : calc(50% - 300px);
width : 600px;
height : 300px;
background : white;
display:none;
border-radius: 8px;
 z-index: 2; /* z-index 값 설정 (팝업은 배경 팝업보다 위에 있어야 함) */

}
.popup > #messenger-out{
font-size: 2rem; 
float: right; 
margin-right:5px;
cursor: pointer;
}

.popup-logout{
position : absolute;
left : calc(50% - 150px);
top : calc(50% - 200px);
width : 200px;
height : 100px;
background : white;
display:none;
 z-index: 2; /* z-index 값 설정 (팝업은 배경 팝업보다 위에 있어야 함) */
border-radius: 5px;
}



}

</style>
 <script src="resources/js/jquery.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main</title>
<!--     document.ready 메소드는 jsp link inclide보다 빠르므로 미리 link태그 삽입해줘야 함-->
        <link rel="stylesheet" href="resources/css/main.css">
    <script>
    $(document).ready(function () {
        // ... 여러분의 기존 코드 ...

        // "서브메뉴1"을 클릭했을 때의 이벤트 리스너를 추가합니다
        $('li:contains("서브메뉴1")').click(function (event) {
            event.stopPropagation(); // 클릭 이벤트가 상위 li까지 전파되지 않도록 합니다
            // 클릭한 li의 하위 ul의 가시성을 토글합니다
            $(this).children('ul').slideToggle();
        });

        // ... 여러분의 기존 코드 ...
    });
    
    $(document).ready(function () {
        $('nav li').click(function () {
            // 클릭한 li 요소의 하위 ul 요소를 토글하여 보이거나 감춤
            $(this).find('ul').slideToggle();
        });
	// 문서 읽어올때 showImage 함수 호출 - 파라미터는 세션값등으로 부터 개인 유저별 정보 넣어줘야함
		var profile = "${user.profileimage}";
	
	
		var empno = ${empno};
        showImage(profile);
    // 로그아웃 기능    
	$("#logout").on("click",function(){
		$(".popup_bg").css({"display":"block"});
    	$(".popup-logout").css({ "display": "block" });
		// 예 -> 로그아웃하기
    	$("#logout-yes").on("click",function(){
    		location.href="logout";
    	});
    	// 취소 -> 원래대로
    	$("#cancle").on("click",function(){
    		$(".popup_bg").css({"display":"none"});
        	$(".popup-logout").css({ "display": "none" });
    	});
    	
	});
        
    // 메신저 클릭시 모달팝업 생성
    $("#messenger").on("click",function(){
    	$(".popup_bg").css({"display":"block"});
    	$(".popup").css({ "display": "block" });
    });
    $("#messenger-out").on("click",function(){
    	$(".popup_bg").css({"display":"none"});
    	$(".popup").css({ "display": "none" });
    });
    
    
    }); // end of ready(function)
	

    
    
    function openPop(){
    	var width = 400;
        var height = 200;
        var left = (screen.width - width) / 2;
        var top = (screen.height - height) / 2;

        var windowFeatures = 'width=' + width + ',height=' + height + ',left=' + left + ',top=' + top;
		window.open('profile','_blank',windowFeatures);
      
    }
//     	컨트롤러를 호출해서 이미지정보를 가져와 보여주는 함수
    	function showImage(fileCallPath){

    		console.log("##@#@# fileCallpath : "+fileCallPath);
//     		profile-img 클래스의 div의 html요소에 컨트롤러 메소드 호출하여 원본 이미지 파일을 출력하는 img태그를 삽입한다. 
//     		$(".profile-img").html("<img src='./display?fileName="+encodeURI(fileCallPath)+".jpg'>")
    		$(".profile-img").html("<a href='main'><img src='./display?fileName="+encodeURI(fileCallPath)+"'></a>")
    		
    	}
</script>
<%@ include file="/WEB-INF/views/inc/header_link.jsp" %>    
<!--     <link rel="stylesheet" href="resources/css/bootstrap.css"> -->

<!--     <script src="resources/js/jquery.js"></script> -->

<!--     <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> -->
<!--     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"> -->
</head>

<body>


 <!-- <nav>~</nav> 메인 페이지 좌측 Nav바 -->
    <nav>
    <div class="profile">
<!--     	<button style="float:left;">로그아웃</button> -->
        <div class="profile-img">
        
        </div>
            <div class="user-info">
                <p> ${user.getName()}</p>
                <p>${user.getDname()}</p>
            </div>
            </div>
            <div class="profile-tool">
            <ul class="profile-bar">
            	<li id="logout" style="margin-left:30px;"><i class="bi bi-box-arrow-left" style="font-size: 2rem;"></i></li>
            	<li id="messenger" style="margin-right:30px;"><i class="bi bi-envelope" style="font-size: 2rem;"></i></li>
            	
            	
            </ul>
            </div>
    <!-- ul 태그내 메뉴 -->
    <ul>
        <li ><a href="#"><i class="bi bi-person-circle"></i> 사원정보</a>
            <!-- 서브메뉴는 제이쿼리 이용해서 토글처리(아래 제이쿼리 코드 참조) -->
            <ul>
                <li><a href="#" target="_blank" onclick="openPop()" >프로필사진 변경</a></li>
                <li><a href="myinfo">내 사원 정보</a></li>
                <li><a href="people">회사 정보</a></li>
            </ul>
        </li>
        <li ><a href="receive"><i class="bi bi-envelope"></i> 메신저</a>
            <!-- 서브메뉴는 제이쿼리 이용해서 토글처리(아래 제이쿼리 코드 참조) -->
            <ul>
                <li><a href="#">메시지 작성</a></li>
                <li><a href="receive">내 메시지함</a></li>
            </ul>
        </li>
        
        <li><a href="#"><i class="bi bi-calendar-week"></i>  휴가관리</a>
            <ul>
                <li><a href="#">휴가 신청하기</a></li>
                <li><a href="#">휴가 신청내역</a></li>
            </ul>
        </li>
        <li><a href="#"><i class="bi bi-file-earmark-check"></i>  전자결재</a> 
            <ul>
                <li><a href="#">서브메뉴1</a></li>
                <li><a href="#">서브메뉴2</a></li>
            </ul>
        </li>
        <li><a href="resource_apply"><i class="bi bi-boxes"></i> 자원요청</a>
        </li>
        <li><a href="#"><i class="bi bi-people-fill"></i> 커뮤니티</a>
            <ul>
                <li><a href="notice_list">공지사항</a></li>
                <li><a href="free_board_list">자유게시판</a></li>
                <li><a href="picture_list">사진게시판</a></li>
            </ul>
        </li>
      </ul>
    </nav>
    
    <!--  메인 -->
    
    <main>
    <div class="header">
      	<ul class="nav nav-underline">
  <li class="item">
    <a class="people" aria-current="page" href="#" style="color:black;"><i class="bi bi-people-fill" style="color:black;"></i>내 사원정보</a>
  </li>
  <li class="item">
    <a class="company" href="#" style="color:black;"><i class="bi bi-list-ul" style="color:black;"></i>비밀번호 변경</a>
  </li>
</ul>      	
      </div>
      
      
<!--       <div class="info"> -->
      
<!--       </div> -->
      
        <div class="content">
 
      </div>
      
      
      
    </main>
    <!--  모달 팝업창-->
    <div class="popup">
 <i class="bi bi-x" id="messenger-out"></i>

 	</div>
 	
 
 
    
    
<!--     팝업 배경 창 -->
	<div class="popup_bg"></div> 
    
    <div class="popup-logout">
    	<div style="text-align:center;margin-top:10px;"><b>로그아웃 하시겠습니까?</b></div>
    	<div style="margin-top:20px; margin-left:30px;">
    	<button id="logout-yes">로그아웃</button>
    	<button id="cancle">취소</button>
    	</div>
    </div>
    
    
</body>
<script>
   
</script>
</html>