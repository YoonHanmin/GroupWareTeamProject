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
   

    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/login.css">
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
        <input type="text" class="form-control" placeholder="ex)20240101" aria-label="Username" aria-describedby="basic-addon1">
        <button class="btn btn-secondary col-3">인증</button>
      </div>
    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">비밀번호</span>
        <input type="text" class="form-control" placeholder="8자리" aria-label="Username" aria-describedby="basic-addon1">
        <span class="input-group-text" id="basic-addon1">비밀번호 확인</span>
        <input type="text" class="form-control" aria-label="Username" aria-describedby="basic-addon1">
    </div>

    <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">이름</span>
        <input type="text" class="form-control" aria-label="Username" aria-describedby="basic-addon1">
        <span class="input-group-text" id="basic-addon1">직위</span>
        <input type="text" class="form-control" aria-label="Username" aria-describedby="basic-addon1">
      </div>
      
      <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="E-mail ID" aria-label="Username">
        <span class="input-group-text">@</span>
        <input type="text" class="form-control" placeholder="ex)naver.com" aria-label="Server">
        <!-- <input type="submit" class="form-control" value="인증"> -->
        <button class="btn btn-secondary col-3">인증</button>
      </div>
      <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">소속 부서</span>
        <select class="form-select" aria-label="Default select example">
          <option selected>소속 부서를 선택하세요.</option>
          <option value="1">경영기획실</option>
          <option value="2">재무팀</option>
          <option value="3">인사팀</option>
          <option value="4">회계팀</option>
          <option value="5">국내영업부</option>
          <option value="6">해외영업부</option>
          <option value="7">개발1팀</option>
          <option value="8">개발2팀</option>
          <option value="9">기술개발팀</option>
        </select>
      </div>
      
      <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">휴대번호</span>
        <input type="text" class="form-control" aria-label="Username" aria-describedby="basic-addon1" maxlength="3">
        <input type="text" class="form-control" aria-label="Username" aria-describedby="basic-addon1" maxlength="4">
        <input type="text" class="form-control" aria-label="Username" aria-describedby="basic-addon1" maxlength="4">
      </div>
      <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">주소</span>
        <input type="text" class="form-control col-9" aria-label="Username" aria-describedby="basic-addon1">
        <button class="btn btn-secondary col-3">검색</button>
        </div>
        <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">상세주소</span>
        <input type="text" class="form-control" aria-label="Username" aria-describedby="basic-addon1">
      </div>
      <div class="input-group mb-3 d-flex justify-content-between" justify-content-between>
        <span><button class="btn btn-secondary ">취소</button></span>
        <span><button class="btn btn-secondary " >회원가입</button></span>
      </div>
      </div>
</body>
</html>