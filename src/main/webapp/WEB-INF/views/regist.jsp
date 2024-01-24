<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>

    <title>Document</title>
   
 	
    <link rel="stylesheet" href="resources/js/jquery.js">
    <link rel="stylesheet" href="resources/css/bootstrap.css">
    <link rel="stylesheet" href="resources/css/login.css">
</head>
<style>
     @import url('https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Noto+Sans+KR&display=swap');
    .container{
        width: 30%;
        height: 30%;
        margin-top : 8%;
    }
    body {
        font-family: 'Noto Sans KR', sans-serif;
    }
</style>


<body>
   <div class="container">
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">사원번호</span>
        <input type="text" name="empno" class="form-control" placeholder="ex)20240101" aria-label="Username" aria-describedby="basic-addon1">
        <button id="empbtn"class="btn btn-secondary col-3">인증</button>
      </div>
      
      <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
   <script>
      $(document).ready(function () {
         $("#empbtn").on("click", function () {
            var empno = $("input[name='empno']").val();
           
            $.ajax({
                type: "POST",
                url: "checkempno", // 실제 컨트롤러 매핑 경로로 변경
                data: { empno : empno },
                success: function (data) {
//                 	var dat = JSON.stingfy(data);
//                 	 var integerData = $(xml).find('Integer').text();
                	
                	
                	console.log("data===>>>"+data);
                 if(data==1){
                	 alert("중복된 아이디");
                 }else if(data == 0){
                	 
                	 alert("사용가능한 아이디");
                 }
                 
                },
               
             });
          });
       });
   </script>
      
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">비밀번호</span>
        <input type="text" class="form-control" placeholder="8자리" aria-label="Username" aria-describedby="basic-addon1">
        <span class="input-group-text" id="basic-addon1">비밀번호 확인</span>
        <input type="text" class="form-control" aria-label="Username" aria-describedby="basic-addon1">
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">이름</span>
        <input type="text" class="form-control" aria-label="Username" aria-describedby="basic-addon1">
        
      </div>
      
      <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="E-mail ID" aria-label="Username">
        <span class="input-group-text">@</span>
        <input type="text" class="form-control" placeholder="ex)naver.com" aria-label="Server">
        <!-- <input type="submit" class="form-control" value="인증"> -->
        <button class="btn btn-secondary col-3">인증</button>
      </div>
<!--       <div class="input-group mb-3"> -->
<!--         <span class="input-group-text" id="basic-addon1">소속 부서</span> -->
<!--         <select class="form-select" aria-label="Default select example"> -->
<!--           <option selected>소속 부서를 선택하세요.</option> -->
<!--           <option value="1">경영기획실</option> -->
<!--           <option value="2">재무팀</option> -->
<!--           <option value="3">인사팀</option> -->
<!--           <option value="4">회계팀</option> -->
<!--           <option value="5">국내영업부</option> -->
<!--           <option value="6">해외영업부</option> -->
<!--           <option value="7">개발1팀</option> -->
<!--           <option value="8">개발2팀</option> -->
<!--           <option value="9">기술개발팀</option> -->
<!--         </select> -->
<!--       </div> -->
      
      <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">휴대번호</span>
        <input type="text" class="form-control" aria-label="Username" aria-describedby="basic-addon1" maxlength="3">
        <input type="text" class="form-control" aria-label="Username" aria-describedby="basic-addon1" maxlength="4">
        <input type="text" class="form-control" aria-label="Username" aria-describedby="basic-addon1" maxlength="4">
      </div>
      <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">주소</span>
        <input type="text" id="sample6_postcode"  placeholder="우편번호">
        <input type="button" class="btn btn-secondary" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
      </div>
        <div>
        <input type="text" id="sample6_address"class="form-control " aria-label="Username" aria-describedby="basic-addon1" placeholder="주소" style="margin-bottom: 5px;">
        <input type="text" id="sample6_detailAddress"class="form-control " aria-label="Username" aria-describedby="basic-addon1" placeholder="상세주소" style="margin-bottom: 5px;">
        </div>
       
      <div class="input-group mb-3 d-flex justify-content-between" justify-content-between>
        <span><button class="btn btn-secondary ">취소</button></span>
        <span><button class="btn btn-secondary " >회원가입</button></span>
      </div>
      </div>
      



</body>
</html>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    // document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }


</script>