<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--      hiredate 날짜 포맷 형식 변경 -->
      <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
  <script src="https://kit.fontawesome.com/82c57657fe.js" crossorigin="anonymous"></script>
<!-- FullCalendar 라이브러리 및 jQuery 추가 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@latest/main.min.css" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/moment@latest/moment.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@latest/main.min.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var vacationEventsJson = '${vacationEventsJson}';
		var vacationEventsArray = JSON.parse(vacationEventsJson);
		console.log(vacationEventsArray);

		var eventsArray = [];
		console.log(eventsArray);

		for (var i = 0; i < vacationEventsArray.length; i++) {
			var eventData = vacationEventsArray[i];
			console.log('title:', eventData.vacationtype); // 확인을 위한 로그 추가
			eventsArray.push({
				title : eventData.vacationtype,
				start : eventData.startdate,
				end : eventData.enddate+1
			});
		}

		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			initialView : 'dayGridMonth',
			
			events : eventsArray,
	        eventContent: function (info) {
	            var title = info.event.title.replace('12a', ''); // "12a" 삭제
	            var titleElement = document.createElement('div');
	            titleElement.classList.add('fc-title');
	            titleElement.textContent = title;
	            return { domNodes: [titleElement] };
	        },
			eventDisplay: 'block' // 이벤트를 블록 형태로 표시
	    });
		calendar.render();
	});
</script>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<style>
 @import url('https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Noto+Sans+KR&display=swap');
    body {
       font-family: 'Noto Sans KR', sans-serif;
  margin: 0; 
  }
/*  메인 레이아웃 양식 */
.header{
height : 70px;
border-bottom: 1px solid #eee;
background-color : #363945;

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
height : 100%;
display : flex;
flex-direction: row;
flex-wrap: wrap;
}
.info{
height : 50px;

}
.main_img{
width : 700px;
height : 400px;
}
.notice_img{
width : 600px;

height : 300px;
margin-left : 50px;
}
.notice_img_header{
width : 600px;

border-top : 2px solid #363945;

margin-left : 50px;
}
.notice_img_header span{
display : inline;
font-size : 28px;
font-weight : bold;

}
.notice_board_title a{
text-decoration: none;
font-weight : bold;
}
.notice_board_title{
margin-bottom : 3px;
margin-left : 10px;
}
.main_notice{
width : 500px;
height : 300px;
}
.mycalendar{
margin-bottom : 30px;
border-bottom : 2px solid black;
font-size : 28px;
font-weight : bold;
}
.main_approval{
width : 400px;
}
.main_approval_board{
width : 400px;
height : 300px;
border : 2px solid #eee;
}
.main_todo_board{
display : block;
}

.main_ing_board{
display : none;
}

.main_notice_board{
width : 400px;
height : 300px;
border : 2px solid #eee;
}
.main_notice_header span{
display : inline;
font-size : 28px;

}
.main_notice_header{
margin-bottom:20px;
}
.main_approval_header span{
display : inline;
font-size : 28px;

}
.main_approval_header a{

text-decoration: none;
}
.main_calendar{
width : 600px;
margin-left : 50px;
height : 400px;
margin-bottom : 200px;
/* margin-bottom : 300px; */
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

.popup_bg{
border : 2px solid black;
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
width : 300px;
/* height : 300px; */
background : white;
display:none;

 z-index: 2; /* z-index 값 설정 (팝업은 배경 팝업보다 위에 있어야 함) */

}
.popup > #messenger-out{
font-size: 2rem; 
float: right; 
margin-right:3px;
cursor: pointer;
display : inline;
/* height : 30px; */
/* margin-bottom:30px; */
/* padding-bottom:30px; */
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

.popup_notify:hover{
background-color : #eee;
cursor: pointer;
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
  

    window.onload = function () {
    	
    	const empno = $("input[name='empno']").val();
    	console.log(empno);
    const eventSource = new EventSource("/connect/"+empno)
    
    eventSource.addEventListener('NewMsg', function(e){
        console.log(e.data);
        const receivedConnectData = JSON.parse(e.data);
        console.log('connect event data:', receivedConnectData);
       if(receivedConnectData.msgDto!=null){
    	var notifyTime = receivedConnectData.time;
    	var currentTime = new Date().getTime();
    	var time = currentTime - notifyTime;
    	var minute_before = Math.floor(time/(1000*60));
    
        var msgFromName = receivedConnectData.msgDto.from_name;
        console.log(msgFromName);
        var notify_num = ${notifyList.size()};
        notify_num = notify_num+1;
        console.log(notify_num);
//         var spanElement = $(' <span id=notify_num class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">')
//         .text(notify_num+1);

      $('#notify_num').text(notify_num);
      
      var newDiv = $('<div id="popup_notify" style="height:40px;width:300px; font-weight:bold;  font-size:14px; text-align:center;border:1px solid #eee; background-color:white; display:flex; flex-direction: row;">')
      .append(" <div  style='margin-left:5px; margin-top:5px;'><img src='resources/images/msg.png' style='width:25px; height:25px;margin-right:5px;'></div><div style='margin-left:5px; margin-top:5px;'>"+msgFromName+
      "님이 메시지를 보냈습니다.</div><p style='color:#9e9e9e;margin-left:5px; margin-top:5px;'>&nbsp;"+minute_before+"분전</p>");

    $("#new_notify").after(newDiv);
      
      
      
       }
    });
    
  
    };
    
    
    
    
    $(document).ready(function () {
        

        // "서브메뉴1"을 클릭했을 때의 이벤트 리스너를 추가합니다
        $('li:contains("서브메뉴1")').click(function (event) {
            event.stopPropagation(); // 클릭 이벤트가 상위 li까지 전파되지 않도록 합니다
            // 클릭한 li의 하위 ul의 가시성을 토글합니다
            $(this).children('ul').slideToggle();
        });
	
        
        $("#app_todo").on("click",function(){
        	$(".main_todo_board").css({"display":"block"});
        	$(".main_ing_board").css({ "display": "none" });
        	
        });
        $("#app_ing").on("click",function(){
        	$(".main_ing_board").css({ "display": "block" });
        	$(".main_todo_board").css({"display":"none"});
        	
        });
        
        	
        
       
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
    
    $("#popup_notify_approval").on("click",function(){
    	location.href="approval";
    	
    });
    $("#popup_notify_msg").on("click",function(){
    	location.href="receive";
    	
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
                <input type="hidden" name="empno" value="${user.getEmpno()}">


 <!-- <nav>~</nav> 메인 페이지 좌측 Nav바 -->
    <nav class="nav2">
    <div class="profile">
<!--     	<button style="float:left;">로그아웃</button> -->
        <div class="profile-img">
        
        </div>
            <div class="user-info">
                <p> ${user.getName()}</p>
                <p>${user.getDname()}</p>
               
            </div>
            </div>
            <div class="profile-tool" style="margin-bottom:20px;">
            <ul class="profile-bar">
<!--             	<li id="logout" style="margin-left:30px; "><i class="bi bi-box-arrow-left" style="font-size: 2rem; margin-bottom:10px;"></i></li> -->

<!-- 				<li  style="margin-left:30px; margin-right:10px; "><button id="logout" type="button" class="btn btn-primary position-relative">LOGOUT</button></li> -->
<!--             	<li id="messenger" style="margin-right:30px; height:35px;"><button id="Notify_btn"type="button" class="btn btn-primary position-relative"> -->
<!--   Messenger -->
<!-- </button></li> -->
				<li id="logout" style="height:30px;cursor:pointer; margin-left:20px;">
				<button type="button" class="btn btn-primary position-relative" style="background-color:#363945;border:1px solid #363945"> 로그아웃 </button></li>
            	
            	<li id="messenger" style="height:30px;margin-right:30px; height:35px;cursor:pointer; "><button type="button" class="btn btn-primary position-relative" style="background-color:#363945;border:1px solid #363945">
      새소식
      <c:choose>
    <c:when test="${notifyList.size() > 0}">
        <span id="notify_num" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
            ${notifyList.size()}
        </span>
    </c:when>
</c:choose>
      
      
    </button></li>

            		
            	
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
                <li><a href="vacationRequest">휴가 신청하기</a></li>
                <li><a href="myVacationRequests">휴가 신청내역</a></li>
            </ul>
        </li>
        <li><a href="#"><i class="bi bi-file-earmark-check"></i>  전자결재</a> 
            <ul>
                <li><a href="approval">전자결재함</a></li>
                <li><a href="approval_write">전자결재 작성</a></li>
            </ul>
        </li>
        <li><a href="#"><i class="bi bi-file-earmark-check"></i>  자원요청</a> 
        <ul>
        	<li><a href="resource_apply"><i class="bi bi-boxes"></i> 신청하기</a>
       	 	<li><a href="resource_approval"><i class="bi bi-boxes"></i> 자원요청 목록</a>
        </li>
        </ul>
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

 <nav id="main_nav" class="navbar navbar-expand-lg bg-dark border-bottom border-body" style="width:100%;">
      <div class="container-fluid">
        <a class="navbar-brand" href="#" style="color: white">메인</a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
           
            <li class="nav-item">
              <a class="nav-link" href="#" style="color: white">Link</a>
            </li>
            <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle"
                style="color: white"
                href="#"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
              >
                Dropdown
              </a>
              <ul class="dropdown-menu">
                <li>
                  <a class="dropdown-item" href="#" style="color: white"
                    >Action</a
                  >
                </li>
                <li>
                  <a class="dropdown-item" href="#" style="color: white"
                    >Another action</a
                  >
                </li>
                <li><hr class="dropdown-divider" /></li>
                <li>
                  <a class="dropdown-item" href="#" style="color: white"
                    >Something else here</a
                  >
                </li>
              </ul>
            </li>
           
          </ul>
          <form class="d-flex" role="search">
            <input
              class="form-control me-2"
              type="search"
              placeholder="Search"
              aria-label="Search"
            />
            <button
              class="btn btn-outline-success"
              type="submit"
              style="color: white"
            >
              Search
            </button>
          </form>
        </div>
      </div>
    </nav>



      </div>
      
      
      <div class="info">
      
     
      
      </div>
      
 			
 				
 				
 				
        <div class="content">
        <div class="main_img">
         <div class="notice_img_header">
         <span style="margin-top:5px; margin-left:10px;">
         <img src="resources/images/news.png" style="width:60px; height:60px; display:inline;">
      2월의 소식</span>
      </div>
        <div class="notice_img">
        
        <div class="swiper">
  <!-- Additional required wrapper -->
  <div class="swiper-wrapper">
    <!-- Slides -->
    <div class="swiper-slide">
    <img src="resources/images/notice_img.jpg" style="width:600px; height:300px;">
    </div>
    <div class="swiper-slide">
     <img src="resources/images/notice_img2.JPG" style="width:600px; height:300px;">
    </div>
    <div class="swiper-slide">
    <img src="resources/images/notice_img3.JPG" style="width:600px; height:300px;">
    </div>
  </div>
  <!-- If we need pagination -->
  <div class="swiper-pagination"></div>

  <!-- If we need navigation buttons -->
  <div class="swiper-button-prev"></div>
  <div class="swiper-button-next"></div>

  <!-- If we need scrollbar -->
  <div class="swiper-scrollbar"></div>
</div>
        
       
        </div>
        </div> <!-- end of main_img -->
        
        <div class="main_notice">
        	<div class="main_notice_board">
        	<div class="main_notice_header" style="border-bottom:1px solid black">
        	<span style="margin-top:5px; margin-left:10px;">
        	<img src="resources/images/notice.png" style="width:40px; height:40px; display:inline;">
        	<a href="/notice_list" style="text-decoration: none; color:black; font-weight:bold">&nbsp;&nbsp;공지사항</a></span>
        	</div>
        	<c:forEach items="${noticeList}" var="noticeList">
        		<div class="notice_board_title" style="border-bottom:1px solid #eee; margin-bottom:5px;">
        			<a href="notice_content_view?nid=${noticeList.getNid()}">${noticeList.getNtitle()}</a>
        		</div>
        	</c:forEach>
        	
        </div>
        
        	</div>
        	 <div class="main_approval">
        	<div class="main_approval_board">
        	<div class="main_approval_header" style="border-bottom:1px solid black">
        		<span style="margin-top:5px; margin-left:10px;">
        		<img src="resources/images/document_icon.png" style="width:30px; height:30px; display:inline;">
        		<b>&nbsp;&nbsp;나의 결재현황</b></span>
        	</div>
        	<div class="main_approval_tab">
        		<ul class="nav nav-underline">
  <li class="nav-item" style="cursor:pointer;">
    <a class="nav-link active" id="app_todo">결재요청 문서</a>
  </li>
  <li class="nav-item" style="cursor:pointer;">
    <a class="nav-link" id="app_ing">결재중인 문서</a>
  </li>
</ul>
        	</div>
        	<div class="main_todo_board">
        		<c:forEach items="${todoList}" var="todoList">
        		<div style="border-bottom:1px solid #eee; margin-bottom:5px; ">
        			&nbsp;&nbsp;<b>${todoList.getDoc_title()}</b>
        		</div>
        		</c:forEach>
        	</div>
        	<div class="main_ing_board">
        		<c:forEach items="${ingList}" var="ingList">
        		<div style="border-bottom:1px solid #eee; margin-bottom:5px;">
        		&nbsp;&nbsp;<b>${ingList.getDoc_title()}</b>
        		</div>
        		</c:forEach>
        	</div>
        </div>
        	</div>
        	
        	
        <div class="main_calendar">
        	<div class="calendar-container">
        	<div class="mycalendar">
        	내 일정
			</div>
			<div id="calendar" style="width:600px; height:400px;"></div>
		</div>
        
        
        </div>
        
      </div>
      
      
      
    </main>
    <!--  모달 팝업창-->
    <div class="popup">
 <i class="bi bi-x" id="messenger-out"></i>
	<div style="height:40px; font-weight:bold; font-size:20px; background-color:white; ">
	<span id="new_notify" style="padding : 5px; margin-bottom:10px;">새로온 소식</span>
	
	<c:choose>
    <c:when test="${not empty notifyList }">
        <c:forEach items="${notifyList}" var="notify">
            <c:choose>
                <c:when test="${notify.notify_type eq 'APPROVAL' }">
                    <div id="popup_notify_approval" class="popup_notify" style="cursor:pointer;height:40px;width:300px; font-weight:bold; font-size:14px; text-align:center;border:1px solid #eee; background-color:white; display:flex; flex-direction: row;">
                        <div  style="margin-left:5px; margin-top:5px;"><img src='resources/images/todo.png' style="width:25px; height:25px;margin-right:5px;"></div>
                        <div style="margin-left:5px; margin-top:5px;">결재할 문서가 도착했어요!</div>
                        <p style="color:#9e9e9e;margin-left:5px; margin-top:5px;">&nbsp;${notify.minute}</p>
                    </div>
                </c:when>
                <c:when test="${notify.notify_type eq 'MSG' }">
                    <div id="popup_notify_msg" class="popup_notify" style="cursor:pointer;height:40px;width:300px; font-weight:bold; font-size:14px; text-align:center;border:1px solid #eee; background-color:white; display:flex; flex-direction: row;">
                        <div  style="margin-left:5px; margin-top:5px;"><img src='resources/images/msg.png' style="width:25px; height:25px;margin-right:5px;"></div>
                        <div style="margin-left:5px; margin-top:5px;">${notify.notify_sender}님이 메시지를 보냈습니다!</div>
                        <p style="color:#9e9e9e;margin-left:5px; margin-top:5px;">&nbsp;${notify.minute}</p>
                    </div>
                </c:when>
            </c:choose>
        </c:forEach>
    </c:when>
    <c:otherwise>
        <div id="popup_notify" style="height:40px;width:300px; font-weight:bold; font-size:14px; text-align:center;border:1px solid #eee; background-color:white; display:flex; flex-direction: row;">
            <div  style="margin-left:5px; margin-top:5px;"></div>
            <div style="margin-left:5px; margin-top:5px;">새로운 소식이 없습니다.</div>
        </div>
    </c:otherwise>
</c:choose>
      
      
	</div>
	
	
 	</div>
 	
 
 
    
    
<!--     팝업 배경 창 -->
	<div class="popup_bg" style="
position: absolute;
top:0;
left:0;
width:100%;
height:100%;
background: rgba(0,0,0,0.7);
display:none;
z-index: 1;"></div> 
    
    <div class="popup-logout">
    	<div style="text-align:center;margin-top:10px;"><b>로그아웃 하시겠습니까?</b></div>
    	<div style="margin-top:20px; margin-left:30px;">
    	<button id="logout-yes">로그아웃</button>
    	<button id="cancle">취소</button>
    	</div>
    </div>
<script>
    const swiper = new Swiper('.swiper', {
      // Optional parameters
      direction: 'horizontal',
      loop: true,

      // If we need pagination
      pagination: {
        el: '.swiper-pagination',
      },

      // Navigation arrows
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },

      // And if we need scrollbar
      scrollbar: {
        el: '.swiper-scrollbar',
      },
      
      autoplay : {  // 자동 슬라이드 설정 , 비 활성화 시 false

    	  delay : 3000,   // 시간 설정

    	  disableOnInteraction : false,  // false로 설정하면 스와이프 후 자동 재생이 비활성화 되지 않음

    	}
      
    });

</script>    
    
</body>

</html>