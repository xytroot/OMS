<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="common/head.jsp"%>
<html>
<head>
    <title>已点</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<div class="container-fluid">

    <div class="row clear-fix">
        <div class="col-md-2 column">
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation"><a href="${pageContext.request.contextPath}/clientOrder">菜单</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/clientCart">购物车</a></li>
                <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/clientCheckOrder">待上菜</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/goclientTopUp">充值</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/goclientChangePwd">修改密码</a></li>
            </ul>
        </div>
        <div class="col-md-10 column">
            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-body">
                    <div class="row clear-fix">

                    </div>
                </div>

                <!-- Table -->
                <table class="table">
                    <div class="row clearfix">
                        <div class="col-md-2 column">
                        </div>
                        <div class="col-xs-6 col-md-4 column">
                            <table class="table table-hover table-striped text-center">

                                <thead>
                                <tr>
                                    <th class="text-center">#</th>
                                    <th class="text-center">菜名</th>
                                    <th class="text-center">桌号</th>
                                    <th class="text-center">数量</th>
                                    <th class="text-center">时间</th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach var="order" items="${list}">
                                    <tr>
                                        <td>${order.orderId}</td>
                                        <td>${order.menu.dishesName}</td>
                                        <td>${order.tableId}</td>
                                        <td>${order.dishesNum}</td>
                                        <td>${order.orderTime.toString()}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>

                            </table>
                        </div>
                    </div>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>
<%@ include file="common/foot.jsp"%>