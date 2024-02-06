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
  }

  table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
    
  }

  th, td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
    
    
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
	
	
	<div class="info">
		<span>휴가신청 현황</span>
	</div>
  
	<div class="content">
		<div class="app-header">
			<div class="vac-todo">
				<span style="color:#0D47A1;">미승인 휴가</span>
				<p style="font-size:70px; font-weight:bold;">${tovacnt}</p>
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
		<span>휴가신청내역</span>
	</div>
        	
	<div class="AllList">
		
		<h2>비품 신청 목록</h2>
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
            <th>신청 상태</th>
            <th>신청 일자</th>
            <th>취소</th>
          </tr>
        </thead>
				<tbody>
					<c:forEach items="${vacationList}" var="vacation">
		                <tr class="vacation-row" data-vacation-id="${vacation.vacation_id}">
		                    <td class="vacation_id">${vacation.vacation_id}</td>
		                    <td>${vacation.empno}</td>
		                    <td>${vacation.item}</td>
		                    <td>${vacation.quantity}</td>
		                    <td>${vacation.sdescription}</td>
		                    <td>${vacation.sdate}</td>
		                    <td>${vacation.modifyDtm}</td>
		                    <td>
			                    <c:choose>
			                        <c:when test="${vacation.vacation_status == 0}">처리 중</c:when>
			                        <c:when test="${vacation.vacation_status == 1}">승인</c:when>
			                        <c:when test="${vacation.vacation_status == 2}">거부</c:when>
			                        <c:otherwise>오류</c:otherwise>
			                    </c:choose>
               				 </td>
               				 <td>
               				 	<c:if test="${vacation.vacation_status == 0}">
               				 		<button class='approval-btn' data-supply-id="${vacation.vacation_status}">승인</button>
               				 	</c:if>
               				 </td>
               				 <td>
               				 	<c:if test="${vacation.vacation_status == 0}">
               				 		<button class='reject-btn' data-supply-id="${vacation.vacation_status}">반려</button>
               				 	</c:if>
               				 </td>
		                </tr>
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
	    var resourceId = "";
	    var resourceFlag = "";
	    var targetUrl = "/approvalUpdate";

	    if ($(this).data("vacation-id")) {
	    	resourceId = $(this).data("vacation-id");
	    	resourceFlag = "vacation";
	    }
	    
	    var isConfirmed = confirm("승인하시겠습니까?");

	    if (isConfirmed) {
// 	    	var deleteButton = $(this); 
	    	
	        $.ajax({
	            type: "POST",
	            url: targetUrl,
	            contentType: "application/json",
	            data: JSON.stringify({ resourceId: resourceId, resourceFlag: resourceFlag }),
	            success: function (response) {
	                console.log(resourceFlag + " 승인 성공: ", response);
	                
	                // Refresh the page
                    location.reload();

// 	                deleteButton.closest("tr").remove();
 
	                alert("승인되었습니다");
	            },
	            error: function (xhr, status, error) {
	                console.error(resourceFlag + " 승인 실패: ", status, error);
	            }
	        });
	    }
	});
	
	
	$(".reject-btn").on("click", function () {
		var resourceId = "";
	    var resourceFlag = "";
	    var targetUrl = "/rejectUpdate";

	    if ($(this).data("vacation-id")) {
	    	resourceId = $(this).data("vacation-id");
	    	resourceFlag = "vacation";
	    }

	    var isConfirmed = confirm("반려 하시겠습니까?");

	    if (isConfirmed) {
// 	    	var deleteButton = $(this); 
	    	
	        $.ajax({
	            type: "POST",
	            url: targetUrl,
	            contentType: "application/json",
	            data: JSON.stringify({ resourceId: resourceId, resourceFlag: resourceFlag }),
	            success: function (response) {
	                console.log(resourceFlag + " 반려 성공: ", response);
	                
	                // Refresh the page
                    location.reload();

// 	                deleteButton.closest("tr").remove();
 
	                alert("반려되었습니다");
	            },
	            error: function (xhr, status, error) {
	                console.error(resourceFlag + " 반려 실패: ", status, error);
	            }
	        });
	    }
	});
	
	
});

</script>