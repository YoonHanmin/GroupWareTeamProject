<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">글 내용 보기</h2>
    <form method="post" action="modify" >
        <input type="hidden" name="bid" value="${content_view.bid}">
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
<!--                         <input type="submit" class="btn btn-primary" value="수정"> -->
                        <input type="submit" class="btn btn-primary" value="수정" onclick="return confirm('수정하시겠습니까?');">
                        <a href="free_board_list" class="btn btn-secondary">목록보기</a>
                        <!-- 삭제 버튼 -->
<a href="delete?bid=${content_view.bid}" class="btn btn-danger" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
                        
<%--                         <a href="delete?bid=${content_view.bid}" class="btn btn-danger">삭제</a> --%>
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
<!-- 	<table width="500" border="1"> -->
<!-- 		<form  method="post" action="modify"> -->
<%-- 			<input type="hidden" name="bid" value="${content_view.bid}"> --%>
<!-- 			<tr> -->
<!-- 				<td>번호</td> -->
<!-- 				<td> -->
<%-- 					${content_view.bid} --%>
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>히트</td> -->
<!-- 				<td> -->
<%-- 					${content_view.bhit} --%>
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>사원번호</td> -->
<!-- 				<td> -->
<%-- 					${content_view.empno} --%>
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>이름</td> -->
<!-- 				<td> -->
<%-- 					<input type="text" name="bname" value="${content_view.bname}"> --%>
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>제목</td> -->
<!-- 				<td> -->
<%-- 					<input type="text" name="btitle" value="${content_view.btitle}"> --%>
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>사원번호</td> -->
<!-- 				<td> -->
<%-- 					<input type="text" name="empno" value="${content_view.empno}"> --%>
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>내용</td> -->
<!-- 				<td> -->
<%-- 					<input type="text" name="bcontent" value="${content_view.bcontent}"> --%>
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td colspan="2"> -->
<!-- 					<input type="submit" value="수정"> -->
<!-- 					&nbsp;&nbsp;<a href="free_board_list">목록보기</a> -->
<%-- 					&nbsp;&nbsp;<a href="delete?bid=${content_view.bid}">삭제</a> --%>
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 		</form> -->
<!-- 	</table> -->
</body>
</html>

