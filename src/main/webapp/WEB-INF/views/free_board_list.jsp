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
    </style>
</head>
<body>

<table width="500" border="1">
<h1 align="center">글 목록 보기</h1>
		<tr id="tr-color">
			<td>번호</td>
			<td>이름</td>
			<td width="400px">제목</td>
			<td width="200px">날짜</td>
			<td>조회수</td>
		</tr>
		<c:forEach items="${free_board_list}" var="dto">
			<tr>
				<td>${dto.bid}</td>
				<td>${dto.bname}</td>
				<td>
					<a href="content_view?bid=${dto.bid}">${dto.btitle}</a>
				</td>
				<td>${dto.bdate}</td>
				<td>${dto.bhit}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5">
				<a href="write_view">글작성</a>
			</td>
		</tr>
	</table>

<!-- 부트스트랩 JS 및 Popper.js CDN 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.8/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
