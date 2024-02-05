<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


   <div>
        <h2>Search Result</h2>
        <c:forEach items="${searchResult}" var="emp">
            <!-- 검색 결과를 표시하는 부분 -->
            <p>${emp.name}, ${emp.position}</p>
        </c:forEach>
    </div>
    
    
</body>
</html>