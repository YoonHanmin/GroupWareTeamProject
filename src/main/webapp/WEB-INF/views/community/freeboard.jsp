<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--      hiredate 날짜 포맷 형식 변경 -->
      <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <script src="resources/js/jquery.js"></script>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript"></script>

<title>Insert title here</title>
</head>
<style>
.header{
height : 130px;
border-bottom: 1px solid #eee;
display : flex;
}

.info{
height : 100px;
border-bottom: 1px solid #eee;
}


.item a {
font-weight : bold;
font-size : 20px;
margin-top : 30px;
}
.item ul {
margin-top : 10px;
}
.content{
width : 100%;

}

.myinfo{
background-color : ;
height : 200px;
margin-top : 30px;
display : flex;

}
#profile-image img{
width : 150px; 
height : 150px;
border-radius: 10px;
margin-left: 50px;
margin-right : 50px;
}

#profile-name{
font-size : 24px;
font-weight : bold;
margin-bottom : 30px;
display : inline-block;

} 
.profile-id span{
font-weight : bold;

}

.description {
margin-top : 30px;
border-top : 1px soild #eee;
height : 800px;
}
.profile-info{
border-bottom : 1px soild #eee;

}
#profile-table{
/* margin-top : 50px; */
margin-left : 30px;
padding : 20px;
}
#profile-table th,td{
width : 100px;
height : 40px;
}
#profile-table td{
padding : 10px;
margin-right : 20px;
}
</style>
 <style>
      

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
    
/*      .search-form { */
/*         flex-direction: column; */
/*         align-items: right; */
/*         width: 100%; */
/*         margin-top: 20px; */
/*     } */

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
 <script>
 $(document).ready(function () {
		var profile = "${dto.getProfileimage()}";
		console.log("프로필사진명은 ==>"+profile);
		$("#profile-image").html("<img src='./display?fileName="+profile+"'>");

 });
 
 
 </script>
<body>
 <jsp:include page="../nav2.jsp"/>
 
 <main>
 	<div class="header">
      	<ul class="nav nav-underline">
  <li class="item">
    <a class="people" aria-current="page" href="#" style="color:black;"><i class="bi bi-people-fill" style="color:black;"></i>내 사원정보</a>
  </li>
  <li class="item">
    <a class="company" href="#" style="color:black;"><i class="bi bi-list-ul" style="color:black;"></i>비밀번호 변경</a>
  </li>
</ul>      	
      </div>
      
      
      <div class="info">
      
      </div>
      
        <div class="content">
        <table width="500" border="1">
		<h1 align="center">글 목록 보기</h1>
		<tr id="tr-color">
			<td width="80">글번호</td>
			<td width="100">작성자</td>
			<td width="400px">제목</td>
			<td width="200px">날짜</td>
			<td width="100">조회수</td>
		</tr>
		<c:forEach items="${free_board_list}" var="boarddto">
			<tr>
				<td>${boarddto.bid}</td>
				<td>${boarddto.bname}</td>
				<td>
<%-- 					<a href="content_view?bid=${dto.bid}">${dto.btitle}</a> --%>
					<a class="move_link" href="${boarddto.bid}">${boarddto.btitle}</a>
				</td>
				<td>${boarddto.bdate}</td>
				<td>${boarddto.bhit}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5">
				<a href="write_view">글작성</a>
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
<%-- 				<li class="paginate_button" ${pageMaker.cri.pageNum == num ? "style='background-color:black' " : " " }> --%>
				<li class="paginate_button" ${pageMaker.cri.pageNum}>
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
	<form id="actionForm" method="get" action="free_board_list">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	</form>
	
		<form method="get" class="search-form" id="searchForm">
		<select name="type">
			<option value="" <c:out value="${pageMaker.cri.type == null ? 'selected':''}"/>>검색 옵션</option>
			<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected':''}"/>>제목</option>
			<option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected':''}"/>>내용</option>
			<option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected':''}"/>>작성자</option>
			<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected':''}"/>>제목 or 내용</option>
			<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected':''}"/>>제목 or 작성자</option>
			<option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW' ? 'selected':''}"/>>제목 or 내용 or 작성자</option>
		</select>
<!-- Criteria를 이용해서 키워드 값을 넘김 -->
		<input type="text" name="keyword" value="${pageMaker.cri.keyword}">
		<button>검색</button>
	</form>

        	
        	</div> <!--  end of content --> 
        
      
 </main>
</body>
<script>
	var actionForm = $("#actionForm");
	
//	페이지번호 처리
	$(".paginate_button a").on("click", function(e) {
// 		기본 동작 막음: 페이지 링크를 통해서 이동
		e.preventDefault();
// 		console.log("click~!!!");
		console.log("@# href===>"+$(this).attr("href"));
		
// 	게시글 클릭 후 뒤로가기 누르면 &bid= 번호 계속 누적되는 버그 방지
		var bno = actionForm.find("input[name='bid']").val();
//	 	낫 널이면 제거를 하겠다
			if (bno != ' ') {
				actionForm.find("input[name='bid']").remove();
			}
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
// 	actionForm.submit();
		actionForm.attr("action","free_board_list").submit();
	});
// 게시글 처리
	$(".move_link").on("click", function(e) {
		e.preventDefault();
		
		console.log("@# move_link click");
		console.log("@# href===>"+$(this).attr("href"));
		var targetBno = $(this).attr("href");
		
//	 	게시글 클릭 후 뒤로가기 누르면 &bid= 번호 계속 누적되는 버그 방지
		var bno = actionForm.find("input[name='bid']").val();
//	 	낫 널이면 제거를 하겠다
			if (bno != ' ') {
				actionForm.find("input[name='bid']").remove();
			}
		
		actionForm.append("<input type='hidden' name='bid' value='"+targetBno+ "'> ");
// 	컨트롤러에 content_view로 찾아감
		actionForm.attr("action","content_view").submit();
	});
	
	var searchForm = $("#searchForm");
// search 버튼 클릭 시
	$("#searchForm button").on("click", function() {
// 	validation check
		if (!searchForm.find("option:selected").val()) {
			alert("검색 종류를 선택하세요");
			return false;
		}
		if (!searchForm.find("input[name='keyword']").val()) {
			alert("키워드를 입력하세요");
			return false;
		}
		
		searchForm.attr("action", "free_board_list").submit();
	});
</script>
</html>
<!-- 부트스트랩 JS 및 Popper.js CDN 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
