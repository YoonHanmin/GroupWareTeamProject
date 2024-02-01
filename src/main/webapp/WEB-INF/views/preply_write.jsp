<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 작성</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/preply/prwrite" method="post">
        작성자: <input type="text" name="prwriter"><br>
        내용: <input type="text" name="prcontent"><br>
        <input type="hidden" name="pid" value="${pid}">
        <input type="submit" value="댓글 작성">
    </form>
</body>
</html>
