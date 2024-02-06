<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
       <script src="https://kit.fontawesome.com/82c57657fe.js" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="resources/js/jquery.js"></script>
<title>Insert title here</title>
<style>
.header{
	height : 70px;
	border-bottom: 1px solid #eee;
	background-color : 363945;
	align-items: center;
	display : flex;
	padding: 30px;
}

.info {
    height: 100px;
    border-bottom: 1px solid #eee;
    display: flex;
    align-items: center;
    font-weight: bold;
    font-size: 20px;
    padding: 30px;
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
.content {
    width: 100%;
    padding: 30px;
    margin: auto;
}

.myinfo {
	background-color: red;
	height: 200px;
	margin-top: 30px;
	display: flex;
	align-items: center;
	justify-content: center;
}

#profile-image img {
	width: 150px;
	height: 150px;
	border-radius: 10px;
}

#profile-name {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 30px;
}

.profile-id span {
	font-weight: bold;
}

.description {
  margin-top: 30px;
  border-top: 1px solid #eee;
  height: 800px;
}

.profile-info {
  border-bottom: 1px solid #eee;
}

#profile-table {
  margin-left: 30px;
  padding: 20px;
}

#profile-table th,
#profile-table td {
  width: 100px;
  height: 40px;
  padding: 10px;
  margin-right: 20px;
}

#vacation-table th,
#vacation-table td {
  padding: 10px;
  text-align: center;
}

#vacation-table th {
  font-weight: bold;
  background-color: #eee;
}

#cancel {
  color: white;
  background-color: grey;
  border: none;
  padding: 8px 16px;
  border-radius: 4px;
  cursor: pointer;
}

#cancel:hover {
  background-color: darkred;
}

</style>
<script>
  $(document).ready(function () {
    $("#vacation-table").on("click", "#cancel", function () {
      var emp_id = $(this).closest('tr').find('td[class^="empid_"]').text();
     
		
      // 여기서 emp_id를 컨트롤러로 전송하는 로직 추가
      $.ajax({
        type: "POST",
        url: "cancelVacation",
        data: {
          empid: emp_id
        }, // emp_id를 서버로 전송합니다.
        success: function (data) {
          // 성공 시 페이지 새로고침 또는 업데이트 로직 추가
          location.reload(); // 예시로 페이지를 새로고침하는 코드
        },
        error: function () {
          alert("휴가 취소 중 오류가 발생했습니다.");
        }
      });
    });
  });
</script>
</head>
<body>
  <jsp:include page="../nav2.jsp" />

  <main>
 	<div class="header">
      	<ul class="nav nav-underline">
  <li class="item">
    <a class="people" aria-current="page" href="#" style="color:#FFFAFA;"><i class="bi bi-calendar-week" style="color:#FFFAFA;"></i>휴가 관리</a>
  </li>
  <li class="item">
    <a class="company" href="vacationRequest" style="color:#FFFAFA;"><i class="bi bi-airplane-engines" style="color:#FFFAFA;"></i>휴가 신청</a>
  </li>
</ul>      	
      </div>
      
	<div class="info">
		<span>휴가신청내역</span>
	</div>
  
    <div class="content">
      <table id="vacation-table">
        <thead>
          <tr>
            <th>휴가 코드</th>
            <th>사원 번호</th>
            <th>이름</th>
            <th>직급</th>
            <th>휴가 종류</th>
            <th>휴가 기간(일)</th>
            <th>휴가 사유</th>
            <th>휴가 시작일</th>
            <th>휴가 종료일</th>
            <th>신청 상태</th>
            <th>신청 일자</th>
            <th>취소</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="request" items="${myVacationRequests}">
            <tr>
              <td class="empid_${request.empid}">${request.empid}</td>
              <td>${request.empno}</td>
              <td>${request.name}</td>
              <td>${request.position}</td>
              <td>${request.vacationtype}</td>
              <td>${request.vacationdays}</td>
              <td>${request.reason}</td>
              <td><fmt:formatDate value="${request.startdate}" pattern="yyyy-MM-dd" /></td>
              <td><fmt:formatDate value="${request.enddate}" pattern="yyyy-MM-dd" /></td>
              <td>${request.status}</td>
              <td><fmt:formatDate value="${request.requestdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
              <td>
                <button type="button" id="cancel">취소</button>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </main>
</body>
</html>
