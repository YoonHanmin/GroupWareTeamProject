<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>휴가 신청</title>
    <link rel="stylesheet" href="resources/css/bootstrap.css">
    <script src="resources/js/jquery.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

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
                    <a class="people" aria-current="page" style="color:#386FA4;"><i
                            class="bi bi-people-fill" style="color:#386FA4;"></i> 휴가 신청</a>
                </li>
                <li class="item">
                    <a class="company" href="myVacationRequests" style="color:#386FA4;"><i class="bi bi-list-ul"
                            style="color:#386FA4;"></i> 휴가 신청 내역</a>
                </li>
            </ul>
        </div>

        <div class="info">
            <h4>휴가 신청</h4>
        </div>

        <div class="content">
            <form action="submitVacation" method="post">
                <table width="800px">
                    <thead>
                        <tr style="width:60px; height:50px;">
                            <th>휴가 시작일</th>
                            <th>휴가 종료일</th>
                            <th>휴가 타입</th>
                            <th>휴가 사유</th>
                            <th>신청 버튼</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="date" name="startDate" required></td>
                            <td><input type="date" name="endDate" required></td>
                            <td>
                                <select name="vacationType" required>
                                    <option value="연차">연차</option>
                                    <option value="반차">반차</option>
                                    <option value="공가">공가</option>
                                    <option value="기타">기타</option>
                                </select>
                            </td>
                            <td><input type="text" name="reason" required></td>
                            <td><input type="submit" value="휴가 신청"></td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </main>

</body>

</html>
