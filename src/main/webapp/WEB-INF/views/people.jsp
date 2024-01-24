<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
   
<link rel="stylesheet" href="resources/css/bootstrap.css">
    <script src="resources/js/jquery.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<head>
<meta charset="UTF-8">
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
.content table td{
border-bottom: 1px solid #eee;
text-align : center;
height:40px;
margin : 10px;
}
.content table tr,th{
border-bottom: 2px solid #eee;
text-align : center;
}

.content table{
margin: 30px auto; /* Corrected syntax */
    width: 800px;
    border-collapse: collapse;

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



/* :hover 상태일 때 ul 태그에 적용되는 스타일 */
.nav.nav-underline:hover {
  background-color : white;
  color:#386FA4;
}

/* :hover 상태일 때 li 태그에 적용되는 스타일 */
.nav.nav-underline li:hover {
    background-color : white;
  color:#386FA4;
}



</style>
 
<body>
<%-- <%@ include file="/WEB-INF/views/inc/nav.jsp" %>   --%>
 <jsp:include page="nav2.jsp"/>

        
 <!-- <nav>~</nav> 메인 페이지 좌측 Nav바 -->
  
 <main>
      <div class="header">
      	<ul class="nav nav-underline">
  <li class="item">
    <a class="people" aria-current="page" href="#" style="color:#386FA4;"><i class="bi bi-people-fill" style="color:#386FA4;"></i> 구성원</a>
  </li>
  <li class="item">
    <a class="company" href="#" style="color:#386FA4;"><i class="bi bi-list-ul" style="color:#386FA4;"></i> 조직도</a>
  </li>
</ul>      	
      </div>
      
      
      <div class="info">
      ${user.getName()}명
      </div>
      
      
      
      <div class="content">
      	<table width="800px" >
    <thead>
        <tr style="width:60px; height:50px;">
       	    <th>부서</th>
            <th>직위</th>
            <th >이름</th>
            <th>재직 여부</th>
            <th>사번</th>
            <th>입사일</th> 
            <th>이메일</th>
            <th>휴대전화</th>
        </tr>
    </thead>
    <tbody>
       <c:forEach items="${list}" var="dto">
       	<tr>
       		<td >${dto.dname}</td>
       		<td>${dto.position}</td>
       		<td >${dto.name}</td>
       		<td>${dto.status}</td>
       		<td>${dto.empno}</td>
       		<td> 
<!--        		날짜형식 변환 -->
       		<fmt:formatDate value="${dto.hiredate}" pattern="yy/MM/dd" />
       		</td>
       		
       		<td>${dto.email}</td>
       		<td>${dto.phone}</td>
       	</tr>
       </c:forEach>
        

        <!-- 추가적인 사원들의 정보를 동일한 형식으로 추가할 수 있습니다. -->
    </tbody>
</table>
      
      </div>
      
      
      
    </main>
   
</body>
</html>