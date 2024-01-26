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
      
    <div class="content">
<!-- 	  <div class="resource-box" onclick="openModal('supplies')">Supplies</div> -->
	  <div class="resource-box" data-modal="modal1">Supplies</div>
	  <div class="resource-box" data-modal="modal2">Vehicle</div>
	  <div class="resource-box" data-modal="modal3">Expense</div>
	  <div class="resource-box" data-modal="modal4">Meal</div>
	  <div class="resource-box" data-modal="modal5">Reservation</div>
     </div>        

<!-- Modal 1 - Supplies -->
<div id="modal1" class="modal">
    <div class="modal-content">
        <span class="modal-close">&times;</span>
        <h2>비품 신청입니다</h2>
        <form id="suppliesForm" action="/submitForm" method="post">
            <input type="hidden" name="category" value="supplies">
            <label for="itemName">물품명:</label>
            <input type="text" id="itemName" name="itemName" required>
            <label for="quantity">수량:</label>
            <input type="text" id="quantity" name="quantity" required>
            <label for="purpose">목적:</label>
            <textarea id="purpose" name="purpose" rows="4" required></textarea>
            <input type="submit" value="제출">
        </form>
    </div>
</div>

<!-- Modal 2 - Vehicle -->
<div id="modal2" class="modal">
    <div class="modal-content">
        <span class="modal-close">&times;</span>
        <h2>차량 신청입니다</h2>
        <form id="vehicleForm" action="/submitForm" method="post">
            <input type="hidden" name="category" value="vehicle">
           <label for="itemName">차량 번호:</label>
            <input type="text" id="itemName" name="itemName" required>
            <label for="quantity">수량:</label>
            <input type="text" id="quantity" name="quantity" required>
            <label for="purpose">목적:</label>
            <input type="submit" value="제출">
        </form>
    </div>
</div>
        
<!-- Modal 3 - Expense -->
<div id="modal3" class="modal">
    <div class="modal-content">
        <span class="modal-close">&times;</span>
        <h2>지출 비용 처리</h2>
        <form id="expenseForm" action="/submitForm" method="post">
            <input type="hidden" name="category" value="expense">
            <div id="fontSubject">
				개인경비청구서 
				<input type="hidden" name="subject" value="개인경비청구서 " readonly />
				<input type="hidden" name="information" value="개인경비청구서 입니다." readonly />
			<textarea style="display: none;" name="guide_form">요청 사항 :
				 </textarea>
			</div>
			<div id="fontpurpose">
				경비 청구
			</div>	
            <input type="submit" value="제출">
        </form>
    </div>
</div>

        
<!-- Modal 4 - Meal -->
<div id="modal4" class="modal">
    <div class="modal-content">
        <span class="modal-close">&times;</span>
        <h2>식비</h2>
        <form id="mealForm" action="/submitForm" method="post">
            <input type="hidden" name="category" value="meal">
             <label for="itemName">식사 인원:</label>
            <input type="text" id="itemName" name="itemName" required>
            <label for="quantity">비용:</label>
            <input type="text" id="quantity" name="quantity" required>
            <label for="purpose">비고:</label>
            <input type="submit" value="제출">
        </form>
    </div>
</div>

        
<!-- Modal 5 - Reservation -->
<div id="modal5" class="modal">
    <div class="modal-content">
        <span class="modal-close">&times;</span>
        <h2>숙소</h2>
        <form id="reservationForm" action="/submitForm" method="post">
            <input type="hidden" name="category" value="reservation">
            <label for="itemName">사용 금액:</label>
            <input type="text" id="itemName" name="itemName" required>
            <label for="quantity">숙박 인원:</label>
            <input type="text" id="quantity" name="quantity" required>
            <label for="purpose">숙박일:</label>
            <input type="submit" value="제출">
        </form>
    </div>
</div>


 </main>
</body>
</html>
<script>
$(document).ready(function () {
    $(".resource-box").click(function () {
        var modalId = $(this).data("modal");

        $("#" + modalId).css("display", "flex");
    });

    $(".modal-close").click(function () {
        $(this).closest(".modal").css("display", "none");
    });
});

$(document).ready(function () {
    $("#suppliesForm").submit(function (event) {
        event.preventDefault(); // 기본 폼 제출 방지

        var formData = $(this).serialize(); // 폼 데이터 직렬화

        $.ajax({
            type: "POST",
            url: "/submitSuppliesForm", // 실제 서버 엔드포인트로의 URL로 변경
            data: formData,
            success: function (response) {
                // 서버에서의 응답에 따라 클라이언트 동작을 정의할 수 있습니다.
                console.log("서버 응답:", response);
            },
            error: function (error) {
                console.error("오류 발생:", error);
            }
        });
    });
});
</script>
