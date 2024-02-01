<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세보기</title>
    <script src="resources/js/jquery.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa; /* Bootstrap 기본 배경색 */
        }
        .container {
            background-color: #d4edda; /* 초록색 톤 */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        .container h2 {
            color: #155724; /* 어두운 초록색 톤 */
        }
        .table-bordered {
            border-color: #c3e6cb; /* 연한 초록색 톤 */
        }
        .btn-primary {
            background-color: #218838; /* 주황색 톤 */
            border-color: #1e7e34;
        }
        .btn-primary:hover {
            background-color: #1e7e34;
            border-color: #1c7430;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">비품신청 상세보기</h2>
        <form method="post" action="nmodify">
            <input type="hidden" name="supply_id" value="${contentView.supply_id}">
            <table class="table table-bordered" style="max-width: 500px;">
                <tr>
                    <th scope="row">번호</th>
                    <td>${contentView.supply_id}</td>
                </tr>
<!--                 <tr> -->
<!--                     <th scope="row">작성자</th> -->
<!--                     <td> -->
<%--                         <input type="text" class="form-control" name="nname" value="${contentView.nname}"> --%>
<!--                     </td> -->
<!--                 </tr> -->
                <tr>
                    <th scope="row">신청 물품</th>
                    <td>
                        <input type="text" class="form-control" name="item" value="${contentView.item}">
                    </td>
                </tr>
                <tr>
                    <th scope="row">설명</th>
                    <td>
                        <textarea class="form-control" name="sdescription">${contentView.sdescription}</textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" class="btn btn-primary" value="수정" onclick="return confirm('수정하시겠습니까?');">
                        &nbsp;&nbsp;<input type="submit" value="목록보기" formaction="supply_list">
                        &nbsp;&nbsp;<input type="submit" value="삭제" formaction="delete" onclick="return confirm('삭제하시겠습니까?');">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
