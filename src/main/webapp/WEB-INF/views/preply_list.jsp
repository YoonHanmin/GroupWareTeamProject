<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 기능</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
 // 댓글 수정
    $(document).on("click", ".modifyBtn", function() {
        var prid = $(this).data("prid");
        var pid = $("#pid").val();
        var prcontent = $("#content" + prid).val();
        
        var data = {
            prid: prid,
            pid: pid,
            prcontent: prcontent
        };
        
        $.ajax({
            type: "PUT",
            url: "${pageContext.request.contextPath}/preply/prmodify",
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            success: function() {
                alert("댓글이 수정되었습니다.");
                $("#content" + prid).val(prcontent);
            },
            error: function(request, status, error) {
                alert("댓글 수정에 실패했습니다.");
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    });

    // 댓글 삭제
    $(document).on("click", ".deleteBtn", function() {
        var prid = $(this).data("prid");
        var pid = $("#pid").val();
        
        var data = {
            prid: prid,
            pid: pid
        };
        
        $.ajax({
            type: "DELETE",
            url: "${pageContext.request.contextPath}/preply/prdelete",
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            success: function() {
                alert("댓글이 삭제되었습니다.");
                $("#reply" + prid).remove();
            },
            error: function(request, status, error) {
                alert("댓글 삭제에 실패했습니다.");
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    });
});
</script>
</head>
<body>
	<h3>댓글</h3>

	<div id="replyList">
		<table>
			<thead>
				<tr>
					<th>작성자</th>
					<th>댓글 내용</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${prlist}" var="reply">
					<tr id="reply${reply.prid}">
						<input type="hidden" id="prid" value="${reply.prid}" />
						<td>${reply.prwriter}</td>
						<td><input type="text" id="content${reply.prid}" value="${reply.prcontent}" disabled /></td>
						<td><button class="modifyBtn" data-prid="${reply.prid}">수정</button></td>
						<td><button class="deleteBtn" data-prid="${reply.prid}">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
