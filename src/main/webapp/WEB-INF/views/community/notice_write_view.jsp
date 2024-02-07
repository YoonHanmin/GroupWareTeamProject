<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- 부트스트랩 CDN 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
</style>
<script type="text/javascript">
$(document).ready(function () {
	var profile = "${dto.getProfileimage()}";
	console.log("프로필사진명은 ==>"+profile);
	$("#profile-image").html("<img src='./display?fileName="+encodeURI(profile)+"'>");

});
 function fn_submit() {
        var nname = $("#nname").val();
        var ntitle = $("#ntitle").val();
        var ncontent = $("#ncontent").val();

        if (ntitle.trim() === "" || ncontent.trim() === "") {
            alert("글 제목과 내용은 필수 입력 항목입니다.");
            return;
        }
        
        $.ajax({
            type: "post",
            data: $("#frm").serialize(),
            url: "nwrite",
            success: function (data) {
                alert("등록 완료");
                location.href = "notice_list";
            },
            error: function (xhr, status, error) {
                console.error("AJAX Error:", status, error);
                alert("오류 발생");
            }
        });
    }
</script>

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
      
      </div>
      
<div>
    <h2 >글 작성</h2>
    <div >
    <form id="frm" method="post" action="nwrite" >
        <div >
            <label for="nname" >이름</label>
            <div>
                <input type="text"  name="nname" id="nname" value="${dto.name}" readonly>
            </div>
        </div>
        
        <div >
            <label for="ntitle">제목</label>
            <div>
                <input type="text"  name="ntitle" id="ntitle" placeholder="제목을 입력하세요">
            </div>
        </div>
        <div >
            <label for="ncontent" >내용</label>
            <div >
                <textarea  name="ncontent" id="ncontent" rows="5" placeholder="내용을 입력하세요"></textarea>
            </div>
        </div>
      
   
        <div >
            <div >
                <input type="button" onclick="fn_submit()"  value="등록">
                <a href="notice_list">목록보기</a>
            </div>
        </div>
    </form>

</div>
</main>
</body>
</html>
