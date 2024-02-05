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
    .correct {
	    color: blue; /* 일치 or 유효할 경우 파란색으로 표시 */
	}
	.incorrect {
	    color: red; /* 일치 or 유효하지 않을 경우 빨간색으로 표시 */
	}
</style>

<body>
   <div class="container">
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">사원번호</span>
        <input type="text" id="empno" name="empno" class="form-control" placeholder="ex)20240101" aria-label="Username" aria-describedby="basic-addon1">
        <button id="empbtn"class="btn btn-secondary col-3">인증</button>
        <span id="empValidationMessage"></span>
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
	                	console.log("data===>>>"+data);
	                	
                	var messageContainer = $("#empValidationMessage");
	                	
	                 if(data==1){
// 	                	 alert("no");
	                     messageContainer.html("중복된 사원번호입니다.");
	                     messageContainer.attr("class", "incorrect");
	                 }else if(data == 0){
// 	                	 alert("ok");
	                     messageContainer.html("사용 가능한 사원번호입니다.");
	                     messageContainer.attr("class", "correct");
	                 }
                },
             });
          });
       });
</script>
      
    <div class="input-group mb-3">
    <span class="input-group-text" id="basic-addon1">비밀번호</span>
	    <input type="password" class="form-control" id="password" placeholder="8자리" aria-label="Password" aria-describedby="basic-addon1">
	    <span class="input-group-text" id="basic-addon1">비밀번호 확인</span>
	    <input type="password" class="form-control" id="password-confirm"  aria-label="Confirm Password" aria-describedby="basic-addon1">
<%-- 	    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />  --%>
	    <span id="password-check-result"></span>
    </div>

<script type="text/javascript">
	var passwordValid = false;   // 비밀번호 유효성 검사 결과 변수

    /* 비밀번호 일치 여부 확인 */
    $("#password-confirm").blur(function () {
        var password = $("#password").val();             		         // 비밀번호
        var confirmPassword = $(this).val();                   			 // 비밀번호 확인
        var passwordCheckResult = $("#password-check-result");  // 비밀번호 확인 결과 표시

        if (password === confirmPassword) {
            if (password.length >= 8) {
                // 비밀번호가 일치하고 8자리 이상인 경우
                passwordCheckResult.html("비밀번호가 일치합니다.");
                passwordCheckResult.attr("class", "correct");
                passwordValid = true;
            } else {
                // 비밀번호가 일치하지만 8자리 미만인 경우
                passwordCheckResult.html("비밀번호는 8자리 이상이어야 합니다.");
                passwordCheckResult.attr("class", "incorrect");
                passwordValid = false;
            }
        } else {
            // 비밀번호가 일치하지 않는 경우
            passwordCheckResult.html("비밀번호가 일치하지 않습니다.");
            passwordCheckResult.attr("class", "incorrect");
            passwordValid = false;
        }
    });
</script>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">이름</span>
        <input type="text" id="name" class="form-control" aria-label="Username" aria-describedby="basic-addon1">
	    <span id="nameValidationMessage"></span>
    </div>

<script type="text/javascript">
	var nameValid = false; // 이름 유효성 검사 결과 변수
	
	function validateName() {
	    var name = $("#name").val();
	
	    if (name.length === 0) {
	        $("#nameValidationMessage").text("이름을 입력해주세요.");
	        $("#nameValidationMessage").attr("class", "incorrect");
	        nameValid = false;
	    } else if (name.length < 2 || name.length > 30) {
	        $("#nameValidationMessage").text("이름은 2자에서 30자 사이어야 합니다.");
	        $("#nameValidationMessage").attr("class", "incorrect");
	        nameValid = false;
	    } else if (!/^[a-zA-Z가-힣\-']*$/g.test(name)) {
	        $("#nameValidationMessage").text("올바른 형식의 이름을 입력해주세요.");
	        $("#nameValidationMessage").attr("class", "incorrect");
	        nameValid = false;
	    } else {
	        $("#nameValidationMessage").text("");
	        $("#nameValidationMessage").attr("class", "correct");
	        nameValid = true;
	    }
	}
	
	$("#name").blur(function() {
	    validateName();
	});
</script>
   
    <div class="input-group mb-3">
	    <input type="text" id="firstEmail" class="form-control" placeholder="E-mail ID" aria-label="Username">
	    <span class="input-group-text">@</span>
		<input type="text" id="secondEmail" class="form-control" placeholder="ex) naver.com" aria-label="Server">
    		<select class="form-select" id="domainOptions">
		        <option value="" selected>직접입력</option>
		        <option value="naver.com">naver.com</option>
		        <option value="gmail.com">gmail.com</option>
		        <option value="daum.net">daum.net</option>
		        <option value="hanmail.net">hanmail.net</option>
		        <option value="nate.com">nate.com</option>
		        <option value="yahoo.com">yahoo.com</option>
		        <option value="outlook.com">outlook.com</option>
		        <option value="outlook.kr">outlook.kr</option>
		        <option value="hotmail.com">hotmail.com</option>
    		</select>
	    <button class="btn btn-secondary col-3 mail_check_button">인증</button>
	    <span id="emailValidationMessage"></span>
	 </div>
	 
 	<div class="input-group mb-3 mail_check_input_box" style="display: none;" id="mail_check_input_box_false">
	    <input type="text" class="form-control mail_check_input" placeholder="인증번호 입력" aria-label="Verification Code">
	    <span id="mail_check_input_box_warn"></span>
	</div>
	
<script type="text/javascript">
	var code = "";
	var mailnumCheck = false;   // 회원가입할 때 인증여부 유효성체크
	var emailValid = false;     // 이메일 유효성 검사 결과
	
	/* 이메일 유효성 검사 */
	function validateEmail(email) {
	    // 특정 문자를 필터링하여 유효성 검사
	    var re = /^[a-zA-Z0-9!#$%&'*+\-/=?^_`{|}~]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	    return re.test(email);
	}
	
	/* 인증번호 이메일 전송 및 유효성 검사 */
	$(".mail_check_button").click(function () {
	    var first = document.getElementById("firstEmail").value; // 회원이 입력한 이메일
	    var second = $("#domainOptions").val(); // 선택한 도메인
	
	    // 선택한 도메인이 있다면 해당 도메인을 입력창에 자동으로 설정하고 표시
	    if (second) {
	        document.getElementById("secondEmail").value = second;
	        $("#selectedDomain").text("@" + second);
	    } else {
	        $("#selectedDomain").text(""); // 선택한 도메인이 없는 경우 표시 지우기
	    }
	
	    var fullAddr = first + "@" + document.getElementById("secondEmail").value;
	
	    // 이메일 유효성 검사
	    if (validateEmail(fullAddr)) {
	        console.log(fullAddr);
	
	        // 이메일 주소를 인코딩
	        var encodedEmail = encodeURIComponent(fullAddr);
	
	        jQuery.ajax({
	            type: "GET",
	            url: "mailCheck?email=" + encodedEmail,
	            success: function (data) {
	                code = data;
	                // 인증번호를 성공적으로 받으면 입력란 활성화
	                $(".mail_check_input").attr("disabled", false);
	                emailValid = true;
	                $("#emailValidationMessage").text("유효한 이메일 주소입니다."); // 유효성 검사 메시지 출력
	                $("#emailValidationMessage").attr("class", "correct"); // 메시지 스타일 지정
	                $(".validation_message").text(""); // 기존 메시지 초기화

	                // 인증번호 입력 창 표시
	                $(".mail_check_input_box").show();
	            },
	            error: function (xhr, status, error) {
	                console.error(xhr.responseText);
	                // 서버에서 오류 응답이 왔을 때 메시지 표시
	                $("#emailValidationMessage").text("서버 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
	                $("#emailValidationMessage").attr("class", "incorrect");
	                emailValid = false;
	            }
	        });
	    } else {
	        // 이메일이 유효하지 않은 경우
	        $("#emailValidationMessage").text("유효한 이메일 주소를 입력해주세요.");
	        $("#emailValidationMessage").attr("class", "incorrect");
	        emailValid = false;

	        // 유효하지 않은 이메일을 입력하면 인증번호 입력 창 감춤
	        $(".mail_check_input_box").hide();
	    }
	});

	
	/* 이메일 입력란 값이 변경될 때 메시지 초기화 및 인증번호 입력 창 감춤 */
	$("#firstEmail, #secondEmail, #domainOptions").change(function () {
	    $("#emailValidationMessage").text("");
	    $(".mail_check_input_box").hide();
	});
	
	/* 인증번호 비교 및 유효성 검사 메시지 출력 */
	$(".mail_check_input").blur(function () {
	    if (emailValid) {  // 유효한 이메일인 경우에만 인증번호 비교 수행
	        var inputCode = $(".mail_check_input").val();        // 입력코드
	        var checkResult = $("#mail_check_input_box_warn");    // 비교 결과
	
	        if (inputCode === code) {                            // 일치할 경우
	            checkResult.html("인증번호가 일치합니다.");
	            checkResult.attr("class", "correct");
	            mailnumCheck = true;
	        } else {                                            // 일치하지 않을 경우
	            checkResult.html("인증번호를 다시 확인해주세요.");
	            checkResult.attr("class", "incorrect");
	            mailnumCheck = false;
	        }
	    }
	});
    
	/* 도메인 옵션 선택 시 자동으로 입력창에 설정 */
	$("#domainOptions").change(function () {
	    var selectedDomain = $(this).val();
	    if (selectedDomain) {
	        $("#selectedDomain").text("@" + selectedDomain);
	        document.getElementById("secondEmail").value = selectedDomain;
	    } else {
	        $("#selectedDomain").text("");
	        document.getElementById("secondEmail").value = "";
	    }
	});  
</script>
      
      <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">휴대폰 번호</span>
        <input type="text" id="phone1" class="form-control" aria-label="Username" aria-describedby="basic-addon1" value="010" readonly>
        <input type="text" id="phone2" class="form-control" aria-label="Username" aria-describedby="basic-addon1" maxlength="4">
        <input type="text" id="phone3" class="form-control" aria-label="Username" aria-describedby="basic-addon1" maxlength="4">
      <span id="phoneValidationMessage"></span>
      </div>  

<script type="text/javascript">
	var phoneValid = false; // 휴대폰 번호 유효성 검사 결과 변수

    /* 휴대폰번호 유효성 검사 */
	function validatePhone() {
	    var phone1 = $("#phone1").val(); // 휴대폰번호 첫 번째 입력란
	    var phone2 = $("#phone2").val(); // 휴대폰번호 두 번째 입력란
	    var phone3 = $("#phone3").val(); // 휴대폰번호 세 번째 입력란
	
	    // 첫 번째 칸은 010으로 고정되어 있으므로 유효성 검사에서 제외
	    // 두 번째 칸, 세 번째 칸은 반드시 4자리여야 함
	    if (phone2.length === 4 && phone3.length === 4) {
	        phoneValid = true;
	        $("#phoneValidationMessage").text(""); // 유효성 검사 메시지 초기화
	        $("#phoneValidationMessage").attr("class", "correct");
	    } else {
	        $("#phoneValidationMessage").text("유효한 휴대폰 번호를 입력해주세요.");
	        phoneValid = false;
	        $("#phoneValidationMessage").attr("class", "incorrect");
	    }
	}
	
	$("#phone2, #phone3").blur(function() {
	    validatePhone();
	});
</script>

	  <div class="input-group mb-3">
	        <span class="input-group-text" id="basic-addon1">주소</span>
	        <input type="text" id="postcode"  placeholder="우편번호">
	        <input type="button" class="btn btn-secondary" onclick="execDaumPostcode()" value="우편번호 찾기">
      </div>
      <div>
        	<input type="text" id="address"class="form-control " aria-label="Username" aria-describedby="basic-addon1" placeholder="주소" style="margin-bottom: 5px;">
      		<input type="text" id="detailAddress"class="form-control " aria-label="Username" aria-describedby="basic-addon1" placeholder="상세주소" style="margin-bottom: 5px;">
      		<span id="addressValidationMessage"></span>
      </div>
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execDaumPostcode() {
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
	                    // document.getElementById("extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detailAddress").focus();
	            }
	        }).open();
	    }
    
    // 주소 및 우편번호 유효성 검사 함수
    function validateAddress() {
        var address = $("#address").val();
        var detailAddress = $("#detailAddress").val();
        var postcode = $("#postcode").val();

        // 주소, 상세주소, 우편번호가 모두 입력되었는지 확인
        if (address.length > 0 && detailAddress.length > 0 && postcode.length > 0) {
            $("#addressValidationMessage").text(""); // 유효성 검사 메시지 초기화
            $("#addressValidationMessage").attr("class", "correct");
            return true; // 유효성 검사 통과
        } else {
            $("#addressValidationMessage").text("주소와 상세주소, 우편번호를 모두 입력해주세요.");
            $("#addressValidationMessage").attr("class", "incorrect");
            return false; // 유효성 검사 실패
        }
    }

    // 주소 및 우편번호 입력란 값이 변경될 때 메시지 초기화
    $("#address, #detailAddress, #postcode").blur(function () {
        validateAddress();
    });
</script>
 
      <div class="input-group mb-3 d-flex justify-content-between">
       	<span>
      		  <a href="login" class="btn btn-secondary">취소</a>
  		</span>
   		<span>
      		  <button class="btn btn-secondary" onclick="submitRegistration()">회원가입</button>
    	</span>
	</div>

<script type="text/javascript">
    /* 회원가입 버튼 클릭 시 동작하는 함수 */
        function submitRegistration() {
            // 각 항목별로 유효성 검사 수행
            validateName();
            validatePhone();
            validateAddress();
            // 사원번호 유효성 검사 메시지를 가져와서 확인
            var empValidationMessage = $("#empValidationMessage").html();

            // 각 항목별로 유효성 검사 메시지 출력
            $("#nameValidationMessage").html("");
            $("#phoneValidationMessage").html("");
            $("#emailValidationMessage").html("");
            $("#password-check-result").html("");
            $("#empValidationMessage").html("");

            // 모든 유효성 검사 및 인증이 완료된 경우에만 회원가입 성공
            if (passwordValid && nameValid && emailValid && phoneValid && mailnumCheck && empValidationMessage.includes("사용 가능한") && validateAddress()) {
                // 필요한 정보를 조합하여 데이터베이스에 전송하는 AJAX 요청
                var formData = {
                    empno: $("#empno").val(),
                    name: $("#name").val(),
                    password: $("#password").val(),
                    email: $("#firstEmail").val() + "@" + $("#secondEmail").val(),
                    tel: $("#phone1").val() + $("#phone2").val() + $("#phone3").val(),
                    address: $("#address").val() + " " + $("#detailAddress").val(),
                };
                // 회원가입 데이터를 서버로 전송하는 Ajax 호출
                $.ajax({
                    type: "POST",
                    url: "signUp",
                    data: formData,
                    success: function (data) {
                        alert("회원가입이 완료되었습니다.");
                        window.location.href = "login";
                    },
                    error: function (xhr, status, error) {
                        console.error(xhr.responseText);
                        alert("회원가입 중 오류가 발생했습니다. 다시 시도해주세요.");
                    },
                });
        } else {
            // 실패한 항목을 다시 확인하도록 메시지 출력
            if (!empValidationMessage.includes("사용 가능한")) {
                // 추가: 사원번호 인증 여부 확인
                $("#empValidationMessage").html("사원번호를 다시 확인해주세요.");
            }
            if (!passwordValid) {
                $("#password-check-result").html("비밀번호를 다시 확인해주세요.");
            }
            if (!nameValid) {
                $("#nameValidationMessage").html("이름을 다시 확인해주세요.");
            }
            if (!emailValid) {
                $("#emailValidationMessage").html("이메일을 다시 확인해주세요.");
            }
            if (!mailnumCheck) {
            	checkResult.text("인증번호를 다시 확인해주세요.");
            }
            if (!phoneValid) {
                $("#phoneValidationMessage").html("휴대폰 번호를 다시 확인해주세요.");
            }
            if (!validateAddress()) {
                $("#addressValidationMessage").html("주소를 다시 확인해주세요.");
            }
            alert("입력된 정보를 다시 확인해주세요.");
        }
    }
</script>

</body>
</html>

