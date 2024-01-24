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
            const empno = $("input[name='empno']").val();
           
            $.ajax({
                type: "POST",
                url: "checkempno", // 실제 컨트롤러 매핑 경로로 변경
                data: { empno : empno },
                success: function (data) {
//                 	var dat = JSON.stingfy(data);
//                 	 var integerData = $(xml).find('Integer').text();
                	
                	
                	console.log("data===>>>"+data);
                 if(data==1){
                	 alert("인증되었습니다!");
                 }else if(data == 0){
                	 
                	 alert("존재하지않는 사번입니다.");
                 }
                 
                },
               
             });
          }); // 사번인증 ajax
          
          
          $("#emailbtn").on("click",function(){
        	  
          var first = $("input[name='emailID']").val();
          var second = $("input[name='domain']").val();
          var email = first+"@"+second;
          const empno = $("input[name='empno']").val();
          $.ajax({
              type: "POST",
              url: "checkemail", // 실제 컨트롤러 매핑 경로로 변경
              data: { email : email, empno : empno },
              success: function (data) {
//               	var dat = JSON.stingfy(data);
//               	 var integerData = $(xml).find('Integer').text();
              	
              	
              	console.log("data===>>>"+data);
               if(data==1){
              	 alert("인증되었습니다!");
               }else if(data == 0){
              	 
              	 alert("존재하지않는 이메일 입니다.");
               }
               
              },
             
           });

        	  
        	  
          });
          
          
       
          
          
       });
   </script>
      
      
      <div class="input-group mb-3">
        <input type="text" name="emailID" class="form-control" placeholder="E-mail ID" aria-label="Username">
        <span class="input-group-text">@</span>
        <input type="text" name="domain" class="form-control" placeholder="ex)naver.com" aria-label="Server">
        <!-- <input type="submit" class="form-control" value="인증"> -->
        <button id="emailbtn" class="btn btn-secondary col-3">인증</button>
      </div>

       
      <div class="input-group mb-3 d-flex justify-content-between" justify-content-between>
        <span><button class="btn btn-secondary ">취소</button></span>
        <span><button class="btn btn-secondary " >비밀번호 찾기</button></span>
      </div>
      </div>
      



</body>
</html>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
