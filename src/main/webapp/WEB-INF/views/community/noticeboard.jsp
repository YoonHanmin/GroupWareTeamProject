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
.write-button {
        float: right;
        margin-bottom: 10px;
    }

    .write-button a {
        background-color: #4CAF50;
        color: white;
        padding: 10px 15px;
        text-decoration: none;
        border-radius: 5px;
    }
body {
        font-family: 'Arial', sans-serif;
        background-color: #f5f5f5;
        color: #333;
    }

    .container {
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 5px;
    }

    h1 {
        color: #4CAF50;
        text-align: center;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    table, th, td {
        border: 1px solid #ddd;
    }

    th, td {
        padding: 12px;
        text-align: left;
    }

    th {
        background-color: #4CAF50;
        color: white;
    }

    a {
        color: #4CAF50;
        text-decoration: none;
        font-weight: bold;
    }
    .pagination {
        margin-top: 20px;
        text-align: center;
    }

    .pagination ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .pagination li {
        display: inline-block;
        margin-right: 5px;
        background-color: #4CAF50;
        padding: 8px 16px;
        color: white;
        border: 1px solid #ddd;
        cursor: pointer;
    }

    .pagination li a {
        text-decoration: none;
        color: white;
    }

    .pagination li.active {
        background-color: #45a049;
    }
     .pagination li {
        display: inline-block;
        margin-right: 5px;
        background-color: #4CAF50;
        padding: 8px 16px;
        color: white;
        border: 1px solid #ddd;
        cursor: pointer;
    }
    .search-form {
        margin-top: 20px;
        text-align: center;
    }

    .search-form select, .search-form input[type="text"], .search-form button {
        padding: 10px;
        margin: 5px;
        border: 1px solid #ddd;
        border-radius: 5px;
    }

    .search-form button {
        background-color: #4CAF50;
        color: white;
        cursor: pointer;
    }
</style>


 <script>
 $(document).ready(function () {
		var profile = "${dto.getProfileimage()}";
		console.log("프로필사진명은 ==>"+profile);
		$("#profile-image").html("<img src='./display?fileName="+encodeURI(profile)+"'>");

 });
 
 
 </script>
<body>
 <jsp:include page="../nav2.jsp"/>
 
 <main>
 	<div class="header">
      	<ul class="nav nav-underline">
  <li class="item">
    <a class="people" aria-current="page" href="#" style="color:#386FA4;"><i class="bi bi-people-fill" style="color:#386FA4;"></i>내 사원정보</a>
  </li>
  <li class="item">
    <a class="company" href="#" style="color:#386FA4;"><i class="bi bi-list-ul" style="color:#386FA4;"></i>비밀번호 변경</a>
  </li>
</ul>      	
      </div>
      
      
      <div class="info">
      
      </div>
      
        <div class="content">
        <table width="500" border="1">

<h1 align="center">공지 목록</h1>
<div class="write-button">
    <a href="notice_write_view">공지 작성</a>
</div>
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
            <li class="paginate_button ${num == pageMaker.ncri.npageNum ? 'active' : ''}">
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
<!-- 	<div class="pagination"> -->
<!-- 		<ul> -->
<%-- 			<c:if test="${pageMaker.prev}"> --%>
<!-- 				<li class="paginate_button"> -->
<%-- 					<a href="${pageMaker.startpage - 1}">[이전]</a> --%>
<!-- 				</li> -->
<%-- 			</c:if> --%>
<%-- 			<c:forEach var="num" begin="${pageMaker.startpage}" end="${pageMaker.endpage}"> --%>
<%-- 				<li class="paginate_button" ${pageMaker.ncri.npageNum}> --%>
<%-- 					<a href="${num}">${num}</a> --%>
<!-- 				</li> -->
<%-- 			</c:forEach> --%>
<%-- 			<c:if test="${pageMaker.next}"> --%>
<!-- 				<li class="paginate_button"> -->
<%-- 					<a href="${pageMaker.endpage + 1}">[다음]</a> --%>
<!-- 				</li> -->
<%-- 			</c:if> --%>
<!-- 		</ul> -->
<!-- 	</div> -->
	<form id="actionForm" method="get" action="free_board_list">
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
        
        	
        	
        	</div> <!--  end of content -->
        
      
 </main>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click", function(e) {
		
        e.preventDefault();
        var targetPageNum = $(this).attr("href");

        // 현재 페이지와 같은 페이지일 경우 무시
        if (targetPageNum == "${pageMaker.ncri.npageNum}") {
            return;
        }

        // 페이지 번호를 form 데이터에 추가
        actionForm.find("input[name='npageNum']").val(targetPageNum);

        // 검색어, 검색 조건 관련 데이터는 제거
        actionForm.find("input[name='nkeyword']").remove();
        actionForm.find("select[name='ntype']").remove();

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

</html>