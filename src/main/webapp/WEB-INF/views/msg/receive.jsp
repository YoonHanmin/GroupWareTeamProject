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

}
.msg-view{
	display : flex;
	flex-direction : row;
	flex-wrap : wrap;
	margin-left : 5px;
	margin-top : 5px;
	border : 1px solid #eee;
	border-radius : 5px;
	background-color: white;
	width:800px;
	height : 500px;
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
      				<span id="new-msg"><i class="fa-sharp fa-regular fa-paper-plane"> <a href="">작성하기</a></i></span></li>
      				
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
	
      		<tr> <!--  개별 메시지 박스  -->
   
			<c:if test="${not once and date eq yesterday}">
		 	<c:set var="once" value="true" />
		 	
					<td style="">
					
					<div style="width:400px; height:40px; border: 1px solid #ccc; padding: 6px; display: flex;background-color:	#84c1ff;">
					<p style="text-align:center; font-weight:bold; color:black; margin-left:170px;">TODAY</p>
					</div>
					</td>
					
    		</c:if>


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
      	
      	
      	</div>
      	<!--  메시지 보기 -->
      	<div class="msg-content">
      			<div class="msg-view">
      				<div class="msg-view-img">
      				
      				</div>
      				<div class="msg-view-title">
      					받는사람 :<span id="to"> <a href="" style="text-decoration: none; color:black;">&nbsp;&nbsp;한효주 과장 gywn@naver.com </a></span>
      					<p>보낸사람 :</p>
      					<p>2024년 1월 26일 목요일 오후 4시 24분</p>
      				</div>
      				
      				
      				<div class="msg-view-content">
      				
      				</div>
      			</div>
      			
      			
      			
      			
      			
      			
      	</div> <!--  end of msg-content -->
      	
      	
      </div> 
<!--       end of msg-box -->
      
      
      
      
      
      
        <div class="content">	
        	</div>
        

  
        
        
      
 </main>
</body>
<script>
$(document).ready(function () {
    // 특정 td를 클릭했을 때
    $('td').on('click', function() {
    	 $("html, body").scrollTop(0);
        // 클릭된 td에 대한 정보 추출
        var from_id = $(this).find("input[id='from_id']").val();
        var title = $(this).find("input[id='title']").val();
        var content = $(this).find("input[id='content']").val();
        var from_name = $(this).find("input[id='from_name']").val();
        var from_position = $(this).find("input[id='from_position']").val();
        var from_dname = $(this).find("input[id='from_dname']").val();
        var from_profileimage = $(this).find("input[id='from_profileimage']").val();
       
        // 추출된 정보 사용
        console.log("from_id : " + from_id);
        console.log("title: " + title);
        console.log("content: " + content);
        console.log("from_name: " + from_name);
        console.log("from_position: " + from_position);
        console.log("from_dname: " + from_dname);
        console.log("from_profileimage: " + from_profileimage);
        var imageHtml = "<img src='./display?fileName=" + from_profileimage + "' style='width: 120px; height: 120px; border-radius: 10%; margin-left: 10px; margin-top: 5px; flex-shrink: 0; object-fit: cover;'>";
	$(".msg-view-img").html(imageHtml);
// 	$(".msg-view-title").html(imageHtml);
	$(".msg-view-content").text(content);
			
       
    });
});
</script>
</html>