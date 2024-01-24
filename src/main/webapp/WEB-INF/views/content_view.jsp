<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="resources/js/jquery.js"></script>
<script>
function showImage(fileCallPath){

	console.log("##@#@# fileCallpath : "+fileCallPath);
//		profile-img 클래스의 div의 html요소에 컨트롤러 메소드 호출하여 원본 이미지 파일을 출력하는 img태그를 삽입한다. 
	$(".profile-img").html("<img src='./display?fileName="+encodeURI(fileCallPath)+".jpg'>")
	
}
</script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">글 내용 보기</h2>
    <form method="post" action="modify" >
<%--         <input type="hidden" name="bid" value="${content_view.bid}"> --%>
        	<input type="hidden" name="pageNum" value="${pageMaker.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.amount}">
			<input type="hidden" name="bid" value="${pageMaker.bid}">
        <table class="table table-bordered" style="max-width: 500px;">    
            <body>
                <tr>
                    <th scope="row">번호</th>
                    <td>${content_view.bid}</td>
                </tr>
                <tr>
                    <th scope="row">조회수</th>
                    <td>${content_view.bhit}</td>
                </tr>
                <tr>
                    <th scope="row">작성자</th>
                    <td>
                        <input type="text" class="form-control" name="bname" value="${content_view.bname}">
                    </td>
                </tr>
                <tr>
                    <th scope="row">제목</th>
                    <td>
                        <input type="text" class="form-control" name="btitle" value="${content_view.btitle}">
                    </td>
                </tr>      
                <tr>
                    <th scope="row">내용</th>
                    <td>
                        <textarea class="form-control" name="bcontent">${content_view.bcontent}</textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                       			 <input type="submit" class="btn btn-primary" value="수정" onclick="return confirm('수정하시겠습니까?');">
<!--                         <a href="free_board_list" class="btn btn-secondary">목록보기</a> -->
                       			 &nbsp;&nbsp;<input  type="submit" value="목록보기" formaction="free_board_list">
                        		<!-- 삭제 버튼 -->
<%-- 								<a href="delete?bid=${content_view.bid}" class="btn btn-danger" onclick="return confirm('삭제하시겠습니까?');">삭제</a> --%>
                        		&nbsp;&nbsp;<input type="submit" value="삭제" formaction="delete" onclick="return confirm('삭제하시겠습니까?');">
                    </td>
                </tr>
            </body>
        </table>
    </form>
</div>

<!-- 부트스트랩 JS 및 Popper.js CDN 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.8/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

