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
.doc-todo{
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
color : #363945;
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

.doc-todo:hover {
	background-color : #eee;
}
.doc-ing:hover {
	background-color : #eee;
}
.doc-end:hover {
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
			<div class="doc-todo">
				<span style="color:#0D47A1;">미승인 휴가</span>
				<p style="font-size:70px; font-weight:bold;">${todoCnt}</p>
			</div>
			<div class="doc-ing">
				<span style="color:363945">승인 완료</span>
				<p style="font-size:70px; font-weight:bold;">${ingCnt}</p>
			</div>
			<div class="doc-end" style="color:#e53935;">
				<span>휴가 반려</span>
				<p style="font-size:70px; font-weight:bold;">${rejectCnt}</p>
		</div>
	</div>
       
	<div class="app-list">
		<span>자원 요청 처리함</span>
	</div>
        	
	<div class="AllList">
		
		<h2>비품 신청 목록</h2>
			<table>
				<thead>
					<tr>
						<th width="100px">신청 번호</th>
						<th width="100px">신청자</th>
						<th width="200px">신청 물품</th>
						<th width="200px">신청 수량</th>
						<th width="300px">신청내용</th>
						<th width="250px">신청일</th>	
						<th width="250px">수정일</th>	
						<th width="100px">진행현황</th>	
						<th width="100px" colspan="2">결재 처리</th>	
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${supplyList}" var="supply">
		                <tr class="supply-row" data-supply-id="${supply.supply_id}">
		                    <td class="supply_id">${supply.supply_id}</td>
		                    <td>${supply.empno}</td>
		                    <td>${supply.item}</td>
		                    <td>${supply.quantity}</td>
		                    <td>${supply.sdescription}</td>
		                    <td>${supply.sdate}</td>
		                    <td>${supply.modifyDtm}</td>
		                    <td>
			                    <c:choose>
			                        <c:when test="${supply.supply_status == 0}">처리 중</c:when>
			                        <c:when test="${supply.supply_status == 1}">승인</c:when>
			                        <c:when test="${supply.supply_status == 2}">거부</c:when>
			                        <c:otherwise>오류</c:otherwise>
			                    </c:choose>
               				 </td>
               				 <td>
               				 	<c:if test="${supply.supply_status == 0}">
               				 		<button class='approval-btn' data-supply-id="${supply.supply_id}">승인</button>
               				 	</c:if>
               				 </td>
               				 <td>
               				 	<c:if test="${supply.supply_status == 0}">
               				 		<button class='reject-btn' data-supply-id="${supply.supply_id}">반려</button>
               				 	</c:if>
               				 </td>
		                </tr>
		            </c:forEach>
				</tbody>
			</table>

		<h2>차량 신청 목록</h2>
			<table>
				<thead>
					<tr>
						<th width="100px">신청 번호</th>
						<th width="100px">신청자</th>
						<th width="200px">사용 시작일</th>
						<th width="200px">사용 종료일</th>
						<th width="300px">신청 사유</th>
						<th width="250px">신청일</th>
						<th width="250px">수정일</th>	
						<th width="100px">진행현황</th>
						<th width="100px" colspan="2">결재 처리</th>		
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${vehicleList}" var="vehicle">
						<tr>
				    		<td class="vehicle_id">${vehicle.vehicle_id}</td>
								<td>${vehicle.empno}</td>
								<td>${vehicle.vstartdate}</td>
								<td>${vehicle.venddate}</td>
								<td>${vehicle.vdescription}</td>
								<td>${vehicle.vdate}</td>
								<td>${vehicle.modifyDtm}</td>
								<td>
			                    <c:choose>
			                        <c:when test="${vehicle.vehicle_status == 0}">처리 중</c:when>
			                        <c:when test="${vehicle.vehicle_status == 1}">승인</c:when>
			                        <c:when test="${vehicle.vehicle_status == 2}">거부</c:when>
			                        <c:otherwise>오류</c:otherwise>
			                    </c:choose>
               				 </td>
               				 <td>
               					<c:if test="${vehicle.vehicle_status == 0}">
               				 		<button class='approval-btn' data-vehicle-id="${vehicle.vehicle_id}">승인</button>
               				 	</c:if>
               				 </td>
               				 <td>
               				 	<c:if test="${vehicle.vehicle_status == 0}">
             				 		<button class='reject-btn' data-vehicle-id="${vehicle.vehicle_id}">반려</button>
             				 	</c:if>
               				 </td>
               				 
						</tr>
					</c:forEach>
				</tbody>
			</table>

		<h2>경비 신청 목록</h2>
			<table>
				<thead>
					<tr>
						<th width="100px">신청 번호</th>
						<th width="100px">신청자</th>
						<th width="300px">사용처</th>
						<th width="400px">-</th>
						<th width="250px">신청일</th>
						<th width="250px">수정일</th>	
						<th width="100px">진행현황</th>	
						<th width="100px" colspan="2">결재 처리</th>	
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${expenseList}" var="expense">
						<tr>
				    		<td class="expense_id">${expense.expense_id}</td>
								<td>${expense.empno}</td>
								<td>${expense.usagePlace}</td>
								<td>none</td>
								<td>${expense.edate}</td>
								<td>${expense.modifyDtm}</td>
								<td>
			                    <c:choose>
			                        <c:when test="${expense.expense_status == 0}">처리 중</c:when>
			                        <c:when test="${expense.expense_status == 1}">승인</c:when>
			                        <c:when test="${expense.expense_status == 2}">거부</c:when>
			                        <c:otherwise>오류</c:otherwise>
			                    </c:choose>
               				 </td>
               				 <td>
               				 	<c:if test="${expense.expense_status == 0}">
               				 		<button class='approval-btn' data-expense-id="${expense.expense_id}">승인</button>
               				 	</c:if>
               				 </td>
               				 <td>
               				 	<c:if test="${expense.expense_status == 0}">
               				 		<button class='reject-btn' data-expense-id="${expense.expense_id}">반려</button>
               				 	</c:if>
               				 </td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		<h2>숙소예약 신청 목록</h2>
			<table>
				<thead>
					<tr>
						<th width="100px">신청 번호</th>
						<th width="100px">신청자</th>
						<th width="100px">숙박 인원</th>
						<th width="150px">체크인</th>
						<th width="150px">체크아웃</th>
						<th width="300px">상세</th>
						<th width="250px">신청일</th>
						<th width="250px">수정일</th>	
						<th width="100px">진행현황</th>	
						<th width="100px" colspan="2">결재 처리</th>	
					</tr>
				</thead>
				<tbody>			
					<c:forEach items="${reservationList}" var="reservation">
						<tr>
							<td class="reservation_id">${reservation.reservation_id}</td>
							<td>${reservation.empno}</td>
							<td>${reservation.numOfPeople}</td>
							<td>${reservation.checkInDate}</td>
							<td>${reservation.checkOutDate}</td>
							<td>${reservation.details}</td>
							<td>${reservation.rdate}</td>
							<td>${reservation.modifyDtm}</td>
							<td>
			                    <c:choose>
			                        <c:when test="${reservation.reservation_status == 0}">처리 중</c:when>
			                        <c:when test="${reservation.reservation_status == 1}">승인</c:when>
			                        <c:when test="${reservation.reservation_status == 2}">거부</c:when>
			                        <c:otherwise>오류</c:otherwise>
			                    </c:choose>
               				 </td>
               				 <td>
	               				 <c:if test="${reservation.reservation_status == 0}">
	               				 	<button class='approval-btn' data-reservation-id="${reservation.reservation_id}">승인</button>
	            				 </c:if>
               				 </td>
               				 <td>
	               				 <c:if test="${reservation.reservation_status == 0}">
	               				 	<button class='reject-btn' data-reservation-id="${reservation.reservation_id}">반려</button>
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

	    if ($(this).data("supply-id")) {
	    	resourceId = $(this).data("supply-id");
	    	resourceFlag = "supply";
	    } else if($(this).data("vehicle-id")) {
	    	resourceId = $(this).data("vehicle-id");
	    	resourceFlag = "vehicle";
	    } else if($(this).data("expense-id")) {
	    	resourceId = $(this).data("expense-id");
	    	resourceFlag = "expense";
	    } else if($(this).data("reservation-id")) {
	    	resourceId = $(this).data("reservation-id");
	    	resourceFlag = "reservation";
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

	    if ($(this).data("supply-id")) {
	    	resourceId = $(this).data("supply-id");
	    	resourceFlag = "supply";
	    } else if($(this).data("vehicle-id")) {
	    	resourceId = $(this).data("vehicle-id");
	    	resourceFlag = "vehicle";
	    } else if($(this).data("expense-id")) {
	    	resourceId = $(this).data("expense-id");
	    	resourceFlag = "expense";
	    } else if($(this).data("reservation-id")) {
	    	resourceId = $(this).data("reservation-id");
	    	resourceFlag = "reservation";
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