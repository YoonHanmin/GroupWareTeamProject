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
</head>
<body>
<div>
    <h2>공지 내용 보기</h2>
    <form method="post" action="nmodify" >
<%--         <input type="hidden" name="bid" value="${content_view.bid}"> --%>
        	<input type="hidden" name="npageNum" value="${pageMaker.npageNum}">
			<input type="hidden" name="namount" value="${pageMaker.namount}">
			<input type="hidden" name="nid" value="${pageMaker.nid}">
        <table style="max-width: 500px;">    
            <body>
                <tr>
                    <th scope="row">번호</th>
                    <td>${notice_content_view.nid}</td>
                </tr>
                <tr>
                    <th scope="row">조회수</th>
                    <td>${notice_content_view.nhit}</td>
                </tr>
                <tr>
                    <th scope="row">작성자</th>
                    <td>
                        <input type="text"  name="nname" value="${notice_content_view.nname}">
                    </td>
                </tr>
                <tr>
                    <th scope="row">제목</th>
                    <td>
                        <input type="text" name="ntitle" value="${notice_content_view.ntitle}">
                    </td>
                </tr>      
                <tr>
                    <th scope="row">내용</th>
                    <td>
                        <textarea  name="ncontent">${notice_content_view.ncontent}</textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                       			 <input type="submit" value="수정" onclick="return confirm('수정하시겠습니까?');">
                       			 &nbsp;&nbsp;<input  type="submit" value="목록보기" formaction="notice_list">
                        		&nbsp;&nbsp;<input type="submit" value="삭제" formaction="ndelete" onclick="return confirm('삭제하시겠습니까?');">
                    </td>
                </tr>
            </body>
        </table>
    </form>
</div>
</body>
</html>

