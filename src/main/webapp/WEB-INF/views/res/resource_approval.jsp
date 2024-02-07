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

.info {
  height: 100px;
  display: flex;
  align-items: flex-start;
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
align-items: flex-start;
justify-content: flex-start;

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
border : 1px solid #000;
margin-right: 10px;
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
border : 1px solid #000;
cursor : pointer;
margin-right: 10px;
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
border : 1px solid #000;
cursor : pointer;
margin-right: 10px;
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
    border-radius: 20px;
    text-align: center;
  }

  th, td {
    border: 10px solid #b3ecff;;
    padding: 8px;
    text-align: center;
    border-bottom: 1px solid #b3ecff; /* 구분선 추가 */
    border-radius: 10px;
  }

  th {
    background-color: #4CAF50;
    color: white;
    border-radius: 10px;
    text-align: center;
  }

  tbody tr:hover {
    background-color: #f5f5f5;
  }
    
    
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



/* 토글 아이콘 스타일 */
.toggle-icon {
  display: inline-block;
  margin-left: 5px; /* 아이콘과 텍스트 간격 조절 */
  font-size: 30px; /* 아이콘 크기 조절 */
  transition: transform 0.3s ease; /* 토글 애니메이션 효과 */
}

/* 토글 아이콘이 ▲ 일 때의 스타일 */
.AllList h2 .toggle-icon[data-icon="up"]::before {
  content: '\25B2'; /* ▲ 유니코드 */
}

/* 토글 아이콘이 ▼ 일 때의 스타일 */
.AllList h2 .toggle-icon[data-icon="down"]::before {
  content: '\25BC'; /* ▼ 유니코드 */
}

/* 클릭 시 토글 아이콘의 회전 효과 */
.AllList h2 .toggle-icon[data-rotate="true"] {
  transform: rotate(180deg);
}

/* 승인 버튼 스타일 */
.approval-btn {
  background-color: #3498db; /* 파란색 */
  color: #ffffff; /* 흰색 텍스트 */
  border: none;
  padding: 8px 16px;
  cursor: pointer;
    border-radius : 20px;
}


/* 반려 버튼 스타일 */
.reject-btn {
  background-color: #FF6347; /* 빨간색 */
  color: #ffffff; /* 흰색 텍스트 */
  border: none;
  padding: 8px 16px;
  cursor: pointer;
    border-radius : 20px;
}

/* 승인 및 반려 버튼 간격 조절 */
.approval-btn,
.reject-btn {
  margin-right: 5px; /* 원하는 간격으로 조절 */
}


 .supply-status-0 {
        color: blue; /* 처리 중 상태의 폰트 색상을 파란색으로 지정 */
    }

    .supply-status-1 {
        color: green; /* 승인 상태의 폰트 색상을 초록색으로 지정 */
    }

    .supply-status-2 {
        color: red; /* 거부 상태의 폰트 색상을 빨간색으로 지정 */
    }
    
 .vehicle-status-0 {
        color: blue; /* 처리 중 상태의 폰트 색상을 파란색으로 지정 */
    }

    .vehicle-status-1 {
        color: green; /* 승인 상태의 폰트 색상을 초록색으로 지정 */
    }

    .vehicle-status-2 {
        color: red; /* 거부 상태의 폰트 색상을 빨간색으로 지정 */
    }
    
    
 .expense-status-0 {
        color: blue; /* 처리 중 상태의 폰트 색상을 파란색으로 지정 */
    }

    .expense-status-1 {
        color: green; /* 승인 상태의 폰트 색상을 초록색으로 지정 */
    }

    .expense-status-2 {
        color: red; /* 거부 상태의 폰트 색상을 빨간색으로 지정 */
    }
    
    
 .reservation-status-0 {
        color: blue; /* 처리 중 상태의 폰트 색상을 파란색으로 지정 */
    }

    .reservation-status-1 {
        color: green; /* 승인 상태의 폰트 색상을 초록색으로 지정 */
    }

    .reservation-status-2 {
        color: red; /* 거부 상태의 폰트 색상을 빨간색으로 지정 */
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
		<span>처리 현황</span>
	</div>
  
	<div class="content">
		<div class="app-header">
			<div class="doc-todo">
				<span style="color:#0D47A1;">확인할 문서</span>
				<p style="font-size:70px; font-weight:bold;">${todoCnt}</p>
			</div>
			<div class="doc-ing">
				<span style="color:363945">승인한 문서</span>
				<p style="font-size:70px; font-weight:bold;">${ingCnt}</p>
			</div>
			<div class="doc-end" style="color:#e53935;">
				<span>반려한 문서</span>
				<p style="font-size:70px; font-weight:bold;">${rejectCnt}</p>
		</div>
	</div>
       
	<div class="app-list">
		<span>자원 요청 처리함</span>
	</div>
        	
	<div class="AllList">
		
	<h2>비품 신청 목록</h2>

<!-- <label for="statusFilter">상태 필터:</label> -->
<!-- <select id="statusFilter" onchange="console.log('onchange 이벤트 발생'); filterSupplyList()"> -->
<!--     <option value="all">전체</option> -->
<!--     <option value="processing">처리 중</option> -->
<!--     <option value="approved">승인</option> -->
<!--     <option value="rejected">거부</option> -->
<!-- </select> -->

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
            <tr class="supply-row supply-status-${supply.supply_status}" data-supply-id="${supply.supply_id}">
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
                    <c:if test="${supply.supply_status == 0 || supply.supply_status == 2}">
                        <button class='reject-btn' data-supply-id="${supply.supply_id}">반려</button>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

		
		
		
<!-- 			<table> -->
<!-- 				<thead> -->
<!-- 					<tr> -->
<!-- 						<th width="100px">신청 번호</th> -->
<!-- 						<th width="100px">신청자</th> -->
<!-- 						<th width="200px">신청 물품</th> -->
<!-- 						<th width="200px">신청 수량</th> -->
<!-- 						<th width="300px">신청내용</th> -->
<!-- 						<th width="250px">신청일</th>	 -->
<!-- 						<th width="250px">수정일</th>	 -->
<!-- 						<th width="100px">진행현황</th>	 -->
<!-- 						<th width="100px" colspan="2">결재 처리</th>	 -->
<!-- 					</tr> -->
<!-- 				</thead> -->
<!-- 				<tbody> -->
<%-- 					<c:forEach items="${supplyList}" var="supply"> --%>
<%-- 		                <tr class="supply-row" data-supply-id="${supply.supply_id}"> --%>
<%-- 		                    <td class="supply_id">${supply.supply_id}</td> --%>
<%-- 		                    <td>${supply.empno}</td> --%>
<%-- 		                    <td>${supply.item}</td> --%>
<%-- 		                    <td>${supply.quantity}</td> --%>
<%-- 		                    <td>${supply.sdescription}</td> --%>
<%-- 		                    <td>${supply.sdate}</td> --%>
<%-- 		                    <td>${supply.modifyDtm}</td> --%>
<%-- <%-- 		            <td>${supply.supply_status}</td> --%> 
<!-- 		                    <td> -->
<%-- 			                    <c:choose> --%>
<%-- 			                        <c:when test="${supply.supply_status == 0}">처리 중</c:when> --%>
<%-- 			                        <c:when test="${supply.supply_status == 1}">승인</c:when> --%>
<%-- 			                        <c:when test="${supply.supply_status == 2}">거부</c:when> --%>
<%-- 			                        <c:otherwise>오류</c:otherwise> --%>

<%-- 			                    </c:choose> --%>
<!--                				 </td> -->
<!--                				 <td> -->
<%--                				 	<c:if test="${supply.supply_status == 0}"> --%>
<%--                				 		<button class='approval-btn' data-supply-id="${supply.supply_id}">승인</button> --%>
<%--                				 	</c:if> --%>
<!--                				 </td> -->
<!--                				 <td> -->
<%--                				 	<c:if test="${supply.supply_status == 0}"> --%>
<%--                				 		<button class='reject-btn' data-supply-id="${supply.supply_id}">반려</button> --%>
<%--                				 	</c:if> --%>
<!--                				 </td> -->
<!-- 		                </tr> -->
<%-- 		            </c:forEach> --%>
<!-- 				</tbody> -->
<!-- 			</table> -->

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
					            <tr class="vehicle-row vehicle-status-${vehicle.vehicle_status}" data-supply-id="${vehicle.vehicle_id}">
<!-- 						<tr> -->
				    		<td class="vehicle_id">${vehicle.vehicle_id}</td>
								<td>${vehicle.empno}</td>
								<td>${vehicle.vstartdate}</td>
								<td>${vehicle.venddate}</td>
								<td>${vehicle.vdescription}</td>
								<td>${vehicle.vdate}</td>
								<td>${vehicle.modifyDtm}</td>
<%-- 						<td>${vehicle.vehicle_status}</td> --%>
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
					 <tr class="expense-row expense-status-${expense.expense_status}" data-supply-id="${expense.expense_id}">
				    		<td class="expense_id">${expense.expense_id}</td>
								<td>${expense.empno}</td>
								<td>${expense.usagePlace}</td>
								<td>none</td>
								<td>${expense.edate}</td>
								<td>${expense.modifyDtm}</td>
<%-- 						<td>${expense.expense_status}</td> --%>
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
						<tr class="reservation-row reservation-status-${reservation.reservation_status}" data-supply-id="${reservation.reservation_id}">
							<td class="reservation_id">${reservation.reservation_id}</td>
							<td>${reservation.empno}</td>
							<td>${reservation.numOfPeople}</td>
							<td>${reservation.checkInDate}</td>
							<td>${reservation.checkOutDate}</td>
							<td>${reservation.details}</td>
							<td>${reservation.rdate}</td>
							<td>${reservation.modifyDtm}</td>
<%-- 					<td>${reservation.reservation_status}</td> --%>
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

<jsp:include page="../footer.jsp"/>


</body>
</html>

<script>

// function filterSupplyList() {
//     console.log("filterSupplyList 함수 호출됨");

//     var selectedStatus = document.getElementById("statusFilter").value;

//     // 전체를 선택한 경우 모든 행을 보이도록 설정
//     $(".supply-row").show();

//     // 선택된 상태가 "전체"가 아닌 경우, 해당 상태가 아닌 행을 숨깁니다.
//     if (selectedStatus !== "all") {
//         $(".supply-row:not(.supply-status-" + selectedStatus + ")").hide();
//     }
// }








$(document).ready(function () {
				
	// 각 h2 요소에 대해 토글 아이콘과 클릭 이벤트 추가
	$(".AllList h2").each(function () {
	  $(this).prepend('<span class="toggle-icon" data-icon="up" data-rotate="false"></span>'); // 토글 아이콘 추가
	});

	// h2 요소를 클릭하면 해당 테이블을 토글하고 아이콘도 변경
	$(".AllList h2").click(function () {
	  $(this).next("table").toggle();
	  // 토글 아이콘 변경 및 회전 효과 적용
	  $(this).find('.toggle-icon').attr('data-icon', function (_, icon) {
	    return icon === 'up' ? 'down' : 'up';
	  }).attr('data-rotate', function (_, rotate) {
	    return rotate === 'true' ? 'false' : 'true';
	  });
	});

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