<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비용처리 신청 목록</title>
</head>
<body>

<div>
    <h2>신청 목록</h2>
    <table border="1">
        <thead>
            <tr>
                <th>처리 번호</th>
                <th>사용처</th>
                <th>신청일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${expenseList}" var="dto">
            <c:set var="expenseDto" value="${dto}" />
                <tr>
                    <td>${dto.expense_id}</td>
                    <td>${dto.usagePlace}</td>
                    <td>${dto.edate}</td>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
