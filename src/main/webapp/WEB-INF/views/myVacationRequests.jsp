<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>휴가 신청 내역</title>
    <link rel="stylesheet" href="resources/css/bootstrap.css">
    <style>
        /* 추가된 스타일 */
        .header {
            height: 130px;
            border-bottom: 1px solid #eee;
            display: flex;
        }

        .info {
            height: 100px;
            border-bottom: 1px solid #eee;
        }

        .content table td {
            border-bottom: 1px solid #eee;
            text-align: center;
            height: 40px;
            margin: 10px;
        }

        .content table tr,
        th {
            border-bottom: 2px solid #eee;
            text-align: center;
        }

        .content table {
            margin: 30px auto;
            width: 800px;
            border-collapse: collapse;
        }

        .item a {
            font-weight: bold;
            font-size: 20px;
            margin-top: 30px;
        }

        .item ul {
            margin-top: 10px;
        }

        .content {
            width: 100%;
        }

        /* :hover 상태일 때 ul 태그에 적용되는 스타일 */
        .nav.nav-underline:hover {
            background-color: white;
            color: #386FA4;
        }

        /* :hover 상태일 때 li 태그에 적용되는 스타일 */
        .nav.nav-underline li:hover {
            background-color: white;
            color: #386FA4;
        }
    </style>
</head>
<body>
    <jsp:include page="nav2.jsp" />

    <main>
            <div class="header">
            <ul class="nav nav-underline">
                <li class="item">
                    <a class="people" href="vacationRequest" aria-current="page" style="color:#386FA4;"><i
                            class="bi bi-people-fill" style="color:#386FA4;"></i> 휴가 신청</a>
                </li>
                <li class="item">
                    <a class="company"  style="color:#386FA4;"><i class="bi bi-list-ul"
                            style="color:#386FA4;"></i> 휴가 신청 내역</a>
                </li>
            </ul>
        </div>
    
        <div class="header">
            <h4>휴가 신청 내역</h4>
        </div>

        <div class="content">
            <table class="table">
                <thead>
                    <tr>
                        <th>신청일자</th>
                        <th>휴가 시작일</th>
                        <th>휴가 종료일</th>
                        <th>휴가 종류</th>
                        <th>휴가 일수</th>
                        <th>상태</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${vacationList}" var="vacation">
                        <tr>
                            <td><fmt:formatDate value="${vacation.requestDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            <td><fmt:formatDate value="${vacation.startDate}" pattern="yyyy-MM-dd" /></td>
                            <td><fmt:formatDate value="${vacation.endDate}" pattern="yyyy-MM-dd" /></td>
                            <td>${vacation.vacationType}</td>
                            <td>${vacation.vacationDays}</td>
                            <td>${vacation.status}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </main>
</body>
</html>
