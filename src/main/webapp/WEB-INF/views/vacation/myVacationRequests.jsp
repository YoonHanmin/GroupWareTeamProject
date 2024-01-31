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
font-size : 20px;
margin-top : 30px;
}
.item ul {
margin-top : 10px;
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
 <jsp:include page="../nav2.jsp"/>
 
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
      	    <table id="vacation-table">
	            <thead>
	            <tr>
	            	<th>휴가 번호</th>
	                <th>사원번호</th>
	                <th>이름</th>
	                <th>직급</th>
	                <th>휴가 타입</th>
	                <th>휴가 기간(일)</th>
	                <th>휴가 사유</th>
	                <th>휴가 시작일</th>
	                <th>휴가 종료일</th>
	                <th>신청 상태</th>
	                <th>신청 일자</th>
	            </tr>
	            </thead>
	            <tbody>
	            <c:forEach var="vacation" items="${myVacationRequests}">
	                <tr>
			            <td>
			                <c:choose>
			                    <c:when test="${not empty vacation.empid}">
			                        ${vacation.empid}
			                    </c:when>
			                    <c:otherwise>
			                        <!-- If empId is empty, display input field -->
			                        <input type="text" name="empId" value="${vacation.empId}" disabled>
			                    </c:otherwise>
			                </c:choose>
			            </td>
			            <td>
			                <c:choose>
			                    <c:when test="${not empty vacation.empno}">
			                        ${vacation.empno}
			                    </c:when>
			                    <c:otherwise>
			                        <!-- If empNo is empty, display input field -->
			                        <input type="text" name="empno" value="${vacation.empno}" disabled>
			                    </c:otherwise>
			                </c:choose>
			            </td>
			            <td>
			                <c:choose>
			                    <c:when test="${not empty vacation.name}">
			                        ${vacation.name}
			                    </c:when>
			                    <c:otherwise>
			                        <!-- If name is empty, display input field -->
			                        <input type="text" name="name" value="${vacation.name}" disabled>
			                    </c:otherwise>
			                </c:choose>
			            </td>
			            <td>
			                <c:choose>
			                    <c:when test="${not empty vacation.position}">
			                        ${vacation.position}
			                    </c:when>
			                    <c:otherwise>
			                        <!-- If position is empty, display input field -->
			                        <input type="text" name="position" value="${vacation.position}" disabled>
			                    </c:otherwise>
			                </c:choose>
			            </td>
	                    <td>${vacation.position}</td>
	                    <td>${vacation.vacationtype}</td>
	                    <td>${vacation.vacationdays}</td>
	                    <td>${vacation.reason}</td>
	                    <td>${vacation.startdate}</td>
	                    <td>${vacation.enddate}</td>
	                    <td>${vacation.vacationtype}</td>
	                    <td>${vacation.status}</td>
	                    <td>${vacation.requestdate}</td>
	                </tr>
	            </c:forEach>
	            </tbody>
        </table>
        
        	</div>
 </main>
</body>
</html>