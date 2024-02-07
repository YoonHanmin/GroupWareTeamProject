<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
      <script src="resources/js/jquery.js"></script>
<head>
 <script>
 $(document).ready(function () {
		var profile = "${dto.getProfileimage()}";
		console.log("프로필사진명은 ==>"+profile);
		$("#profile-image").html("<img src='./display?fileName="+encodeURI(profile)+"'>");

 });
 
 
 </script>
    <meta charset="UTF-8">
    <title>공지사항 상세보기</title>
    <script src="resources/js/jquery.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
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
        body {
            background-color: #f8f9fa; /* Bootstrap 기본 배경색 */
        }
        .container {
            background-color: #d4edda; /* 초록색 톤 */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        .container h2 {
            color: #155724; /* 어두운 초록색 톤 */
        }
        .table-bordered {
            border-color: #c3e6cb; /* 연한 초록색 톤 */
            width : 500px;
        }
        .btn-primary {
            background-color: #218838; /* 주황색 톤 */
            border-color: #1e7e34;
        }
        .btn-primary:hover {
            background-color: #1e7e34;
            border-color: #1c7430;
        }
    </style>
</head>
<body>
 <jsp:include page="../nav2.jsp"/>
 <main>
 	<div class="header">
      	<ul class="nav nav-underline">
  <li class="item">
    <a class="people" aria-current="page" href="#" style="color:#386FA4;"><i class="bi bi-people-fill" style="color:#386FA4;"></i>내 사원정보</a>
  </li>
  <li class="item">
    <a class="company" href="#" style="color:#386FA4;"><i class="bi bi-list-ul" style="color:#386FA4;"></i>비밀번호 변경</a>
  </li>
</ul>      	
      </div>
      <div class="info">
      <h1>공지사항</h1>
      </div>
      
    <div class="container">
        <h2 class="mb-4">공지사항 상세보기</h2>
        
                <form method="post" action="nmodify">
            <input type="hidden" name="nid" value="${ncontentView.nid}">
            <input type="hidden" name="npageNum" value="${pageMaker.npageNum}">
            <input type="hidden" name="namount" value="${pageMaker.namount}">
            <input type="hidden" name="nid" value="${pageMaker.nid}">
            <table width="500px" class="table table-bordered" style="max-width: 500px;">
                <tr>
                    <th scope="row">번호</th>
                    <td>${ncontentView.nid}</td>
                    <th scope="row">조회수</th>
                    <td>${ncontentView.nhit}</td>
                </tr>
                
                <tr>
                    <th scope="row">작성자</th>
                    <td  colspan="3">
                        <input type="text" class="form-control" name="nname" value="${ncontentView.nname}" readonly>
                    </td>
                </tr>
                <tr>
                    <th scope="row">제목</th>
                    <td colspan="3">
                        <input type="text" class="form-control" name="ntitle" value="${ncontentView.ntitle}">
                    </td>
                </tr>
                <tr>
                    <th scope="row">내용</th>
                    <td  colspan="3">
                        <textarea class="form-control" name="ncontent" cols="10" rows="10">${ncontentView.ncontent}</textarea>
                    </td>
                </tr>
                <tr>
                    <td  colspan="4">
                        <input type="submit" class="btn btn-primary" value="수정" onclick="return confirm('수정하시겠습니까?');">
                        &nbsp;&nbsp;<input type="submit" value="목록보기" formaction="notice_list">
                        &nbsp;&nbsp;<input type="submit" value="삭제" formaction="ndelete" onclick="return confirm('삭제하시겠습니까?');">
                    </td>
                </tr>
            </table>
        </form>
    </div>
    </main>
</body>
</html>
