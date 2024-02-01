<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 목록</title>
</head>
<body>
    <c:forEach var="reply" items="${prlist}">
        작성자: <c:out value="${reply.prwriter}" /><br>
        내용: <c:out value="${reply.prcontent}" /><br>
        작성일: <c:out value="${reply.pregdate}" /><br>
        <hr>
    </c:forEach>
</body>
</html>
