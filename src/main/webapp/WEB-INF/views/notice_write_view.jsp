<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- 부트스트랩 CDN 추가 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
 function fn_submit() {
        // 사용자가 입력한 값들 가져오기
        var nname = $("#nname").val();
        var ntitle = $("#ntitle").val();
        var ncontent = $("#ncontent").val();

        // 필수 입력 검사
        if (ntitle.trim() === "" || bcontent.trim() === "") {
            alert("글 제목과 내용은 필수 입력 항목입니다.");
            return;
        }
        
        // Ajax로 서버에 전송
        $.ajax({
            type: "post",
            data: $("#frm").serialize(),  // form 데이터를 직렬화하여 전송
            url: "write",
            success: function (data) {
                alert("등록 완료");
                location.href = "notice_list";
            },
            error: function () {
                alert("오류 발생");
            }
        });
    }
</script>

</head>
<body>
<div>
    <h2 >글 작성</h2>
    <div >
    <form id="frm" method="post" action="nwrite" >
        <div >
            <label for="bname" >이름</label>
            <div>
                <input type="text"  name="nname" id="nname" placeholder="이름을 입력하세요">
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
</body>
</html>
