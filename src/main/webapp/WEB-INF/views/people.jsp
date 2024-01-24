<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="/WEB-INF/views/inc/header_link.jsp" %>   
</head>
<style>
.header{
height : 130px;
border-bottom: 1px solid #eee;
}

.info{
height : 100px;
border-bottom: 1px solid #eee;
}
.content table td{
border-bottom: 1px solid #eee;
text-align : center;
}
.content table tr,th{
border-bottom: 1px solid #eee;
text-align : center;
}

.content table{
margin: 30px auto; /* Corrected syntax */
    width: 800px;
    border-collapse: collapse;

}

.content{
width : 100%;

}
</style>
<body>
<%@ include file="/WEB-INF/views/inc/nav.jsp" %>  


 <main>
      <div class="header">
      	<ul class="nav nav-underline">
  <li class="nav-item">
    <a class="nav-link" aria-current="page" href="#">구성원</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">조직도</a>
  </li>
</ul>      	
      </div>
      
      
      <div class="info">
      총 00명
      </div>
      
      
      
      <div class="content">
      	<table width="800px" border="1">
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