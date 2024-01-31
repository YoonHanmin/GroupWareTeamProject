<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--      hiredate 날짜 포맷 형식 변경 -->
      <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
          <link rel="stylesheet" href="resources/css/bootstrap.css">
    <script src="resources/js/jquery.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
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
</style>
 <script>
 $(document).ready(function () {
		var profile = "${dto.getProfileimage()}";
		console.log("프로필사진명은 ==>"+profile);
		$("#profile-image").html("<img src='./display?fileName="+encodeURI(profile)+"'>");

 });
 </script>
 
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
$(document).ready(function () {
    // 휴가 시작일과 종료일 변경 시
    $("input[name='startdate'], input[name='enddate']").change(function () {
		// 휴가 시작일과 종료일을 가져옴
		var startdate = new Date($("input[name='startdate']").val());
		var enddate = new Date($("input[name='enddate']").val());
		
		// 휴가 타입이 "반차"일 경우
		if ($("select[name='vacationtype']").val() === "반차") {
		    // 시작일과 종료일을 같은 날짜로 설정
		    $("input[name='enddate']").val($("input[name='startdate']").val());
		
	        var vacationdays = 0.5;
	        $("input[name='vacationdays']").val(vacationdays);
		} else {
		    // 휴가 타입이 "반차"가 아닌 경우, 기존 로직 수행
		    var timeDiff = Math.abs(enddate.getTime() - startdate.getTime());
		    var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24)) + 1;
		    
		    var vacationdays = diffDays;
	        $("input[name='vacationdays']").val(vacationdays);
		}

        // 중복 체크 함수 호출
        var empno = $("#empNoDisplay").val();
        var name = $("#nameDisplay").val();
        var position = $("#positionDisplay").val();
        checkDuplicateVacation(empno, name, position, $("input[name='startdate']").val(), $("input[name='enddate']").val());
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
        var vacationtype = $("select[name='vacationtype']").val();
        var vacationdays = $("input[name='vacationdays']").val();
        var reason = $("input[name='reason']").val();

        // 클라이언트 측 유효성 검사
        if (!vacationCheck(empno, name, position, startdate, enddate, vacationtype, vacationdays, reason)) {
            return false; // 유효성 검사 실패
        }

        // 중복 체크 함수 호출
        checkDuplicateVacation(empno, name, position, startdate, enddate);
    });

    // 중복 체크를 위한 함수
    function checkDuplicateVacation(empno, name, position, startdate, enddate) {
        $.ajax({
            type: "POST",
            url: "checkDuplicateVacation",
            data: { empno: empno, startdate: startdate, enddate: enddate },
            success: function (data) {
            	var vacationdays; // vacationdays 변수 정의
            	
                if (data === "duplicate") {
                    alert("이미 해당 기간에 휴가 신청이 있습니다. 중복 휴가 신청은 불가능합니다.");
                    // 중복일 경우, 신청 버튼 비활성화 또는 다른 처리 수행
                } else {
                    // 중복이 아닐 경우, 신청 처리 함수 호출
                    submitVacationRequest(empno, name, position, startdate, enddate, $("select[name='vacationtype']").val(), vacationdays, reason);
                }
            },
            error: function () {
                alert("중복 체크 중 오류가 발생했습니다.");
            }
        });
    }

    // 신청 처리 함수
    function submitVacationRequest(empno, name, position, startdate, enddate, vacationtype, vacationdays, reason) {
        // 여기서 formData 정의 또는 data 속성 직접 사용
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

        $.ajax({
            type: "POST",
            url: "submitVacationRequest",
            data: formData,
            success: function (data) {
                // 성공 시 메시지 출력 및 페이지 이동
                alert("휴가 신청이 완료되었습니다.");
                window.location.href = "/myVacationRequests";
            },
            error: function () {
                // 오류 시 메시지 출력 또는 다른 처리 수행
                alert("휴가 신청 중 오류가 발생했습니다.");
            }
        });
    }

    // 클라이언트 측 유효성 검사 함수
    function vacationCheck(empno, name, position, startdate, enddate, vacationtype, vacationdays, reason) {
        if (!empno || !name || !position || !startdate || !enddate || !vacationtype || !vacationdays || !reason) {
            alert("필수 입력 항목을 모두 입력해주세요.");
            return false; // 유효성 검사 실패
        }

        if (new Date(startdate) < new Date()) {
            alert("휴가 시작일은 오늘 날짜보다 이후여야 합니다.");
            return false; // 유효성 검사 실패
        }

        if (new Date(startdate) > new Date(enddate)) {
            alert("휴가 시작일은 종료일보다 빠를 수 없습니다.");
            return false; // 유효성 검사 실패
        }

        var vacationdays = $("input[name='vacationdays']").val();
        if (!vacationdays || parseInt(vacationdays) <= 0) {
            alert("휴가 기간이 올바르지 않습니다.");
            return false; // 유효성 검사 실패
        }

        if (reason.trim() === "") {
            alert("휴가 사유를 입력해주세요.");
            return false; // 유효성 검사 실패
        }

        return true; // 모든 유효성 검사 통과
    }
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
			                <th>휴가 기간(일)</th>
			                <th>휴가 사유</th>
			                <th>휴가 시작일</th>
			                <th>휴가 종료일</th>
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
			                <td><input type="text" name="vacationdays" readonly></td>
			                <td><input type="text" name="reason" required></td>
			                <td><input type="date" name="startdate" required></td>
			                <td><input type="date" name="enddate" required></td>
			                <td><input type="submit" value="휴가 신청"></td>
			            </tr>
                    </tbody>
                </table>
            </form>
        	
        </div>
        
 </main>
</body>
</html>

