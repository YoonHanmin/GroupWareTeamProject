<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
</head>
<body>

<table width="500" border="1">
<h1 align="center">공지 목록</h1>
		<tr>
			<td width="80">공지번호</td>
			<td width="100">작성자</td>
			<td width="400px">제목</td>
			<td width="200px">날짜</td>
			<td width="100">조회수</td>
		</tr>
		<c:forEach items="${notice_list}" var="dto">
			<tr>
				<td>${dto.nid}</td>
				<td>${dto.nname}</td>
				<td>
					<a class="move_link" href="${dto.nid}">${dto.ntitle}</a>
				</td>
				<td>${dto.ndate}</td>
				<td>${dto.nhit}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5">
				<a href="notice_write_view">공지 작성</a>
			</td>
		</tr>
	</table>
	
<h3>${pageMaker}</h3>
	<div>
		<ul>
			<c:if test="${pageMaker.prev}">
				<l>
					<a href="${pageMaker.startpage - 1}">[이전]</a>
				</li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startpage}" end="${pageMaker.endpage}">
				<li  ${pageMaker.ncri.npageNum}>
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li>
					<a href="${pageMaker.endpage + 1}">[다음]</a>
				</li>
			</c:if>
		</ul>
	</div>
	<form id="actionForm" method="get" action="notice_list">
		<input type="hidden" name="npageNum" value="${pageMaker.ncri.npageNum}">
		<input type="hidden" name="namount" value="${pageMaker.ncri.namount}">
	</form>
	
		<form method="get"  id="searchForm">
		<select name="ntype">
			<option value="" <c:out value="${pageMaker.ncri.ntype == null ? 'selected':''}"/>>검색 옵션</option>
			<option value="T" <c:out value="${pageMaker.ncri.ntype eq 'T' ? 'selected':''}"/>>제목</option>
			<option value="C" <c:out value="${pageMaker.ncri.ntype eq 'C' ? 'selected':''}"/>>내용</option>
			<option value="W" <c:out value="${pageMaker.ncri.ntype eq 'W' ? 'selected':''}"/>>작성자</option>
			<option value="TC" <c:out value="${pageMaker.ncri.ntype eq 'TC' ? 'selected':''}"/>>제목 or 내용</option>
			<option value="TW" <c:out value="${pageMaker.ncri.ntype eq 'TW' ? 'selected':''}"/>>제목 or 작성자</option>
			<option value="TCW" <c:out value="${pageMaker.ncri.ntype eq 'TCW' ? 'selected':''}"/>>제목 or 내용 or 작성자</option>
		</select>
		<input type="text" name="nkeyword" value="${pageMaker.ncri.nkeyword}">
		<button>검색</button>
	</form>
</body>
</html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		console.log("@# href===>"+$(this).attr("href"));
		
		var bno = actionForm.find("input[name='nid']").val();
			if (bno != ' ') {
				actionForm.find("input[name='nid']").remove();
			}
		
		actionForm.find("input[name='npageNum']").val($(this).attr("href"));
		actionForm.attr("action","notice_list").submit();
	});
	$(".move_link").on("click", function(e) {
		e.preventDefault();
		
		console.log("@# move_link click");
		console.log("@# href===>"+$(this).attr("href"));
		var targetBno = $(this).attr("href");
		
		var bno = actionForm.find("input[name='nid']").val();
			if (bno != ' ') {
				actionForm.find("input[name='nid']").remove();
			}
		
		actionForm.append("<input type='hidden' name='nid' value='"+targetBno+ "'> ");
// 	컨트롤러에 content_view로 찾아감
		actionForm.attr("action","notice_content_view").submit();
	});
	
	var searchForm = $("#searchForm");
// search 버튼 클릭 시
	$("#searchForm button").on("click", function() {
// 	validation check
		if (!searchForm.find("option:selected").val()) {
			alert("검색 종류를 선택하세요");
			return false;
		}
		if (!searchForm.find("input[name='nkeyword']").val()) {
			alert("키워드를 입력하세요");
			return false;
		}
		
		searchForm.attr("action", "notice_list").submit();
	});
</script>

