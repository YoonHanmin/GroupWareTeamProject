<!-- picture_list.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid #dee2e6;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #f8f9fa;
        }

        a {
            text-decoration: none;
        }

        .write-link {
            display: block;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            text-align: center;
            width: 100%;
            text-decoration: none;
        }

        .write-link:hover {
            background-color: #0056b3;
        }
        
        #tr-color td {
            background-color: #87CEEB; /* 하늘색 배경 */
        }

		.pagination {
        justify-content: center;
        margin-top: 20px;
    }

    .pagination li {
        display: inline;
        margin-right: 5px;
    }


    .pagination a:hover {
        background-color: #007bff;
        color: #fff;
    }
    
     .pagination .active a {
        background-color: #dc3545; /* 현재 페이지 색상: 빨간색 */
        color: #fff;
    }

    .search-form select, .search-form input, .search-form button {
        margin-top: 5px;
    }

    .search-form button {
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 8px 12px;
        border-radius: 4px;
        cursor: pointer;
    }

    .search-form button:hover {
        background-color: #0056b3;
    }
    </style>
</head>
<body>

<table width="500" border="1">
<h1 align="center">글 목록 보기</h1>
		<tr id="tr-color">
			<td width="80">글번호</td>
			<td width="100">작성자</td>
			<td width="400px">제목</td>
			<td width="200px">날짜</td>
			<td width="100">조회수</td>
		</tr>
		<c:forEach items="${picture_list}" var="picturedto">
			<tr>
				<td>${picturedto.pid}</td>
				<td>${picturedto.pname}</td>
				<td>
					<a class="move_link" href="picture_content_view?pid=${picturedto.pid}">${picturedto.ptitle}</a>
				</td>
				<td>${picturedto.pdate}</td>
				<td>${picturedto.phit}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5">
				<a href="picture_write_view">글작성</a>
			</td>
		</tr>
	</table>
	
<%-- <h3>${pageMaker}</h3> --%>
	<div class="pagination">
		<ul>
			<c:if test="${pageMaker.prev}">
				<li class="paginate_button">
					<a href="${pageMaker.startpage - 1}">[이전]</a>
				</li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startpage}" end="${pageMaker.endpage}">
				<li class="paginate_button" ${pageMaker.pcri.ppageNum}>
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li class="paginate_button">
					<a href="${pageMaker.endpage + 1}">[다음]</a>
				</li>
			</c:if>
		</ul>
	</div>
	<form id="actionForm" method="get" action="picture_list">
		<input type="hidden" name="ppageNum" value="${pageMaker.pcri.ppageNum}">
		<input type="hidden" name="pamount" value="${pageMaker.pcri.pamount}">
	</form>
	
		<form method="get" id="searchForm">
		<select name="ptype">
			<option value="" <c:out value="${pageMaker.pcri.type == null ? 'selected':''}"/>>검색 옵션</option>
			<option value="T" <c:out value="${pageMaker.pcri.type eq 'T' ? 'selected':''}"/>>제목</option>
			<option value="C" <c:out value="${pageMaker.pcri.type eq 'C' ? 'selected':''}"/>>내용</option>
			<option value="W" <c:out value="${pageMaker.pcri.type eq 'W' ? 'selected':''}"/>>작성자</option>
			<option value="TC" <c:out value="${pageMaker.pcri.type eq 'TC' ? 'selected':''}"/>>제목 or 내용</option>
			<option value="TW" <c:out value="${pageMaker.pcri.type eq 'TW' ? 'selected':''}"/>>제목 or 작성자</option>
			<option value="TCW" <c:out value="${pageMaker.pcri.type eq 'TCW' ? 'selected':''}"/>>제목 or 내용 or 작성자</option>
		</select>
		<input type="text" name="pkeyword" value="${pageMaker.pcri.pkeyword}">
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
		
		var pno = actionForm.find("input[name='pid']").val();
			if (pno != ' ') {
				actionForm.find("input[name='pid']").remove();
			}
		
		actionForm.find("input[name='ppageNum']").val($(this).attr("href"));
		actionForm.attr("action","picture_list").submit();
	});
	
	$(".move_link").on("click", function(e) {
		e.preventDefault();
		
		console.log("@# move_link click");
		console.log("@# href===>"+$(this).attr("href"));
		var targetPno = $(this).attr("href");
		
		var pno = actionForm.find("input[name='pid']").val();
			if (pno != ' ') {
				actionForm.find("input[name='pid']").remove();
			}
		
		actionForm.append("<input type='hidden' name='pid' value='"+targetPno+ "'> ");
		actionForm.attr("action","picture_content_view").submit();
	});
	
	var searchForm = $("#searchForm");
	$("#searchForm button").on("click", function() {
		if (!searchForm.find("option:selected").val()) {
			alert("검색 종류를 선택하세요");
			return false;
		}
		if (!searchForm.find("input[name='pkeyword']").val()) {
			alert("키워드를 입력하세요");
			return false;
		}
		
		searchForm.attr("action", "picture_list").submit();
	});
</script>

<!-- 부트스트랩 JS 및 Popper.js CDN 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.8/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

