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
		<c:forEach items="${picture_list}" var="picturedto">
			<tr>
				<td>${picturedto.pid}</td>
				<td>${picturedto.pname}</td>
				<td>
					<a class="move_link" href="${picturedto.pid}">${picturedto.ptitle}</a>
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
	
		<form method="get" class="search-form" id="searchForm">
		<select name="ptype">
			<option value="" <c:out value="${pageMaker.pcri.ptype == null ? 'selected':''}"/>>검색 옵션</option>
			<option value="T" <c:out value="${pageMaker.pcri.ptype eq 'T' ? 'selected':''}"/>>제목</option>
			<option value="C" <c:out value="${pageMaker.pcri.ptype eq 'C' ? 'selected':''}"/>>내용</option>
			<option value="W" <c:out value="${pageMaker.pcri.ptype eq 'W' ? 'selected':''}"/>>작성자</option>
			<option value="TC" <c:out value="${pageMaker.pcri.ptype eq 'TC' ? 'selected':''}"/>>제목 or 내용</option>
			<option value="TW" <c:out value="${pageMaker.pcri.ptype eq 'TW' ? 'selected':''}"/>>제목 or 작성자</option>
			<option value="TCW" <c:out value="${pageMaker.pcri.ptype eq 'TCW' ? 'selected':''}"/>>제목 or 내용 or 작성자</option>
		</select>
		<input type="text" name="pkeyword" value="${pageMaker.pcri.pkeyword}">
		<button>검색</button>
	</form>

        	
        	</div> <!--  end of content --> 
        
      
 </main>
</body>
<script>
	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		
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
</html>
<!-- 부트스트랩 JS 및 Popper.js CDN 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
