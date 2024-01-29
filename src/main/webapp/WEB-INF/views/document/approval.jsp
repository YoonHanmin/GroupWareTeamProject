<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--      hiredate 날짜 포맷 형식 변경 -->
      <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <script src="https://kit.fontawesome.com/82c57657fe.js" crossorigin="anonymous"></script>
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
height : 70px;
border-bottom: 1px solid #eee;
background-color : 363945;
display : flex;

}

.info{
height : 100px;

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

.myinfo{
background-color : ;
height : 200px;
margin-top : 30px;
display : flex;

}
#profile-image img{
width : 150px; 
height : 150px;
border-radius: 10px;
margin-left: 50px;
margin-right : 50px;
}

#profile-name{
font-size : 24px;
font-weight : bold;
margin-bottom : 30px;
display : inline-block;

} 
.profile-id span{
font-weight : bold;

}

.description {
margin-top : 30px;
border-top : 1px soild #eee;
height : 800px;
}
.profile-info{
border-bottom : 1px soild #eee;

}
#profile-table{
/* margin-top : 50px; */
margin-left : 30px;
padding : 20px;
}
#profile-table th,td{
width : 100px;
height : 40px;
}
#profile-table td{
padding : 10px;
margin-right : 20px;
}
.info span{
font-weight : bold;
font-size : 34px;
margin-top : 40px;
margin-left : 50px;
}
.info{
border-bottom : 1px solid #eee;
}
.app-list{
border-bottom : 1px solid #eee;
}
.app-header{
margin-top : 10px;
margin-left : 400px;
display : flex;
flex-direction: row;

}
.doc-list{
font-weight : bold;
font-size : 24px;
color : #4682b4;
cursor : pointer;
text-align : center;
border-radius : 10%;
width : 250px;
height : 200px;
border : 1px solid #eee;

}
.doc-ing{
font-weight : bold;
font-size : 24px;
color : #4682b4;
margin-left:15px;
text-align : center;
border-radius : 10%;
width : 250px;
height : 200px;
border : 1px solid #eee;
cursor : pointer;
}
.doc-end{
font-weight : bold;
font-size : 24px;
color : #4682b4;
margin-left:15px;
text-align : center;
border-radius : 10%;
width : 250px;
height : 200px;
border : 1px solid #eee;
cursor : pointer;
}
.app-list span{
font-weight : bold;
font-size : 34px;
margin-top : 40px;
margin-left : 50px;
}

.doc-list:hover {
	background-color : #eee;
}
.doc-ing:hover {
	background-color : #eee;
}
.doc-end:hover {
	background-color : #eee;
}
</style>
 <script>
 $(document).ready(function () {
		var profile = "${dto.getProfileimage()}";
		console.log("프로필사진명은 ==>"+profile);
		$("#profile-image").html("<img src='./display?fileName="+encodeURI(profile)+"'>");

 });
 
 
 </script>
<body>
 <jsp:include page="../nav2.jsp"/>
 
 <main>
 	<div class="header">
      	<ul class="nav nav-underline">
  <li class="item">
    <a class="people" aria-current="page" href="#" style="color:#FFFAFA;"><i class="bi bi-people-fill" style="color:#FFFAFA;"></i>내 사원정보</a>
  </li>
  <li class="item">
    <a class="company" href="#" style="color:#FFFAFA;"><i class="bi bi-list-ul" style="color:#FFFAFA;"></i>비밀번호 변경</a>
  </li>
</ul>      	
      </div>
      
      
      <div class="info">
      	<span>결재현황</span>
      </div>
      
        <div class="content">
        	
        	<div class="app-header">
        		<div class="doc-list">
        			<span>결재문서함</span>
        		</div>
        		<div class="doc-ing">
        			<span>결재중</span>
        		</div>
        		<div class="doc-end">
        			<span>결재완료</span>
        		</div>
        	
        	
        	</div>
        
        	
        	<div class="app-list">
        		<span>전자결재 목록</span>
        	</div>
        	
        	
        	</div>
        
      
 </main>
</body>
</html>