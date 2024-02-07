<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <script src="resources/js/jquery.js"></script>
      <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
      <script src="https://kit.fontawesome.com/c6078bb273.js" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
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
border-bottom: 2px solid #eee;
padding : 30px
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
  display: flex;
      flex-wrap: wrap;
      justify-content: center;
	  height : 30%;
      margin: 10px 0px;
	  padding : 50px;
	  
	  border-bottom: 3px solid #000;
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
border-top : 1px solid #eee;
height : 800px;
}
.profile-info{
border-bottom : 1px solid #eee;

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

/* 박스 스타일 시작   */

.resource-box {
  width: 23%;
  height: 150px;
  margin: 10px;
  display: flex;
  justify-content: center;
  align-items: center;
  border: 5px solid #3498db; 
  border-radius: 50px;
  background-color: #b3ecff;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  cursor: pointer;
  
  
}

.resource-box:hover {
  background-color: #f0f0f0;
}

.resource-box h3 {
  color: #000; 
  font-size: 18px;
  font-family: 'Arial', sans-serif;
  font-weight: bold;
  margin-bottom: 8px;
}


/* 박스 스타일 끝   */


/* 모달 박스 스타일 시작   */

 /* 모달 스타일 수정 */
	.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    justify-content: center;
    align-items: center;
    overflow: auto; 
}

.modal-content {
    max-width: 890px;
    width: 80%; 
    max-height: 550px;
    height: 80%; 
    overflow-y: auto; 
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    transition: transform 0.3s ease-in-out;
}

.modal-content:hover {
    transform: scale(1.05); /* 마우스 호버 시 약간 확대되는 효과 추가 */
}

    .modal-close {
        position: absolute;
        top: 20px;
        right: 20px;
        cursor: pointer;
        font-size: 40px;
    }
    .modal-content h2 {
    text-align: center;
}
    
    .modal-content form {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
}

.modal-content label {
    margin-bottom: 5px;
}

.modal-content input,
.modal-content textarea {
    width: 100%;
    padding: 8px;
    margin-bottom: 10px;
    box-sizing: border-box;
}

.modal-content textarea {
    resize: vertical; /* 세로 리사이즈 허용 */
}

.modal-content input[type="submit"] {
    background-color: #4caf50;
    color: white;
    cursor: pointer;
}

.modal-content input[type="submit"]:hover {
    background-color: #45a049;
}
/* 모달 박스 스타일 끝   */

/*  목록 버튼 스타일 시작   */
    .request-lists {
        display: flex;
        gap: 10px; /* 간격 조절 */
        justify-content: center;
        margin-bottom: 20px;
        
        border-radius: 10px;
    }

.supply-list, .vehicle-list, .expense-list, .reservation-list{
 display: flex;
        gap: 10px; /* 간격 조절 */
        justify-content: center;
        margin-bottom: 20px;
         border: 2px solid #000; 
  border-radius: 10px;
  background-color: #eee;
}

.request-lists > div {
    margin: 0 10px;
    display: flex;
    flex-direction: column;
    align-items: center; /* 중앙 정렬을 위해 추가 */
    border-radius: 10px;
}
    .request-lists span {
        font-family: 'Arial', sans-serif;
        font-size: 16px;
        font-weight: bold;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        cursor: pointer;
    }

    .request-lists span:hover {
        background-color: #f0f0f0;
    }
/*  목록 버튼 스타일 끝   */
    

/* 리스트 스타일 시작 */

 .AllList {
    display: flex;
    justify-content: flex-start;
    margin: 20px;
    overflow-x: auto;
  }

  .supplylist, .vehiclelist, .expenselist, .reservationlist {
  	width: 90%; 
    background-color: #f4f4f4;
    border: 1px solid #ddd;
    border-radius: 20px;
    padding: 10px;
    margin: 10px;
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
/* 리스트 스타일 끝 */

   .supplylist, .vehiclelist, .expenselist, .reservationlist { 
     display: none; 
   } 

  
    /* 아이콘 위치 및 크기 조절 */
  .resource-box div {
    display: flex;
    align-items: left;
  }

  .resource-box i {
    margin-right: 5px; /* 아이콘과 텍스트 간격 조절 */
    font-size: 50px; /* 크기 조절 */
  }

  /* 아이콘과 텍스트 간격 조절 */
  .resource-box h3 {
    margin: 20px; /* 기본 마진 제거 */
  }


/* 반려 버튼 스타일 */
.delete-btn {
  background-color: #FF6347; /* 빨간색 */
  color: #ffffff; /* 흰색 텍스트 */
  border: none;
  padding: 8px 16px;
  cursor: pointer;
  border-radius : 20px;
}


</style>


<!--   $(document).ready(function () { -->
<%--  		var profile = "${dto.getProfileimage()}"; --%>
<!--  		console.log("프로필사진명은 ==>"+profile); -->
<!--  		$("#profile-image").html("<img src='./display?fileName="+encodeURI(profile)+"'>"); -->

<!--   }); -->

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
       <h2>    자원 신청하기 </h2>
</div>

      
<div class="content">
	<div class="resource-box" data-modal="modal1"> 
		<div>
		<i class="fa-solid fa-truck-field"></i>
			<h3>비품 신청</h3>
		</div>
	</div>
	
	<div class="resource-box" data-modal="modal2">
		<div>
		<i class="fa-solid fa-car"></i>
			<h3>차량 신청</h3>
		</div>
	</div>
	
	<div class="resource-box" data-modal="modal3">
		<div>
		<i class="fa-solid fa-barcode"></i>
			<h3>비용 신청</h3>
		</div>
	</div>
	  
	<div class="resource-box" data-modal="modal4">
		<div>
		<i class="fa-solid fa-hotel"></i>
			<h3>숙박 신청</h3>
		</div>
	</div>
</div> 

<div class="request-lists">
	<div class="supply-list">
		<span>비품 요청 목록</span>
	</div>
	<div class="vehicle-list">
		<span>차량 요청 목록</span>
	</div>
	<div class="expense-list">
		<span>비용 처리 신청 목록</span>
	</div>
	<div class="reservation-list">
		<span>숙박 신청 목록</span>
	</div>
</div>

<div class="AllList">

<!-- 비품신청 목록 -->
	<div class="supplylist">
		<table>
			<thead>
				<tr>
					<th>신청 번호</th>
					<th>신청자</th>
					<th>신청 물품</th>
					<th>신청 수량</th>
					<th width="300px">신청내용</th>
					<th>신청일</th>	
					<th>수정일</th>	
					<th>진행현황</th>	
					<th>비고</th>	
				</tr>
			</thead>
				<tbody>
			<c:forEach items="${supplyList}" var="supply">
                <tr class="supply-row" data-supply-id="${supply.supply_id}">
                    <td class="supply_id">${supply.supply_id}</td>
                </tr>
            </c:forEach>
				</tbody>
		</table>
	</div>
	
	
	<!-- 모달 추가 -->
<div id="supplyDetailsModal" class="modal">
    <div class="modal-content">
        <span class="modal-close">&times;</span>
        <!-- 상세 내용을 표시할 부분 -->
        <div id="supplyDetailsContent"></div>
    </div>
</div>
	
	
	
	
<!-- 차량신청 목록 -->
	<div class="vehiclelist">
		<table>
			<thead>
				<tr>
					<th>신청 번호</th>
					<th>신청자</th>
					<th>사용 시작일</th>
					<th>사용 종료일</th>
					<th width="300px">신청 사유</th>
					<th>신청일</th>
					<th>수정일</th>
					<th>진행현황</th>	
					<th>비고</th>
				</tr>
			</thead>
				<tbody>
					<c:forEach items="${vehicleList}" var="vehicle">
						<tr>
				    		<td class="vehicle_id">${vehicle.vehicle_id}</td>
						</tr>
					</c:forEach>
				</tbody>
		</table>
	</div>
	
	
<!-- 비용신청 목록 -->
	<div class="expenselist">
		<table>
			<thead>
				<tr>
					<th>신청 번호</th>
					<th>신청자</th>
					<th width="300px">사용처</th>
					<th>신청일</th>
					<th>수정일</th>
					<th>진행현황</th>	
					<th>비고</th>
				</tr>
			</thead>
				<tbody>
					<c:forEach items="${expenseList}" var="expense">
						<tr>
				    		<td class="expense_id">${expense.expense_id}</td>
						</tr>
					</c:forEach>
				</tbody>
		</table>
	</div>
	
	
<!-- 숙소 신청 목록 -->
	<div class="reservationlist">
		<table>
			<thead>
				<tr>
					<th>신청 번호</th>
					<th>신청자</th>
					<th>숙박 인원</th>
					<th>체크인</th>
					<th>체크아웃</th>
					<th width="300px">상세</th>
					<th>신청일</th>
					<th>수정일</th>
					<th>진행현황</th>	
					<th>비고</th>
				</tr>
			</thead>
				<tbody>
					<c:forEach items="${reservationList}" var="reservation">
						<tr>
				    		<td class="reservation_id">${reservation.reservation_id}</td>
<%-- 								<td>${reservation.empno}</td> --%>
<%-- 								<td>${reservation.rdescription}</td> --%>
<%-- 								<td>${reservation.rdate}</td> --%>
<%-- 								<td>${reservation.reservation_status}</td> --%>
						</tr>
					</c:forEach>
				</tbody>
		</table>
	</div>
        			
		
</div>			
   
     <!-- Modal 1 - Supplies -->
<div id="modal1" class="modal">
    <div class="modal-content">
        <span class="modal-close">&times;</span>
        <h2>비품 신청입니다</h2>
        <form id="suppliesForm" class="resource-form" action="/submitSuppliesForm" method="post">
            <label for="empno">사원번호:</label>
            <input type="text" id="empno" name="empno" value="${dto.getEmpno()}" required>
            <label for="item">물품명:</label>
            <input type="text" id="item" name="item" required>
            <label for="quantity">수량:</label>
            <input type="text" id="quantity" name="quantity" required>
            <label for="sdescription">설명:</label>
            <textarea id="sdescription" name="sdescription" rows="4" required></textarea>
            <input type="submit" value="비품 신청하기">
        </form>
    </div>
</div>

<!-- Modal 2 - Vehicle -->
<div id="modal2" class="modal">
    <div class="modal-content">
        <span class="modal-close">&times;</span>
        <h2>차량 신청입니다</h2>
        <form id="vehicleForm" class="resource-form" action="/submitVehicleForm" method="post">
        	<label for="empno">사원번호:</label>
            <input type="text" id="empno" name="empno" value="${dto.getEmpno()}" required>
            <label for="vstartdate">시작일:</label>
            <input type="date" id="vstartdate" name="vstartdate" required>
            <label for="venddate">종료일:</label>
            <input type="date" id="venddate" name="venddate" required>
            <label for="vdescription">용도:</label>
            <textarea id="vdescription" name="vdescription" rows="4" required></textarea>
            <input type="submit" value="차량 신청하기">
        </form>
    </div>
</div>
        
<!-- Modal 3 - Expense -->
<div id="modal3" class="modal">
    <div class="modal-content">
        <span class="modal-close">&times;</span>
        <h2>지출 비용 처리</h2>
        <form id="expenseForm" class="resource-form" action="/submitExpenseForm" method="post" enctype="multipart/form-data">
            <div id="fontSubject">
                <label for="empno">사원번호:</label>
                <input type="text" id="empno" name="empno" value="${dto.getEmpno()}" required>
                <label for="usagePlace">사용처:</label>
                <input type="text" id="usagePlace" name="usagePlace" required>
                <label for="attachment">첨부 이미지:</label>
                <input type="file" id="attachment" name="attachment" required>
            </div>
            <div id="fontpurpose">
                경비 청구
            </div>
            <input type="submit" value="경비 청구하기">
        </form>
    </div>
</div>

<!-- Modal 4 - Reservation -->
<div id="modal4" class="modal">
    <div class="modal-content">
        <span class="modal-close">&times;</span>
        <h2>숙소</h2>
        <form id="reservationForm" class="resource-form" action="/submitReservationForm" method="post">
         	<label for="empno">사원번호:</label>
            <input type="text" id="empno" name="empno" value="${dto.getEmpno()}" required>
            <label for="numOfPeople">숙박 인원:</label>
            <input type="text" id="numOfPeople" name="numOfPeople" required>
            <label for="checkInDate">숙박 시작일:</label>
            <input type="date" id="checkInDate" name="checkInDate" required>
            <label for="checkOutDate">숙박 종료일:</label>
            <input type="date" id="checkOutDate" name="checkOutDate" required>
            <label for="details">상세:</label>
            <input type="text" id="details" name="details" required>
            <input type="submit" value="신청하기">
        </form>
    </div>
</div>

 </main>
 
 <jsp:include page="../footer.jsp"/>
 
</body>
</html>


<!-- 모달 ajax파트 시작-->
<script>


$(document).ready(function () {
	
	
	var profile = "${dto.getProfileimage()}";
	console.log("프로필사진명은 ==>"+profile);
	$("#profile-image").html("<img src='./display?fileName="+encodeURI(profile)+"'>");
	
	

	
	
	
    $(".resource-box").click(function () {
        var modalId = $(this).data("modal");
        $("#" + modalId).css("display", "flex");
    });

    $(".modal-close").click(function () {
        $(this).closest(".modal").css("display", "none");
    });

    
 // Modal 1 - Supplies
 $("#suppliesForm").submit(function (event) {
    event.preventDefault();

    // 확인 창 띄우기
    if (confirm("비품을 신청하시겠습니까?")) {
        var formData1 = {
            empno: $("#empno").val(),
            item: $("#item").val(),
            quantity: $("#quantity").val(),
            sdescription: $("#sdescription").val()
        };

        $.ajax({
            type: "POST",
            url: $(this).attr("action"),
            contentType: "application/json",
            data: JSON.stringify(formData1),
            success: function (response) {
            console.log("서버 응답:", response);

                // 수정된 코드
                if (response === "supply_write formData submitted successfully") {
                    $("#suppliesForm")[0].reset();
                    $("#modal1").css("display", "none");
                    $("#successMessage").css("display", "block");
                    
                    alert("신청 되었습니다");
                } else {
                    console.error("서버 응답 오류:", response);
                    // ...
                }
            },
            error: function (xhr, status, error) {
                console.error("AJAX 오류:", status, error);
            }
        });
    }
});
 

 
 
 
 

    // Modal 2 - Vehicle
    $("#vehicleForm").submit(function (event) {
        event.preventDefault();
        
        if (confirm("차량 대여를 신청하시겠습니까?")) {
        var formData2 = {
            empno: $("#empno").val(),
            vstartdate: $("#vstartdate").val(),
            venddate: $("#venddate").val(),
            vdescription: $("#vdescription").val()
        };

        $.ajax({
            type: "POST",
            url: $(this).attr("action"),
            contentType: "application/json",
            data: JSON.stringify(formData2),
            success: function (response) {
            	  if (response === "vehicle_write formData submitted successfully") {
                      $("#vehicleForm")[0].reset();
                      $("#modal2").css("display", "none");
                      $("#successMessage").css("display", "block");
                      
                      alert("신청 되었습니다");
                  } else {
                      console.error("서버 응답 오류:", response);
                      // ...
                  }
              },
              error: function (xhr, status, error) {
                  console.error("AJAX 오류:", status, error);

              }
        });
        }
    });
    
    // Modal 3 - expense
    $("#expenseForm").submit(function (event) {
        event.preventDefault();
        
        if (confirm("비용 처리를 신청하시겠습니까?")) {
        var formData3 = {
                empno: $("#empno").val(),
                usagePlace: $("#usagePlace").val(),
            };

        $.ajax({
            type: "POST",
            url: $(this).attr("action"),
            contentType: "application/json",
            data: JSON.stringify(formData3),
            success: function (response) {
                console.log("서버 응답:", response);
          	  if (response === "expense_write formData submitted successfully") {
                  $("#expenseForm")[0].reset();
                  $("#modal3").css("display", "none");
                  $("#successMessage").css("display", "block");
                  
                  alert("신청 되었습니다");
              } else {
                  console.error("서버 응답 오류:", response);
                  // ...
              }
          },
          error: function (xhr, status, error) {
              console.error("AJAX 오류:", status, error);

          }
        });
        }
    });
    
    // Modal 4 - reservation
    $("#reservationForm").submit(function (event) {
        event.preventDefault();
        
        if (confirm("숙박 시설 지원을 요청하시겠습니까?")) {
        var formData4 = {
        		empno: $("#empno").val(),
        		numOfPeople: $("#numOfPeople").val(),
        		checkInDate: $("#checkInDate").val(),
        		checkOutDate: $("#checkOutDate").val(),
        		details: $("#details").val()
            };

        $.ajax({
            type: "POST",
            url: $(this).attr("action"),
            contentType: "application/json",
            data: JSON.stringify(formData4),
            success: function (response) {
                console.log("서버 응답:", response);
            	  if (response === "reservation_write formData submitted successfully") {
                      $("#reservationForm")[0].reset();
                      $("#modal4").css("display", "none");
                      $("#successMessage").css("display", "block");
                      
                      alert("신청 되었습니다");
                  } else {
                      console.error("서버 응답 오류:", response);
                      // ...
                  }
              },
              error: function (xhr, status, error) {
                  console.error("AJAX 오류:", status, error);

              }
        });
        }
    });

<!-- 모달 ajax파트 끝-->

<!-- 리스트 불러오기 ajax 파트 시작 -->
  
//  비품 요청 목록을 누를 때의 이벤트 처리
    $(".supply-list").click(function () {
        // Ajax로 비품 목록 가져오기
        $.ajax({
            type: "GET",
            url: "/getSupplyList", // 실제 컨트롤러에서 목록을 가져오는 엔드포인트로 변경
            dataType: "json", // 데이터 형식을 명시
            success: function (response) {
                // 비품 목록이 성공적으로 반환될 때의 처리
                console.log("비품 목록 가져오기 성공:", response);

                // 비품 목록을 화면에 표시하는 로직 (예시: supplyList를 테이블에 추가)
                var tableBody = $(".supplylist tbody");
                tableBody.empty(); // 기존 목록 비우기

                for (var i = 0; i < response.length; i++) {
                    var supply = response[i];
//                  시간 출력 설정을 변경
                    var sdate = new Date(supply.sdate).toLocaleString();
                    var modifyDtm = new Date(supply.modifyDtm).toLocaleString();
                    
                 // supply.supply_status에 대한 문자열 변환
                    var supplyStatus = getStatusMessage(supply.supply_status);
                    
//                  처리 중일 때만 버튼이 출력되게 변수 추가
                 	var deleteBtnTxt = "";
                    if(supply.supply_status == 0){
                    	deleteBtnTxt = "<td><button class='delete-btn' data-supply-id='" + supply.supply_id + "'>신청 취소</button></td>";
                    } else {
                    	deleteBtnTxt = "<td></td>";
                    }
                    
                    var row = "<tr>" +
                        "<td class='supply_id'>" + supply.supply_id + "</td>" +
                        "<td>" + supply.empno + "</td>" +
                        "<td>" + supply.item + "</td>" +
                        "<td>" + supply.quantity + "</td>" +
                        "<td>" + supply.sdescription + "</td>" +
                        "<td>" + sdate + "</td>" +
                        "<td>" + modifyDtm + "</td>" +
//                         "<td>" + supply.supply_status + "</td>" +
                        "<td>" + supplyStatus + "</td>" +
//                        "<td><button class='delete-btn' data-supply-id='" + supply.supply_id + "'>신청 취소</button></td>" +
						deleteBtnTxt +
                        "</tr>";                    
                    tableBody.append(row);
                }
                $(".supplylist").show(); // Show the supply list
                $(".vehiclelist").hide(); // Hide the vehicle list
                $(".expenselist").hide(); // Hide the vehicle list
                $(".reservationlist").hide(); // Hide the vehicle list
            },
            error: function (xhr, status, error) {
                console.error("AJAX 오류:", status, error);
            }
        });
    });
 
 
 // 차량 요청 목록을 누를 때의 이벤트 처리
    $(".vehicle-list").click(function () {
        // Ajax로 비품 목록 가져오기
        $.ajax({
            type: "GET",
            url: "/getVehicleList", // 실제 컨트롤러에서 목록을 가져오는 엔드포인트로 변경
            dataType: "json", // 데이터 형식을 명시
            success: function (response) {
                console.log("차량 목록 가져오기 성공:", response);

                var tableBody = $(".vehiclelist tbody");
                tableBody.empty(); // 기존 목록 비우기
                
                for (var i = 0; i < response.length; i++) {
                    var vehicle = response[i];
//                  시간 출력 설정을 변경
                    var vstartdate = new Date(vehicle.vstartdate).toLocaleString();
                    var venddate = new Date(vehicle.venddate).toLocaleString();
                    var vdate = new Date(vehicle.vdate).toLocaleString();
                    var modifyDtm = new Date(vehicle.modifyDtm).toLocaleString();
                    
                    // vehicle.vehicle_status에 대한 문자열 변환
                    var vehicleStatus = getStatusMessage(vehicle.vehicle_status);
                    
//                  처리 중일 때만 버튼이 출력되게 변수 추가
                 	var deleteBtnTxt = "";
                    if(vehicle.vehicle_status == 0){
                    	deleteBtnTxt = "<td><button class='delete-btn' data-vehicle-id='" + vehicle.vehicle_id + "'>신청 취소</button></td>";
                    } else {
                    	deleteBtnTxt = "<td></td>";
                    }
                    
                    
                    var row = "<tr>" +
                        "<td class='vehicle_id'>" + vehicle.vehicle_id + "</td>" +
                        "<td>" + vehicle.empno + "</td>" +
                        "<td>" + vstartdate + "</td>" +
                        "<td>" + venddate + "</td>" +
                        "<td>" + vehicle.vdescription + "</td>" +
                        "<td>" + vdate + "</td>" +
                        "<td>" + modifyDtm + "</td>" +
//                         "<td>" + vehicle.vehicle_status + "</td>" +
                        "<td>" + vehicleStatus + "</td>" +
//                         "<td><button class='delete-btn' data-vehicle-id='" + vehicle.vehicle_id + "'>신청 취소</button></td>" +
                        deleteBtnTxt+
                        "</tr>";
                    tableBody.append(row);
                }
                $(".supplylist").hide();
                $(".vehiclelist").show();
                $(".expenselist").hide(); 
                $(".reservationlist").hide(); 
            },
            error: function (xhr, status, error) {
                console.error("AJAX 오류:", status, error);
            }
        });
    });
 
 // 비용 처리 신청 목록을 누를 때의 이벤트 처리
    $(".expense-list").click(function () {
        $.ajax({
            type: "GET",
            url: "/getExpenseList",
            dataType: "json", 
            success: function (response) {
                console.log("비용 처리 목록 가져오기 성공:", response);

                var tableBody = $(".expenselist tbody");
                tableBody.empty(); 

                for (var i = 0; i < response.length; i++) {
                    var expense = response[i];
//                  시간 출력 설정을 변경
                    var edate = new Date(expense.edate).toLocaleString();
                    var modifyDtm = new Date(expense.modifyDtm).toLocaleString();
                    
                 // expense.expense_status에 대한 문자열 변환
                    var expenseStatus = getStatusMessage(expense.expense_status);
                    
//                  처리 중일 때만 버튼이 출력되게 변수 추가
                 	var deleteBtnTxt = "";
                    if(expense.expense_status == 0){
                    	deleteBtnTxt = "<td><button class='delete-btn' data-expense-id='" + expense.expense_id + "'>신청 취소</button></td>";
                    } else {
                    	deleteBtnTxt = "<td></td>";
                    }
                 
                    
                    var row = "<tr>" +
                        "<td class='expense_id'>" + expense.expense_id + "</td>" +
                        "<td>" + expense.empno + "</td>" +
                        "<td>" + expense.usagePlace + "</td>" +
                        "<td>" + edate + "</td>" +
                        "<td>" + modifyDtm + "</td>" +
//                         "<td>" + expense.expense_status + "</td>" +
                        "<td>" + expenseStatus + "</td>" +
//                         "<td><button class='delete-btn' data-expense-id='" + expense.expense_id + "'>신청 취소</button></td>" +
                        deleteBtnTxt + 
                        "</tr>";
                    tableBody.append(row);
                }
                $(".supplylist").hide();
                $(".vehiclelist").hide(); 
                $(".expenselist").show();
                $(".reservationlist").hide();
                
            },
            error: function (xhr, status, error) {
                console.error("AJAX 오류:", status, error);
            }
        });
    });
 
 // 숙박 신청 목록을 누를 때의 이벤트 처리
    $(".reservation-list").click(function () {
        // Ajax로 비품 목록 가져오기
        $.ajax({
            type: "GET",
            url: "/getReservationList", // 실제 컨트롤러에서 목록을 가져오는 엔드포인트로 변경
            dataType: "json", // 데이터 형식을 명시
            success: function (response) {
                console.log("숙박 신청 목록 가져오기 성공:", response);

                var tableBody = $(".reservationlist tbody");
                tableBody.empty(); // 기존 목록 비우기

                for (var i = 0; i < response.length; i++) {
                    var reservation = response[i];
//                시간 출력 설정을 변경
                    var checkInDate = new Date(reservation.checkInDate).toLocaleString();
                    var checkOutDate = new Date(reservation.checkOutDate).toLocaleString();
                    var rdate = new Date(reservation.rdate).toLocaleString();
                    var modifyDtm = new Date(reservation.modifyDtm).toLocaleString();
                    
                    // reservation.reservation_status에 대한 문자열 변환
                    var reservationStatus = getStatusMessage(reservation.reservation_status);
                    
//                  처리 중일 때만 버튼이 출력되게 변수 추가
                 	var deleteBtnTxt = "";
                    if(reservation.reservation_status == 0){
                    	deleteBtnTxt = "<td><button class='delete-btn' data-expense-id='" + reservation.reservation_id + "'>신청 취소</button></td>";
                    } else {
                    	deleteBtnTxt = "<td></td>";
                    }
                    
                    
                    var row = "<tr>" +
                        "<td class='reservation_id'>" + reservation.reservation_id + "</td>" +
                        "<td>" + reservation.empno + "</td>" +
                        "<td>" + reservation.numOfPeople + "</td>" +
                        "<td>" + checkInDate + "</td>" +
                        "<td>" + checkOutDate + "</td>" +
                        "<td>" + reservation.details + "</td>" +
                        "<td>" + rdate+ "</td>" +
                        "<td>" + modifyDtm + "</td>" +
//                         "<td>" + reservation.reservation_status + "</td>" +
                        "<td>" + reservationStatus + "</td>" +
//                         "<td><button class='delete-btn' data-reservation-id='" + reservation.reservation_id + "'>신청 취소</button></td>" +
						deleteBtnTxt+
                        "</tr>";
                    tableBody.append(row);
                }
                $(".supplylist").hide();
                $(".vehiclelist").hide();
                $(".expenselist").hide(); 
                $(".reservationlist").show(); 
            },
            error: function (xhr, status, error) {
                console.error("AJAX 오류:", status, error);
            }
        });
    });

//  삭제 기능 추가 시작

// 삭제 버튼 클릭 시 이벤트 핸들러 등록
$(".supplylist tbody").on("click", ".delete-btn", function () {
    var supplyId = $(this).data("supply-id");

    // 삭제를 확인하는 다이얼로그 표시
    var isConfirmed = confirm("신청을 취소하시겠습니까?");

    // 사용자가 확인을 선택한 경우에만 삭제 작업 수행
    if (isConfirmed) {
    	var deleteButton = $(this); // delete 버튼을 변수로 저장
    	
        // Ajax를 사용하여 서버에 supply_id를 전송하여 삭제 작업 요청
        $.ajax({
            type: "POST",
            url: "/deleteSupply",
            contentType: "application/json",
            data: JSON.stringify({ supply_id: supplyId }),
            success: function (response) {
                console.log("supply_id 삭제 성공:", response);

             // 삭제가 성공하면 테이블에서 해당 행을 제거
                deleteButton.closest("tr").remove();

                // 취소되었습니다 알림 표시
                alert("취소되었습니다");
            },
            error: function (xhr, status, error) {
                console.error("supply_id 삭제 실패:", status, error);
            }
        });
    }
});

$(".vehiclelist tbody").on("click", ".delete-btn", function () {
    var vehicleId = $(this).data("vehicle-id");

    var isConfirmed = confirm("신청을 취소하시겠습니까?");

    if (isConfirmed) {
    	var deleteButton = $(this); // delete 버튼을 변수로 저장
    	
        $.ajax({
            type: "POST",
            url: "/deleteVehicle",
            contentType: "application/json",
            data: JSON.stringify({ vehicle_id: vehicleId }),
            success: function (response) {
                console.log("vehicle_id 삭제 성공:", response);

             // 삭제가 성공하면 테이블에서 해당 행을 제거
                deleteButton.closest("tr").remove();

                // 취소되었습니다 알림 표시
                alert("취소되었습니다");
            },
            error: function (xhr, status, error) {
                console.error("vehicle_id 삭제 실패:", status, error);
            }
        });
    }
});

$(".expenselist tbody").on("click", ".delete-btn", function () {
    var expenseId = $(this).data("expense-id");

    var isConfirmed = confirm("신청을 취소하시겠습니까?");

    if (isConfirmed) {
    	var deleteButton = $(this); // delete 버튼을 변수로 저장
    	
        $.ajax({
            type: "POST",
            url: "/deleteExpense",
            contentType: "application/json",
            data: JSON.stringify({ expense_id: expenseId }),
            success: function (response) {
                console.log("expense_id 삭제 성공:", response);

             // 삭제가 성공하면 테이블에서 해당 행을 제거
                deleteButton.closest("tr").remove();

                // 취소되었습니다 알림 표시
                alert("취소되었습니다");
            },
            error: function (xhr, status, error) {
                console.error("expense_id 삭제 실패:", status, error);
            }
        });
    }
});

$(".reservationlist tbody").on("click", ".delete-btn", function () {
    var reservationId = $(this).data("reservation-id");

    var isConfirmed = confirm("신청을 취소하시겠습니까?");

    if (isConfirmed) {
        var deleteButton = $(this); // delete 버튼을 변수로 저장

        $.ajax({
            type: "POST",
            url: "/deleteReservation",
            contentType: "application/json",
            data: JSON.stringify({ reservation_id: reservationId }),
            success: function (response) {
                console.log("reservation_id 삭제 성공:", response);

                // 삭제가 성공하면 테이블에서 해당 행을 제거
                deleteButton.closest("tr").remove();

                // 취소되었습니다 알림 표시
                alert("취소되었습니다");
            },
            error: function (xhr, status, error) {
                console.error("reservation_id 삭제 실패:", status, error);
            }
        });
    }
});


//예시: 상태 값에 따른 의미 정의
function getStatusMessage(status) {
    switch (status) {
        case 0:
            return "처리 중";
        case 1:
            return "승인";
        case 2:
            return "반려";
        default:
            return "알 수 없는 상태";
    }
}

});



</script>


<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<!-- Bootstrap JS (Popper.js and Bootstrap JS) -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>