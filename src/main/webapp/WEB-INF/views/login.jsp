<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>

    <title>Document</title>
    <link rel="stylesheet" href="resources/css/bootstrap.css">
    <link rel="stylesheet" href="resources/css/login.css">
<title>Insert title here</title>
<style>
     @import url('https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Noto+Sans+KR&display=swap');
     body {
        font-family: 'Noto Sans KR', sans-serif;
        background-image: linear-gradient(to right,#0f0c29, #434343, #363945);
    }
    #container > div{
   
     
    }
</style>
</head>
<body class="text-center">
    
    <!--  html 전체 영역을 지정하는 container -->
    <div id="container" style="">
      <!--  login 폼 영역을 : loginBox -->
     	<div style="display:flex; flex-direction: row; box-shadow : 5px 5px 20px black;">
        <div style="width:300px; height:382px; border:1px solid #eee;background-color:white; ">
        	
        	<img src="resources/images/mainlogo.JPG" style="width:270px;height:200px; margin-left: 15px; margin-top:30px; " >
        	<div style="font-size:12px;margin-top:100px;">
        		<b>관리자 문의 051)553-3330</b><br>
        		<b>시스템 문의 02)1234-1234</b>
        	</div>
        </div>
      <div id="loginBox" style=" ">
     
        <!-- 로그인 페이지 타이틀 -->
        <div id="loginBoxTitle"><a href="login"><b>AssemWork<br>업무포털 시스템</b></a></div>
        
        <!-- 아이디, 비번, 버튼 박스 -->
        <div id="inputBox">
        	<form name="loginform" action="loginYn" method="post">
          <div class="input-form-box"><span>아이디 </span><input type="text" name="empno" class="form-control"></div>
          <div class="input-form-box"><span>비밀번호 </span><input type="password" name="password" class="form-control"></div>
          <div class="button-login-box" style="margin-top:20px;" >
            <button type="button" onclick="check()" class="btn btn-outline-secondary" style="width:100%; margin-bottom: 5px;">로그인</button>
            <button type="button" onclick="location.href='findPW'" class="btn btn-outline-secondary" style="width:48%; margin-bottom: 5px;">PW찾기</button>
            <button type="button" onclick="location.href='regist'"class="btn btn-outline-secondary" style="width:48%; margin-bottom: 5px;">회원가입</button>
          </div>
          </form>
        </div>
        
      </div>
     </div>
    </div>
  </body>
</html>
<script>
function check(){
	if(document.loginform.empno.value.length==0){
		alert("ID(사번)를 입력하세요.");
		loginform.empno.focus();
		
		return;
	}
	if(document.loginform.empno.value.length!=8){
		alert("ID(사번)는 8자리 입니다.");
		loginform.empno.focus();
		
		return;
	}
	if(document.loginform.password.value.length==0){
		alert("비밀번호를 입력하세요.");
		loginform.password.focus();
		return;
	}
	document.loginform.submit();
}


</script>