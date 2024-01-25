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
height : 60px;
border-bottom: 1px solid #eee;
background-color : #eee;
margin-left : 0;
}


.item a {
font-weight : bold;
font-size : 30px;
margin-top : 30px;
}
.item ul {
margin-top : 10px;
}
.content{
width : 100%;

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
    <a class="receive-list" aria-current="page" href="#" style="color:#black;"><i class="bi bi-envelope-open" style="color:#black;"></i>받은 메시지</a>
  </li>
  <li class="item">
    <a class="send-list" href="#" style="color:#black;"><i class="bi bi-envelope-check" style="color:#black;"></i>보낸 메시지</a>
  </li>
</ul>      	
      </div>
      
      <div class="info">
      
      </div>
      
        <div class="content">	
        	</div>
        
       <!--  모달 팝업창-->
    <div class="popup">
 <i class="bi bi-x" id="messenger-out"></i>
    </div>
	<div class="popup_bg"></div> 
    </main>
    
  
        
        
      
 </main>
</body>
</html>