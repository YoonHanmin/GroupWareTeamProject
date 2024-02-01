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

<div id="modalSupplyList">
    <h2>차량 신청 목록</h2>
    <table border="1">
        <thead>
            <tr>
                <th>신청 번호</th>
                <th>시작일</th>
                <th>종료일</th>
                <th>설명</th>
                <th>신청일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${vehicleList}" var="dto">
<!--    empDto랑 계속 맞물리는 문제가 있어 set으로 고정시키고 출력함 -->
            <c:set var="vehicleDto" value="${dto}" />
                <tr>
                    <td>${dto.vehicle_id}</td>
                    <td>${dto.vstartdate}</td>
                    <td>${dto.venddate}</td>
                    <td>${dto.vdescription}</td>
                    <td>${dto.vdate}</td>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
