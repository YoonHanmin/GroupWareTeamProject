<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 작성</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(document).ready(function() {
    // 댓글 작성
    $("#writeBtn").click(function() {
        var data = {
            pid: $("#pid").val(),
            prwriter: $("#prwriter").val(),
            prcontent: $("#prcontent").val()
        };
    
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/preply/prwrite",
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            success: function() {
                alert("댓글이 작성되었습니다.");
                // 댓글 작성 후 페이지를 새로고침하거나 댓글 목록 페이지로 이동
                location.reload();
            },
            error: function(request, status, error) {
                alert("댓글 작성에 실패했습니다.");
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    });
});
</script>
</head>
<body>
    <h3>댓글 작성</h3>
    
    <div id="replyWrite">
        <input type="hidden" id="pid" value="${pid}" />
        <input type="text" id="prwriter" placeholder="작성자" />
        <input type="text" id="prcontent" placeholder="댓글 내용" />
        <button id="writeBtn">작성</button>
    </div>
</body>
</html>
