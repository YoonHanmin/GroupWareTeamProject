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
padding : 60px
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
/*       align-items: center; */
      height: 100vh;
      margin: 10px 10px;
	  padding : 10px;
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

    .resource-box {
      width: 150px;
      height: 150px;
      margin: 10px;
      display: flex;
      justify-content: center;
      align-items: center;
      border: 1px solid #ccc;
      cursor: pointer;
    }

    .resource-box:hover {
      background-color: #f0f0f0;
    }

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
    overflow: auto; /* 스크롤이 필요할 경우 자동으로 스크롤을 표시합니다. */
}

.modal-content {
    max-width: 800px;
    width: 80%; /* 모달의 너비를 조절합니다. */
    max-height: 500px;
    height: 80%; /* 모달의 높이를 조절합니다. */
    overflow-y: auto; /* 내용이 모달보다 길 경우 세로 스크롤을 표시합니다. */
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

    .modal-close {
        position: absolute;
        top: 10px;
        right: 10px;
        cursor: pointer;
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
      <h2> 자원요청 카테고리</h2> 
    </div>
     <div class="info">
		<button onclick="redirectToSupplyList()">내가 신청한 비품 목록 </button>
    </div>
     <div class="info">
		<button onclick="redirectToVehicleList()">내가 신청한 차량 목록 </button>
    </div>
     <div class="info">
		<button onclick="redirectToExpenseList()">내가 신청한 비용처리 목록 </button>
    </div>
      
    <div class="content">
<!-- 	  <div class="resource-box" onclick="openModal('supplies')">Supplies</div> -->
	  <div class="resource-box" data-modal="modal1">Supplies</div>
	  <div class="resource-box" data-modal="modal2">Vehicle</div>
	  <div class="resource-box" data-modal="modal3">Expense</div>
	  <div class="resource-box" data-modal="modal4">Reservation</div>
     </div>        
     
     <!-- Modal 1 - Supplies -->
<div id="modal1" class="modal">
    <div class="modal-content">
        <span class="modal-close">&times;</span>
        <h2>비품 신청입니다</h2>
        <form id="suppliesForm" class="resource-form" action="/submitSuppliesForm" method="post">
            <label for="sempno">사원번호:</label>
            <input type="text" id="sempno" name="sempno" required>
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
        	<label for="vempno">사원번호:</label>
            <input type="text" id="vempno" name="vempno" required>
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
                <label for="eempno">사원번호:</label>
                <input type="text" id="eempno" name="eempno" required>
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
         	<label for="rempno">사원번호:</label>
            <input type="text" id="rempno" name="rempno" required>
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
</body>
</html>

<script>

function redirectToSupplyList() {
    // 원하는 리다이렉션 로직을 여기에 추가
    window.location.href = "/supply_list";
}
function redirectToVehicleList() {
    window.location.href = "/vehicle_list";
}
function redirectToExpenseList() {
    window.location.href = "/expense_list";
}
function redirectToReservationList() {
    window.location.href = "/reservation_list";
}

$(document).ready(function () {
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
        var formData1 = {
            sempno: $("#sempno").val(),
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
                $("#suppliesForm")[0].reset();
                $("#modal1").css("display", "none");
                $("#successMessage").css("display", "block");
            }
        });
    });

    // Modal 2 - Vehicle
    $("#vehicleForm").submit(function (event) {
        event.preventDefault();
        var formData2 = {
            vempno: $("#vempno").val(),
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
                console.log("서버 응답:", response);
                $("#vehicleForm")[0].reset();
                $("#modal2").css("display", "none");
                $("#successMessage").css("display", "block");
            }
        });
    });
    
    // Modal 3 - expense
    $("#expenseForm").submit(function (event) {
        event.preventDefault();
        var formData3 = {
                eempno: $("#eempno").val(),
                usagePlace: $("#usagePlace").val(),
            };

        $.ajax({
            type: "POST",
            url: $(this).attr("action"),
            contentType: "application/json",
            data: JSON.stringify(formData3),
            success: function (response) {
                console.log("서버 응답:", response);
                $("#expenseForm")[0].reset();
                $("#modal3").css("display", "none");
                $("#successMessage").css("display", "block");
            }
        });
    });
    
    // Modal 4 - reservation
    $("#reservationForm").submit(function (event) {
        event.preventDefault();
        var formData4 = {
        		rempno: $("#rempno").val(),
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
                $("#reservationForm")[0].reset();
                $("#modal4").css("display", "none");
                $("#successMessage").css("display", "block");
            }
        });
    });

});

</script>

