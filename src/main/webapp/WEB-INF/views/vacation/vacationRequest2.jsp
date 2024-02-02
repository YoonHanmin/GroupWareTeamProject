<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--      hiredate 날짜 포맷 형식 변경 -->
      <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
          <link rel="stylesheet" href="resources/css/bootstrap.css">
    <script src="https://kit.fontawesome.com/82c57657fe.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"></script>
    <!-- FullCalendar 라이브러리 및 jQuery 추가 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@latest/main.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/moment@latest/moment.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@latest/main.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<title>Insert title here</title>
</head>
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
    width: 100%; /* 전체 너비의 80%로 설정 */
    margin: auto; /* 가운데 정렬을 위한 margin 설정 */
    padding: 30px;
    border-bottom: 1px solid #eee;
    margin-top: 20px; /* 추가된 부분 */
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

    .form-container {
        width: 100%;
        max-width: 800px;
        margin: auto;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
    }

    .form-row {
        display: flex;
        flex-direction: column;
        margin-bottom: 10px;
    }

    input[type="text"], select, input[type="date"], input[type="submit"] {
        width: 100%;
        padding: 10px;
        margin: 5px 0;
        border: 1px solid #ccc;
        box-sizing: border-box;
        border-radius: 5px;
    }

    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }
    
    .calendar-container {
        width: 95%; 
        margin: auto; /* 가운데 정렬을 위한 margin 설정 */
        position: relative;
        padding-bottom: 60%; /* 너비의 80%에 대응하는 높이 설정 (1:1 비율을 위한 값) */
        overflow: hidden;
    }

    #calendar {
        position: absolute;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
    }
    
</style>
 <script>
 $(document).ready(function () {
		var profile = "${dto.getProfileimage()}";
		console.log("프로필사진명은 ==>"+profile);
		$("#profile-image").html("<img src='./display?fileName="+encodeURI(profile)+"'>");

 });
 </script>
 
<script>
    $(document).ready(function () {
        // 시작일 선택 시
$("input[name='startdate']").blur(function () {
    var startdate = new Date($("input[name='startdate']").val());
    var vacationType = $("select[name='vacationtype']").val();

    // 종료일 초기화
    $("input[name='enddate']").val("");
    $("input[name='vacationdays']").val("");

    if (vacationType === "반차") {
        // 반차인 경우
        $("input[name='enddate']").val($("input[name='startdate']").val());
        $("input[name='vacationdays']").val(0.5);
        // 종료일을 비활성화
        $("input[name='enddate']").prop('disabled', true);
    } else {
        // 반차가 아닌 경우, 종료일을 활성화
        $("input[name='enddate']").prop('disabled', false);
    }
});

// 종료일 선택 시
$("input[name='enddate']").blur(function () {
    var startdate = new Date($("input[name='startdate']").val());
    var enddate = new Date($("input[name='enddate']").val());

    // 종료일이 시작일보다 이전인 경우
    if (enddate < startdate) {
        alert("종료일은 시작일보다 빠를 수 없습니다.");
        // 날짜를 초기화하고 input 값을 비워줌
        $("input[name='enddate']").val("");
        $("input[name='vacationdays']").val("None");
        return;
    }

    // 날짜 차이 계산 (휴가 기간)
    var timeDiff = Math.abs(enddate.getTime() - startdate.getTime());
    var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24)) + 1;

    // 휴가 타입이 "반차"가 아닌 경우, 휴가 일수에 계산된 값 저장
    $("input[name='vacationdays']").val(diffDays);
});

        // 휴가 신청 폼 제출 시
        $("#vacationRequest").submit(function (event) {
            event.preventDefault(); // 기본 폼 제출 동작 막기

            // 폼 내부에서 변수들 가져오기
            var empno = $("#empNoDisplay").val();
            var name = $("#nameDisplay").val();
            var position = $("#positionDisplay").val();
            var startdate = $("input[name='startdate']").val();
            var enddate = $("input[name='enddate']").val();
            var vacationdays = $("input[name='vacationdays']").val();
            var reason = $("input[name='reason']").val();

            // 값이 비어있는 경우 폼 제출 방지
            if (!empno || !name || !position || !startdate || !enddate || !vacationdays || !reason) {
                alert("필수 입력 항목을 모두 입력해주세요.");
                return false; // 유효성 검사 실패
            }

            // 유효성 검사 함수
            function vacationCheck() {
                if (new Date(startdate) < new Date()) {
                    alert("휴가 시작일은 오늘 날짜보다 이후여야 합니다.");
                    return false; // 유효성 검사 실패
                }

                // 예시: 휴가 시작일이 종료일보다 빠른지 확인
                if (new Date(startdate) > new Date(enddate)) {
                    alert("휴가 종료일은 시작일보다 빠를 수 없습니다.");
                    return false; // 유효성 검사 실패
                }

                // 휴가 시작일 및 종료일이 반드시 입력되어 있어야 함
                if (!startdate || !enddate) {
                    alert("휴가 시작일과 종료일을 입력해주세요.");
                    return false; // 유효성 검사 실패
                }

                // 휴가 기간이 자동으로 계산되도록 함
                var vacationdays = $("input[name='vacationdays']").val();
                if (!vacationdays || parseFloat(vacationdays) <= 0) {
                	console.log(vacationdays);
                    alert("휴가 기간이 올바르지 않습니다.");
                    return false; // 유효성 검사 실패
                }

                // 예시: 휴가 사유가 비어있는지 확인
                if (reason.trim() === "") {
                    alert("휴가 사유를 입력해주세요.");
                    return false; // 유효성 검사 실패
                }

                // 모든 유효성 검사를 통과하면 true 반환
                return true;
            }

            if (vacationCheck()) {
                // 폼 데이터 가져오기
                var formData = {
                    empno: empno,
                    name: name,
                    position: position,
                    startdate: startdate,
                    enddate: enddate,
                    vacationtype: $("select[name='vacationtype']").val(),
                    vacationdays: vacationdays,
                    reason: reason
                };

                // 휴가 신청 요청 보내기
                $.ajax({
                    type: "POST",
                    url: "submitVacationRequest",
                    data: formData,
                    success: function (data) {
                        // 성공 시 메시지 출력 및 페이지 이동
                        alert("휴가 신청이 완료되었습니다. 휴가 신청 내역으로 이동합니다.");
                        window.location.href = "/myVacationRequests";
                    },
                    error: function () {
                        // 오류 시 메시지 출력 또는 다른 처리 수행
                        alert("휴가 신청 중 오류가 발생했습니다.");
                    }
                });
            }
        });
    });
</script>

<body>
 <jsp:include page="../nav2.jsp"/>
 
 <main>
 	<div class="header">
      	<ul class="nav nav-underline">
  <li class="item">
    <a class="people" aria-current="page" href="#" style="color:#FFFAFA;"><i class="bi bi-calendar-week" style="color:#FFFAFA;"></i>휴가 관리</a>
  </li>
  <li class="item">
    <a class="company" href="myVacationRequests" style="color:#FFFAFA;"><i class="bi bi-airplane-engines" style="color:#FFFAFA;"></i>휴가 신청 내역</a>
  </li>
</ul>      	
      </div>
      
      <div class="info">
      	<span>휴가 신청</span>
      </div>
      
        <div class="content">
        
        	 <form id="vacationRequest" action="vacationRequest" method="post">
                <table width="800px">
                    <thead>
                        <tr style="width:60px; height:50px;">
			                <th>사원번호</th>
			                <th>이름</th>
			                <th>직급</th>
			                <th>휴가 종류</th>
			                <th>휴가 사유</th>
			                <th>휴가 시작일</th>
			                <th>휴가 종료일</th>
			                <th>휴가 기간(일)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
			                <td><input type="text" id ="empNoDisplay" value="${dto.empno}" name="empno" readonly></td>
			                <td><input type="text" id ="nameDisplay" value="${dto.name}"  name="name"  readonly></td>
			                <td><input type="text" id ="positionDisplay" value="${dto.position}" name="position" readonly></td>
			                <td>
			                    <select name="vacationtype" required>
			                        <option value="" disabled selected hidden>휴가 타입 선택</option>
			                        <option value="연차">연차</option>
			                        <option value="반차">반차</option>
			                        <option value="휴가">휴가</option>
			                        <option value="기타">기타</option>
			                    </select>
			                </td>
			                <td><input type="text" name="reason" required></td>
			                <td><input type="date" name="startdate" required></td>
			                <td><input type="date" name="enddate" required></td>
			                <td><input type="text" name="vacationdays" readonly></td>
			                <td><input type="submit" value="휴가 신청"></td>
			            </tr>
                    </tbody>
                </table>
            </form>
        </div>
        
    <div class="calendar-container">
	    <div id="calendar"></div>
	</div>
    
<script>
document.addEventListener('DOMContentLoaded', function () {
       var calendarEl = document.getElementById('calendar');

       var calendar = new FullCalendar.Calendar(calendarEl, {
           headerToolbar: {
               left: 'prev,next today',
               center: 'title',
               right: 'dayGridMonth,timeGridWeek,timeGridDay'
           },
           initialView: 'dayGridMonth',
           events: [
               <c:forEach var="event" items="${events}">
                   {
                       title: '${event.vacationtype}',
                       start: '${event.startdate}',
                       end: '${event.enddate}',
                       backgroundColor: '${event.approved ? "#4CAF50" : ""}',
                       borderColor: '${event.approved ? "#4CAF50" : ""}'
                   }<c:if test="${!loop.last}">,</c:if>
               </c:forEach>
           ],
       });
    calendar.render();
});
</script> 
          
 </main>
 
</body>
</html>

