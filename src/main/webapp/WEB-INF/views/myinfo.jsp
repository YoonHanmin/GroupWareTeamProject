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
height : 130px;
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
</style>
 <script>
 $(document).ready(function () {
		var profile = "${dto.getProfileimage()}";
		console.log("프로필사진명은 ==>"+profile);
		$("#profile-image").html("<img src='./display?fileName="+encodeURI(profile)+"'>");

 });
 
 
 </script>
<body>
 <jsp:include page="nav2.jsp"/>
 
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
      
      
      <div class="info">
      
      </div>
      
        <div class="content">
        
        
        	<div class="myinfo">
        		<div id="profile-image">
<!--         		<img src="resources/images/profile.jpg" width="150px" height="150px"> -->
        		</div>
				<div id="profile-id">
        		<span id="profile-name"> ${dto.getName() }</span><br>
        		부서<span id="profile-dept"> &nbsp;&nbsp;&nbsp;<b>${dto.getDname() }</b></span><br>
        		직책<span id="profile-position">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>${dto.getPosition()}</b></span><br>
        		
        		
				</div>        		
        	</div>
        	
        	
        	<div class="description">
        	
        	
        	
        	
        	
        	<div class="profile-info">
        	<h3>사원정보</h3>
        		</div>
        		
        				<div id="profile-table">
			        			<table>
				        		<tr>
				        			<th>사번</th>
				        			<td>${dto.getEmpno()}</td>
				        			<th>상태</th>
				        			<td>${dto.getStatus()}</td>
				        		</tr>
				        		<tr>
				        			<th>입사일</th>
				        			<td><fmt:formatDate value="${dto.hiredate}" pattern="yy/MM/dd" /></td>
				        			<th>생년월일</th>
				        			<td><fmt:formatDate value="${dto.birthday}" pattern="yyyy/MM/dd" /></td>
				        		</tr>
				        		<tr>
				        			<th>부서</th>
				        			<td>${dto.getDname()}</td>
				        			<th>직위</th>
				        			<td>${dto.getPosition()}</td>
				        		</tr>
								<tr>
				        			<th>이메일</th>
				        			<td>${dto.getEmail()}</td>
				        			<th>휴대번호</th>
				        			<td>${dto.getPhone()}</td>
				        		</tr>				        	
				        	<tr>
				        			<th>주소</th>
				        			<td>${dto.getAddress()}</td>
				        			
				        		</tr>	
				        			</table>
        					</div>
        		
        		</div>
        	
        	</div>
        
      
 </main>
</body>
</html>