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
    <style>
 @import url('https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Noto+Sans+KR&display=swap');
    body {
       font-family: 'Noto Sans KR', sans-serif;
  margin: 0; 
  }
  
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
height : 600px;
background : white;
display:none;
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
border-radius: 3px;
}



}

</style>

 <script>
    $(document).ready(function () {
        $('nav li').click(function () {
            // 클릭한 li 요소의 하위 ul 요소를 토글하여 보이거나 감춤
            $(this).find('ul').slideToggle();
        });
	// 문서 읽어올때 showImage 함수 호출 - 파라미터는 세션값등으로 부터 개인 유저별 정보 넣어줘야함
		var empno = ${empno};
        showImage(empno);
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
    		$(".profile-img").html("<img src='./display?fileName="+encodeURI(fileCallPath)+".jpg'>")
    		
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
                <p> ${user.getName()} 님  ${user.getDname()}</p>
                
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
                <li><a href="#">서브메뉴2</a></li>
            </ul>
        </li>
        <li ><a href="people"><i class="bi bi-building"></i> 회사정보</a>
            <!-- 서브메뉴는 제이쿼리 이용해서 토글처리(아래 제이쿼리 코드 참조) -->
            <ul>
                <li><a href="#">사원검색</a></li>
                <li><a href="#">조직도</a></li>
            </ul>
        </li>
        
        <li><a href="vacationRequest"><i class="bi bi-calendar-week"></i>  휴가관리</a>
            <ul>
                <li><a href="vacationRequest">휴가신청</a></li>
                <li><a href="myVacationRequests">휴가신청내역</a></li>
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