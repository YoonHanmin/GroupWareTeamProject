<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>숙박 신청 목록</title>
</head>
<body>

<div id="modalSupplyList">
    <h2>신청 목록</h2>
    <table border="1">
        <thead>
            <tr>
                <th>신청 번호</th>
                <th>신청 인원</th>
                <th>체크인</th>
                <th>체크아웃</th>
                <th>상세</th>
                <th>신청일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${reservationList}" var="dto">
<!--    empDto랑 계속 맞물리는 문제가 있어 set으로 고정시키고 출력함 -->
            <c:set var="reservationDto" value="${dto}" />
                <tr>
                    <td>${dto.reservation_id}</td>
                    <td>${dto.numOfPeople}</td>
                    <td>${dto.checkInDate}</td>
                    <td>${dto.checkOutDate}</td>
                    <td>${dto.details}</td>
                    <td>${dto.rdate}</td>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
