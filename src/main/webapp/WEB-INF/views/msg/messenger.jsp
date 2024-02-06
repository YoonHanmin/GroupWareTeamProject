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
height : 70px;
border-bottom: 1px solid #eee;
background-color : 363945;


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

 <nav id="main_nav" class="navbar navbar-expand-lg bg-dark border-bottom border-body" style="width:100%; height:70px;">
      <div class="container-fluid">
        <a class="navbar-brand" href="main" style="color: white;margin-left:50px;">메인</a>
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
           
            <li class="nav-item" style="margin-left:50px;">
              <a class="nav-link" href="myinfo" style="color: white">마이페이지</a>
            </li>
            <li class="nav-item dropdown" style="margin-left:50px;">
              <a
                class="nav-link dropdown-toggle"
                style="color: white"
                href="#"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
                font-size="1.25rem"
              >
                내 업무
              </a>
              <ul class="dropdown-menu">
                <li>
                  <a class="dropdown-item" href="approval" style="color: black"
                    >전자결재</a
                  >
                </li>
                <li>
                  <a class="dropdown-item" href="receive" style="color: black"
                    >메신저</a
                  >
                </li>
                <li><hr class="dropdown-divider" /></li>
                <li>
                  <a class="dropdown-item" href="vacationRequest" style="color: black"
                    >자원요청</a
                  >
                </li>
              </ul>
            </li>
           
          </ul>
          <form class="d-flex" role="search">
            <input
              class="form-control me-2"
              type="search"
              placeholder="사원명"
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