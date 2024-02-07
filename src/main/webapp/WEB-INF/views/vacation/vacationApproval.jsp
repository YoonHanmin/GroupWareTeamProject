<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
.vac-todo{
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
.vac-ing{
font-weight : bold;
font-size : 24px;
color : #363945;
margin-left:15px;
text-align : center;
border-radius : 10%;
width : 250px;
height : 200px;
border : 1px solid #eee;
cursor : pointer;
}
.vac-end{
font-weight : bold;
font-size : 24px;
color : #0D47A1;
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

.vac-todo:hover {
	background-color : #eee;
}
.vac-ing:hover {
	background-color : #eee;
}
.vac-end:hover {
	background-color : #eee;
}
.allList {
margin-top : 50px;
margin-left : 300px;
}
.allList table th{
background-color: #eee; 
}
.allList table{
text-align : center;
border-collapse: collapse;
}
.allList table tbody tr:hover{
background-color : #eee;
cursor: pointer;
}

  .AllList {
    margin: 20px;
    text-align: center;
  }

  table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
    text-align: center;
  }

  th, td {
    border: 1px solid #ddd;
    padding: 8px;
/*     text-align: left; */
    text-align: center;
    
    
    overflow: hidden; /* 텍스트가 너무 길 경우 넘치지 않도록 설정 */
    white-space: nowrap; /* 텍스트 줄 바꿈을 방지하고 한 줄로 표시 */
    text-overflow: ellipsis; /* 텍스트가 너무 길 경우 말줄임(...)으로 표시 */
  }
  

  th {
    background-color: #f2f2f2;
  }

  .supply-row:hover, .vehicle-row:hover, .expense-row:hover, .reservation-row:hover {
    background-color: #f5f5f5;
  }

/* 승인 버튼 스타일 */
.approval-btn {
  background-color: #3498db; /* 파란색 */
  color: #ffffff; /* 흰색 텍스트 */
  border: none;
  padding: 8px 16px;
  cursor: pointer;
  border-radius : 20px;
  margin-right: 5px;
}


/* 반려 버튼 스타일 */
.reject-btn {
  background-color: #FF6347; /* 빨간색 */
  color: #ffffff; /* 흰색 텍스트 */
  border: none;
  padding: 8px 16px;
  cursor: pointer;
  border-radius : 20px;
  margin-right: 5px;
}


</style>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

</head>
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
	
	
<!-- 	<div class="info"> -->
		<h2>휴가신청 현황</h2>
	</div>

	<div class="content">
		<div class="app-header">
			<div class="vac-todo">
				<span style="color:#0D47A1;">미승인 휴가</span>
				<p style="font-size:70px; font-weight:bold;" border="bold;">${tovacnt}</p>
			</div>
			<div class="vac-ing">
				<span style="color:363945">승인 완료</span>
				<p style="font-size:70px; font-weight:bold;">${ingCnt}</p>
			</div>
			<div class="vac-end" style="color:#e53935;">
				<span>휴가 반려</span>
				<p style="font-size:70px; font-weight:bold;">${rejectCnt}</p>
		</div>
	</div>
       
	<div class="app-list">
<!-- 		<span>휴가신청내역</span> -->
	</div>
        	
	<div class="AllList">
<!-- 		<h2>휴가 신청 내역</h2> -->

<!-- 신청된 휴가 목록 -->
<table>
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
            <th>신청 일자</th>
            <th>수정 일자</th>
            <th>처리 상태</th>
            <th colspan="2">결재</th>
          </tr>       
    </thead>
    <tbody>
        <c:forEach items="${vacationApproval}" var="vacation">
            <c:if test="${vacation.status == '신청'}">
		   <tr class="vacation-row" data-empid="${vacation.empid}">     
                    <td class="emp_id">${vacation.empid}</td>
                    <td>${vacation.empno}</td>
                    <td>${vacation.name}</td>
                    <td>${vacation.position}</td>
                    <td>${vacation.vacationtype}</td>
                    <td>${vacation.vacationdays}</td>
                    <td>${vacation.reason}</td>
                    <td>${vacation.startdate}</td>
                    <td>${vacation.enddate}</td>
                    <td>${vacation.requestdate}</td>
                    <td>${vacation.updatedate}</td>
                    <td style="color: black; font-size:20px;">${vacation.status}</td>
  				 <td>
 				 	<c:if test="${vacation.status == '신청'}">
 				 		<button class='approval-btn' data-empid="${vacation.status}">승인</button>
 				 	</c:if>
 				 </td>
 				 <td>
 				 	<c:if test="${vacation.status == '신청'}">
 				 		<button class='reject-btn' data-empid="${vacation.status}">반려</button>
 				 	</c:if>
 				 </td>                     
                </tr>
            </c:if>
        </c:forEach>
    </tbody>
</table>
		
<!-- 승인된 휴가 목록 -->
<table>
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
            <th>신청 일자</th>
            <th>수정 일자</th>
            <th>처리 상태</th>
            <th colspan="2">결재</th>
          </tr>       
    </thead>
    <tbody>
        <c:forEach items="${vacationApproval}" var="vacation">
            <c:if test="${vacation.status == '승인'}">
                <tr>
                    <td>${vacation.empid}</td>
                    <td>${vacation.empno}</td>
                    <td>${vacation.name}</td>
                    <td>${vacation.position}</td>
                    <td>${vacation.vacationtype}</td>
                    <td>${vacation.vacationdays}</td>
                    <td>${vacation.reason}</td>
                    <td>${vacation.startdate}</td>
                    <td>${vacation.enddate}</td>
                    <td>${vacation.requestdate}</td>
                    <td>${vacation.updatedate}</td>
                    <td style="color: blue; font-size:20px;">${vacation.status}</td>
  				 <td>
 				 	<c:if test="${vacation.status == '신청'}">
 				 		<button class='approval-btn' data-empid="${vacation.status}">승인</button>
 				 	</c:if>
 				 </td>
 				 <td>
 				 	<c:if test="${vacation.status == '신청'}">
 				 		<button class='reject-btn' data-empid="${vacation.status}">반려</button>
 				 	</c:if>
 				 </td>                     
                </tr>
            </c:if>
        </c:forEach>
    </tbody>
</table>



<!-- 반려된 휴가 목록 -->
<table>
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
            <th>신청 일자</th>
            <th>수정 일자</th>
            <th>처리 상태</th>
            <th colspan="2">결재</th>
          </tr>       
    </thead>
    <tbody>
        <c:forEach items="${vacationApproval}" var="vacation">
            <c:if test="${vacation.status == '반려'}">
                <tr>
                    <td>${vacation.empid}</td>
                    <td>${vacation.empno}</td>
                    <td>${vacation.name}</td>
                    <td>${vacation.position}</td>
                    <td>${vacation.vacationtype}</td>
                    <td>${vacation.vacationdays}</td>
                    <td>${vacation.reason}</td>
                    <td>${vacation.startdate}</td>
                    <td>${vacation.enddate}</td>
                    <td>${vacation.requestdate}</td>
                    <td>${vacation.updatedate}</td>
                    <td style="color: red; font-size:20px;">${vacation.status}</td>
   				 <td>
 				 	<c:if test="${vacation.status == '신청'}">
 				 		<button class='approval-btn' data-empid="${vacation.status}">승인</button>
 				 	</c:if>
 				 </td>
 				 <td>
 				 	<c:if test="${vacation.status == '신청'}">
 				 		<button class='reject-btn' data-empid="${vacation.status}">반려</button>
 				 	</c:if>
 				 </td>                    
                </tr>
            </c:if>
        </c:forEach>
    </tbody>
</table>


	</div>
</div>
</main>
</body>
</html>

<script>

$(document).ready(function () {
	// 인사팀 접근여부 체크 로직
	var insaYnTxt = '${insaYn}';	
	if (insaYnTxt == 'N'){
		alert("해당 화면은 인사팀만 접근 가능합니다.");
		location.href = 'main';
	}
	
	
	$(".approval-btn").on("click", function (e) {
	    var emp_id = $(this).closest('tr').find('.emp_id').text();
	    console.log(emp_id);
	    
	    var isConfirmed = confirm("승인하시겠습니까?");

	    if (isConfirmed) {
	        $.ajax({
	            type: "POST",
	            url: "vacationApprovalUpdate",
	            contentType: "application/json",
	            data: JSON.stringify({ empid: emp_id }),
	            success: function (response) {
	                console.log(" 승인 성공: ", response);
	                location.reload();
	                alert("승인되었습니다");
	            }, // end of success: function (response) {
	            error: function (xhr, status, error) {
	                console.error(" 승인 실패: ", status, " 에러: ", error);
	            } // end of error: function (xhr, status, error) {
	        }); // end of $.ajax({
	    } // end of if (isConfirmed) {
	}); // end of $(".approval-btn").on("click", function (e) {

	$(".reject-btn").on("click", function () {
	    var emp_id = $(this).closest('tr').find('.emp_id').text();
	    console.log(emp_id);

	    var isConfirmed = confirm("반려 하시겠습니까?");

	    if (isConfirmed) {
	        $.ajax({
	            type: "POST",
	            url: "vacationRejectUpdate",
	            contentType: "application/json",
	            data: JSON.stringify({ empid: emp_id }),
	            success: function (response) {
	                console.log(" 반려 성공: ", response);
	                location.reload();
	                alert("반려되었습니다");
	            },
	            error: function (xhr, status, error) {
	                console.error(" 반려 실패: ", status, " 에러: ", error);
	            }
	        });
	    }
	}); // end of $(".reject-btn").on("click", function () {
}); // end of $(document).ready(function () {
</script>