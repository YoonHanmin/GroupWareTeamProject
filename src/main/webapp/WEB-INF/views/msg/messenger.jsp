<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--      hiredate 날짜 포맷 형식 변경 -->
      <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <script src="resources/js/jquery.js"></script>
<!DOCTYPE html>
<html>
<head>
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
justify-content : space-between;
width : 100%;
height : 60px;
border-bottom: 1px solid #eee;
background-color : #eee;
margin-left : 0;

}
.msg-menu{
display : flex;

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
width : 700px;
height : 100%;
background-color : #F0FFFF;
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
	background-color: #F0FFFF;
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
    <a class="receive-list" aria-current="page" href="receive" style="color:#black;"><i class="bi bi-envelope-open" style="color:#black;"></i>  받은 메시지</a>
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
      				<li>메뉴1</li>
      				<li>메뉴2</li>
      				<li>메뉴3</li>
      			</ul>
      </div>
      
      <div class="msg-box">
      	<div class="msg-list">
      	<table>
      		<tr>
      			<td>1번</td>
      		</tr>
      		<tr>
      			<td>1번</td>
      		</tr>
      		<tr>
      			<td>1번</td>
      		</tr>
      		<tr>
      			<td>1번</td>
      		</tr>
      		<tr>
      			<td>1번</td>
      		</tr>
      		<tr>
      			<td>1번</td>
      		</tr>
      		<tr>
      			<td>1번</td>
      		</tr>
      	</table>
      	
      	
      	</div>
      	
      	<div class="msg-content">
      	
      	</div>
      	
      	
      </div> 
<!--       end of msg-box -->
      
      
      
      
      
      
        <div class="content">	
        	</div>
        
   

  
        
        
      
 </main>
</body>
</html>