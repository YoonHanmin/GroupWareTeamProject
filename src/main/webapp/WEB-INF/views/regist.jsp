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
	  
    .input-group-spacing {
        margin-bottom: 5rem; /* 조정할 간격 크기 */
    }  
</style>
<body>
   <div class="container">
    <div class="input-group mb-3">
<!--         <span class="input-group-text" id="basic-addon1">사원번호</span> -->
<!--         <input type="text" class="form-control" placeholder="ex)20240101" aria-label="Username" aria-describedby="basic-addon1"> -->
<!--         <button class="btn btn-secondary col-3">인증</button> -->
            <span class="input-group-text" id="basic-addon1">사원번호</span>
            <input type="text" name="empno"id="employeeNumber" class="form-control" placeholder="ex)20240101" aria-label="Username" aria-describedby="basic-addon1">
            <button class="btn btn-secondary col-3" onclick="authenticateEmployee()">인증</button>
      </div>

    <div class="input-group mb-3">
    <span class="input-group-text" id="basic-addon1">비밀번호</span>
	    <input type="password" class="form-control" id="password" placeholder="8자리" aria-label="Password" aria-describedby="basic-addon1">
	    <span class="input-group-text" id="basic-addon1">비밀번호 확인</span>
	    <input type="password" class="form-control" id="password-confirm"  aria-label="Confirm Password" aria-describedby="basic-addon1">
	    <span id="password-check-result"></span>
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">이름</span>
        <input type="text" id="nameInput" class="form-control" aria-label="Username" aria-describedby="basic-addon1">
	    <span id="nameValidationMessage"></span>
    </div>
      
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
	
<!-- 	<div class="input-group-spacing"></div> -->
 
      <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">휴대폰 번호</span>
        <input type="text" id="phone1" class="form-control" aria-label="Username" aria-describedby="basic-addon1" value="010" readonly>
        <input type="text" id="phone2" class="form-control" aria-label="Username" aria-describedby="basic-addon1" maxlength="4">
        <input type="text" id="phone3" class="form-control" aria-label="Username" aria-describedby="basic-addon1" maxlength="4">
      <span id="phoneValidationMessage"></span>
      </div>  
       
    <div class="input-group mb-3 d-flex justify-content-between">
       	<span>
      		  <a href="login" class="btn btn-secondary">취소</a>
  		</span>
   		<span>
      		  <button class="btn btn-secondary" onclick="submitRegistration()">회원가입</button>
    	</span>
	</div>
      
</body>
</html>

<!-- JavaScript 코드 -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script type="text/javascript">
        // 사원번호 인증을 위한 함수
	function authenticateEmployee() {
	    var employeeNumber = $("#employeeNumber").val();
		console.log(employeeNumber);
	    $.ajax({
	        type: "POST",
	        url: "employeeAuthentication",
	        data: { empno: employeeNumber },
	        dataType: "JSON", // 반환되는 데이터의 형식을 명시
	        success: function (data) {
	        	console.log(data);
	            if (data === "success") {
	                alert("사원번호 인증이 완료되었습니다.");
	            } else {
	                alert("사원번호 인증에 실패하였습니다. 올바른 사원번호를 입력해주세요.");
	            }
	        },
	        error: function (xhr, status, error) {
	            console.error(xhr.responseText);
	            alert("서버 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.");
	        }
	    });
	}
</script>

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


<script type="text/javascript">
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
    
    /*
    $("#password-confirm").blur(function () {
        var password = $("#password").val();                         // 비밀번호
        var confirmPassword = $(this).val();                         // 비밀번호 확인
        var passwordCheckResult = $("#password-check-result");       // 비밀번호 확인 결과 표시

        // 비밀번호가 일치하는지 확인
        if (password === confirmPassword) {
            // 비밀번호가 8자 이상이고, 영문 대문자, 소문자, 숫자, 특수문자 중 3종류 이상을 포함하는지 확인
            if (password.length >= 8 && /[a-z]/.test(password) && /[A-Z]/.test(password) && /\d/.test(password) && /[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]/.test(password)) {
                passwordCheckResult.html("비밀번호가 일치하며 유효합니다.");
                passwordCheckResult.attr("class", "correct");
                passwordValid = true;
            } else {
                passwordCheckResult.html("비밀번호는 8자 이상이어야 하며, 영문 대문자, 소문자, 숫자, 특수문자 중 3종류 이상을 포함해야 합니다.");
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
    */
    
</script>

<script type="text/javascript">

	function validateName() {
	    var name = $("#nameInput").val();
	
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
	
	$("#nameInput").blur(function() {
	    validateName();
	});
</script>

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

<script type="text/javascript">
    /* 회원가입 버튼 클릭 시 동작하는 함수 */
    function submitRegistration() {
            // 메일 인증이 완료되고 비밀번호가 유효한 경우에만 회원가입 처리
        if (mailnumCheck && passwordValid) {
            // 가입이 완료되면 registOk.jsp로 이동
            window.location.href = "registOk";
        } else {
            alert("메일 인증 및 비밀번호 확인을 확인해주세요.");
        }
    }
</script>
