<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>물품 목록</title>
</head>
<body>

<div>
    <h2>물품 목록</h2>
    <table border="1">
        <thead>
            <tr>
                <th>물품 ID</th>
                <th>물품명</th>
                <th>설명</th>
                <th>수량</th>
                <th>날짜</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${supplyList}" var="dto">
            <c:set var="supplyDto" value="${dto}" />
                <tr>
                    <td>${dto.supply_id}</td>
                    <td>${dto.item}</td>
                    <td>${dto.sdescription}</td>
                    <td>${dto.quantity}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
