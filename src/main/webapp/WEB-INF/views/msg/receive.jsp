<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<jsp:useBean id="now" class="java.util.Date" />
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--      hiredate 날짜 포맷 형식 변경 -->
      <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <script src="resources/js/jquery.js"></script>
<!DOCTYPE html>

<html>
<head>
<script src="https://kit.fontawesome.com/82c57657fe.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">

<script type="text/javascript"></script>

<title>Insert title here</title>
</head>
<style>
.header{
height : 80px;
border-bottom: 1px solid #eee;
display : flex;
}

.info{
display : flex;
/* justify-content : space-between; */
width : 100%;
height : 60px;
border-bottom: 1px solid #eee;
background-color : #eee;
margin-left : 0;

}
.msg-menu{
display : flex;
margin-bottom : 0;

}
.msg-menu ul {
margin-left : 200px;
}
.msg-menu li {
margin-right : 80px;
list-style: none;
      
}

.msg-search{
margin-left : 4px;
 margin-top : 10px;
 width : 388px;
 height : 40px;
 background-color : white;
 border-radius : 5px;
}
.msg-search > form > input{
border : none;
/* background : rgba(0,0,0,0.5); */
color : black;
padding-left : 5px;
margin-left : 10px;
margin-top : 6px;
width : 350px;
height : 30px;
}

.msg-search > form > span{
font-weight : bold;
cursor: pointer;

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
.msg-box{
width : 100%;
height : 100%;
display : flex;
flex-direction: row;
}

.msg-content{
border : 1px solid #eee;
margin-left : 2px;
width : 1000px;
height : 100%;
background-color :#eaf4ff;
}

.msg-list{
width : 400px;
height : 100%;
background-color : white; 
}
.msg-list table{
width : 400px;
height : 100%;
}
.msg-list table td{

border : 1px solid #eee;
width : 400px;
height : 80px;
}
.msg-list table td:hover {
	background-color: #eaf4ff;
}
.formatted-date {
        color: #eee; /* 텍스트 색상을 원하는 색상으로 설정 */
      font-style: italic;
    }
#new-msg{
border : 1px solid #84c1ff;
border-radius: 6px;
color : black;
background-color: #84c1ff;
margin-top : 30px;
font-weight : bold;
height:80px ;
width: 120px;
cursor: pointer;

}
.msg-view{
/* 	display : flex; */
	flex-direction : row;
	flex-wrap : wrap;
	margin-left : 5px;
	margin-top : 5px;
	border : 1px solid #eee;
	border-radius : 5px;
	background-color: white;
	width:800px;
	height : 500px;
	display : none;
}
.msg-view-img{
width : 130px;
height : 130px;

border-radius: 10%;
 margin-left: 5px;
  margin-top: 5px; 
  flex-shrink: 0; 
  object-fit: cover;
}
.msg-view-content{
	margin: 5px 10px;
	border : 1px solid #eee;
	border-radius : 5px;	
	width:780px;
	height : 350px;
	
}
.msg-view-title{
margin-top : 13px;
margin-left : 10px; 
border-radius : 5px;
border : 1px solid #eee;
width : 630px;
height : 120px;
}
.msg-view-title p {
font-size : 12px;
}
#to{
border : 1px solid #84c1ff;
border-radius: 6px;
color : black;
background-color: #84c1ff;
margin-top : 30px;
font-weight : bold;
height:80px ;
width: 200px;
opacity: 0.5;

}
/* 팝업 배경 스타일  */
.popup_bg{
position: absolute;
top:0;
left:0;
width:100%;
height:100%;
background: rgba(0,0,0,0.5);
display:none;
z-index: 1; /* z-index 값 설정 */
}
/*  사원정보 팝업 스타일 */
.popup-empinfo{
position : absolute;
left : calc(50% - 300px);
top : calc(50% - 300px);
width : 400px;
height : 400px;
background : white;
display:none;
border-radius: 8px;
 z-index: 2; /* z-index 값 설정 (팝업은 배경 팝업보다 위에 있어야 함) */

}
.popup-empinfo > #popup-empinfo-out{
font-size: 2rem; 
float: right; 
margin-right:5px;
cursor: pointer;
}
.popup-empinfo-info table td{
width:50px;
text-align : center;
}
.popup-empinfo-info table tr{
height:30px;
}
/*  사원정보 팝업 스타일  끝*/

/* 새 메시지 보내기 팝업 스타일 */

.popup-send{
position : absolute;
left : calc(50% - 300px);
top : calc(50% - 300px);
width : 800px;
height : 600px;
background : white;
display:none;
border-radius: 8px;
 z-index: 2; /* z-index 값 설정 (팝업은 배경 팝업보다 위에 있어야 함) */
}

.popup-send > #popup-send-out{
font-size: 2rem; 
float: right; 
margin-right:5px;
cursor: pointer;
}
</style>





 <script>
 $(document).ready(function () {
		var profile = "${dto.getProfileimage()}";
		console.log("프로필사진명은 ==>"+profile);
		$("#profile-image").html("<img src='./display?fileName="+encodeURI(profile)+"'>");
		
		
// 	$(".receive-list").on.("click",function(){
		
// 		$.ajax
		
		
// 	});	
		
		
		
		

 });
 
 
 </script>
<body>
 <jsp:include page="../nav2.jsp"/>
 
 <main>
 	<div class="header">
      	<ul class="nav nav-underline">
  <li class="item">
    <a class="receive-list" aria-current="page" href="receive" ><i class="bi bi-envelope-open"></i>  받은 메시지</a>
  </li>
  <li class="item">
    <a class="send-list" href="send" style="color:#black;"><i class="bi bi-envelope-check" style="color:#black;"></i>  보낸 메시지</a>
  </li>
</ul>      	
      </div>
      
      <div class="info">
      		<div class="msg-search">	
      			<form>
      			<input type="text">
      			<span><i class="bi bi-search"></i></span>
      			</form>
      			</div>
      			<ul class="msg-menu">
      				<li>
      				<span id="new-msg"><i class="fa-sharp fa-regular fa-paper-plane">작성하기</i></span></li>
      				
      			</ul>
      </div>
      
      <div class="msg-box">
      	<div class="msg-list">
      	<table>
      	<!--       						오늘일 경우 오전 00:00 & 오늘이 아닐경우 1월1일 월요일로 출력 -->
		<c:set var="today"><fmt:formatDate value="${now}" pattern="MM/dd" /></c:set>
		<!--  어제날짜 -->
		<c:set var="yesterdayform" value="<%= new java.util.Date(System.currentTimeMillis() - 24 * 60 * 60 * 1000) %>" />
		<c:set var="yesterday">
    		<fmt:formatDate value="${yesterdayform}" pattern="MM/dd" />
			</c:set>
		
		
				<!--  한번만 실행하는 스위치 -->
				<c:set var="once" value="false" /> 
      	 <c:forEach items="${list}" var="list" varStatus="status">
		<c:set var="date"><fmt:formatDate value="${list.getTime()}" pattern="MM/dd" /></c:set>
	
			<c:if test="${not once and date eq yesterday}">
		 	<c:set var="once" value="true" />
		 		<tr>
					<td>
					
					<div style="width:400px; height:40px; border: 1px solid #ccc; padding: 6px; display: flex; flex-direction:column;
				background-color:	#84c1ff;"> 
					<p style="text-align:center; font-weight:bold; color:black; margin-left:60px;">TODAY</p>
					</div>
					</td>
					</c:if>
					</tr>
      		<tr> <!--  개별 메시지 박스  -->
      			<td>
      			
      	 <!-- view를 읽기위해 메시지 정보를 사용자에게 보이지않게 담아두는 공간 -->
      	 <input type="hidden" id="from_id" value="${list.getFrom_id()}">
      	 <input type="hidden" id="title" value="${list.getTitle() }">
      	 <input type="hidden" id="content" value="${list.getContent() }">
      	 <input type="hidden" id="time" value="${list.getTime() }">
      	 <input type="hidden" id="hit" value="${list.getHit() }">
      	 <input type="hidden" id="from_name" value="${list.getFrom_name() }">
      	 <input type="hidden" id="from_position" value="${list.getFrom_position() }">
      	 <input type="hidden" id="from_dname" value="${list.getFrom_dname() }">
      	 <input type="hidden" id="from_profileimage" value="${list.getFrom_profileimage() }">
      	 <input type="hidden" id="from_email" value="${list.getFrom_email() }">
      	 <input type="hidden" id="to_email" value="${list.getTo_email() }">
      	 <input type="hidden" id="from_phone" value="${list.getFrom_phone() }">
      	 <input type="hidden" id="from_status" value="${list.getFrom_status() }">
      	 <input type="hidden" id="from_hiredate" value="${list.getFrom_hiredate() }">
      	
      	 
      	 
  			<div style="width:400px; height:90px; border: 1px solid #ccc; padding: 6px; display: flex; cursor: pointer;">
   				 <img src="./display?fileName=${list.getFrom_profileimage()}" style="width: 70px; height: 70px; border-radius: 50%; margin-right: 10px;margin-top:5px;flex-shrink: 0; object-fit: cover;">
   				 <div style="flex-grow: 0;">
      				<h6 style="margin: 0;"><b id="msg-name">${list.getFrom_name()}</b> ${list.getFrom_position()}
      						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!--       						오늘일 경우 오전 00:00 & 오늘이 아닐경우 1월1일 월요일로 출력 -->
      						<c:choose>	
      						<c:when test="${today eq date}">
      						
      						
      						<fmt:formatDate value="${list.getTime()}" pattern="a hh:mm" />
      						</c:when>
      						<c:otherwise>
      						<fmt:formatDate value="${list.getTime()}" pattern="M월 d일 E요일" />
      						</c:otherwise>
      						</c:choose>
      						
      						</h6>
      					<p id="msgtitle" style="margin: 0;width:300px; white-space: nowrap; overflow: hidden; font-weight: bold; color:#3366cc;">${list.getTitle()}&nbsp;&nbsp;</p>
     						<p id="msgcontent"style="width:300px; margin: 0; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
            ${list.getContent()}


        </p>
    					</div>
  				</div>
			</td>
      		</tr>
      		</c:forEach>
      	</table>
    	
      	</div> <!--  end of msg-list -->
      	
      	
      	<!--  메시지 보기 -->
      	<div class="msg-content">
      			<div class="msg-view">
      				<div class="msg-view-img" style="cursor: pointer">
      				
      				</div>
      				<div class="msg-view-title">
      					<div style="margin-top : 10px; margin-left : 10px;">
      					<span id="msg-title-1"> <a href="" style="text-decoration: none; font-weight:bold; color:black; text-size:30px;" ></a></span>
      					</div>
      					<div style="margin-top : 10px; margin-left : 10px;">
      					보낸사람 : <span id="to"> <a href="" style="text-decoration: none; font-weight:bold; color:black;" ></a></span>
      					</div>
      					<div style="margin-top : 10px; margin-left : 10px;">
      					<p id="msgtime"></p>
      					</div>
      				</div>
      				
      				
      				<div class="msg-view-content">
      				
      				</div>
      			</div>

      	</div> <!--  end of msg-content -->
      	
      	
      </div> 
<!--       end of msg-box -->
      
      
      
      
      
      
        <div class="content">	

        	</div>
        

  
        
          <!--  모달 팝업창-->
    <div class="popup-empinfo">
 <i class="bi bi-x" id="popup-empinfo-out"></i>
 	<div class="popup-empinfo-img">
 	</div>
 	<div class= "popup-empinfo-name" style=" text-align: center;">
 		<span style="font-size:30px; font-weight:bold"></span>
 	</div>
 	
 	<div style="margin-bottom:10px;">
 		<span><i class="fa-solid fa-phone fa-2x" style="color: green; margin-left:100px;"></i></span>
 		<span><i class="fa-solid fa-envelope fa-2x" style="color :#3366cc; margin-left:130px; "></i></span>
 		
 	</div>
 	
 	<div class="popup-empinfo-info" style="text-align:center;">
 		<table style="margin-left : 25px;">
 			<tr>
 				<th >소속부서</th>
 				<td id="1" ></td>
 				<th>직위</th>
 				<td id="2"></td>
 			</tr>
 			<tr >
 				<th>H.P</th>
 				<td id="4"></td>
 			</tr>
 			<tr>
 				<th>이메일</th>
 				<td id="3" ></td>
 			</tr>	
 			<tr >
 				<th>상태</th>
 				<td id="5"></td>
 				<th>입사년도</th>
 				<td id="6"></td>
 			</tr>
 			
 		</table>
 	</div>
 	</div>
<!--  	새 메시지 작성 -->
 	<div class="popup-send">
 	 <i class="bi bi-x" id="popup-send-out"></i>
 	 <div>
 	 	<table>
 	 		<tr>
 	 		<th>받는사람 : </th>
 	 		<td><input type="text" name="to_id"></td>
 	 		</tr>
 	 		<tr>
 	 		<th>참조 : </th>
 	 		<td><input type="text" name="to_id"></td>
 	 		</tr>
 	 		<tr>
 	 		<th>제목 : </th>
 	 		<td><input type="text" name="to_id"></td>
 	 		</tr>
 	 		<tr>
 	 		<td colspan="2"><textarea name="content"></td>
 	 		</tr>
 	 	
 	 	
 	 	</table>
 	 </div>
 	</div>
 	
 	<!--     팝업 배경 창 -->
	<div class="popup_bg"></div> 
 </main>
<script>
$(document).ready(function () {
	console.log("Hello");
    // 특정 td를 클릭했을 때
    $('td').on('click', function() {
			// 화면 최상단으로 이동    	
    	 $("html, body").scrollTop(0);
    		$(".msg-view").css({"display":"flex"});
        // 클릭된 td에 대한 정보 추출
        var from_id = $(this).find("input[id='from_id']").val();
        var title = $(this).find("input[id='title']").val();
        var content = $(this).find("input[id='content']").val();
        var from_name = $(this).find("input[id='from_name']").val();
        var from_position = $(this).find("input[id='from_position']").val();
        var from_dname = $(this).find("input[id='from_dname']").val();
        var from_profileimage = $(this).find("input[id='from_profileimage']").val();
        var from_email = $(this).find("input[id='from_email']").val();
        var time = $(this).find("input[id='time']").val();
        var from_phone = $(this).find("input[id='from_phone']").val();
        var from_status = $(this).find("input[id='from_status']").val();
        var hiredate = $(this).find("input[id='from_hiredate']").val();
        var from_hiredate = hiredate.substr(0,4);
     
       
      
        var imageHtml = "<img src='./display?fileName=" + from_profileimage + "' style='width: 120px; height: 120px; border-radius: 10%; margin-left: 10px; margin-top: 5px; flex-shrink: 0; object-fit: cover;'>";
        var imageHtml_pop = "<img src='./display?fileName=" + from_profileimage + "' style='width: 160px; height: 160px; border-radius: 50%; margin-left: 115px; margin-top: 10px; flex-shrink: 0; object-fit: cover;'>";
	// 메시지 내용 출력
        $(".msg-view-img").html(imageHtml);
 	$("#to a").text(from_name +"    "+from_position+"               "+from_email);
 	$("#msg-title-1 a").text(title);
	$(".msg-view-content").text(content);
	$("#msgtime").text(time);
	
	// 팝업 사원 정보
	$(".popup-empinfo-img").html(imageHtml_pop);
	$(".popup-empinfo-name span").text(from_name);
	$(".popup-empinfo-info table #1").text(from_dname);
	$(".popup-empinfo-info table #2").text(from_position);
	$(".popup-empinfo-info table #3").text(from_email);
	$(".popup-empinfo-info table #4").text(from_phone);
	$(".popup-empinfo-info table #5").text(from_status);
	$(".popup-empinfo-info table #6").text(from_hiredate);
	
	
	
	
	 // 사원 이미지 클릭시 모달팝업 생성
    $(".msg-view-img").on("click",function(){
    	$(".popup_bg").css({"display":"block"});
    	$(".popup-empinfo").css({ "display": "block" });
    });
    $("#popup-empinfo-out").on("click",function(){
    	$(".popup_bg").css({"display":"none"});
    	$(".popup-empinfo").css({ "display": "none" });
    });  
	
    }); //end of td click function
    
    $('#new-msg').on('click', function() {
        	$(".popup_bg").css({"display":"block"});
        	$(".popup-send").css({ "display": "block" });
    });
        
        $("#popup-send-out").on("click",function(){
        	$(".popup_bg").css({"display":"none"});
        	$(".popup-send").css({ "display": "none" });
        });  
    	
    	
    	
    
    
    
});
</script>
</body>
</html>