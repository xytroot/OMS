<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="common/head.jsp"%>
<html>
<head>
    <title>所有菜单</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

<div class="container-fluid">

    <div class="row clear-fix">
        <div class="col-md-2 column">
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/clientOrder">菜单</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/clientCart">购物车</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/clientCheckOrder">待上菜</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/goclientTopUp">充值</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/goclientChangePwd">修改密码</a></li>
            </ul>
        </div>
        <div class="col-md-10 column">
            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-body">
                    <div class="row clear-fix">

                        <div class="col-xs-2 col-md-2column">
                            <a href="${pageContext.request.contextPath}/clientOrder">
                                <button type="button" class="btn btn-info">
                                    <span class="glyphicon glyphicon-list" aria-hidden="true"></span>
                                    &nbsp; &nbsp;
                                    显示完整菜单
                                </button>
                            </a>
                        </div>

                        <div class="col-xs-1 col-md-1 column">
                            &nbsp;
                        </div>

                        <div class="col-xs-5 col-md-5 column">
                            <form class="form-inline" action="${pageContext.request.contextPath}/clientGetDishBySuffixName" method="post">
                                <div class="form-group">
                                    <label>菜名：</label>
                                    <input type="text" class="form-control" name="dishesName" placeholder="Search for..." required>
                                </div>
                                <button type="submit" class="btn btn-default">查询</button>
                            </form>
                        </div>

                    </div>


                </div>

                <!-- Table -->
                <table class="table">
                    <div class="row clearfix">
                        <div class="col-md-2 column">
                        </div>
                        <div class="col-xs-12 col-md-8 column">
                            <table class="table table-hover table-striped text-center">

                                <thead>
                                <tr>
                                    <th class="text-center">#</th>
                                    <th class="text-center">菜名</th>
                                    <th class="text-center">单价</th>
                                    <th class="text-center">类别</th>
                                    <th class="text-center"><span class="glyphicon glyphicon-align-center" aria-hidden="true"></span></th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach var="dish" items="${list}">
                                    <tr>
                                        <td>${dish.dishesId}</td>
                                        <td>${dish.dishesName}</td>
                                        <td>${dish.unitPrice}</td>
                                        <td>${dish.category}</td>
                                        <td>
                                            <a class="btn btn-success" href="${pageContext.request.contextPath}/clientAddDish?dishesId=${dish.dishesId}" role="button"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></a>
                                        </td>
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