<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="common/head.jsp"%>
<html>
<head>
    <title>所有用户</title>
    <script src="https://how2j.cn/study/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>


<div class="container-fluid">
    <div class="row clear-fix">

        <div class="col-md-2 column">
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/allUser">用户管理</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/allDishes">菜单管理</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/allOrdering">订单管理</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/allBill">帐单管理</a></li>
            </ul>
        </div>

        <div class="col-md-10 column">
            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-body">
                    <div class="row clear-fix">

                        <div class="col-xs-2 col-md-2 column">
                            <a href="${pageContext.request.contextPath}/toAddUser">
                                <button type="button" class="btn btn-success">
                                    <span class="glyphicon glyphicon-tag" aria-hidden="true"></span>
                                    &nbsp; &nbsp;
                                    添加用户
                                </button>
                            </a>
                        </div>

                        <div class="col-xs-2 col-md-2 column">
                            &nbsp;
                        </div>

                        <div class="col-xs-2 col-md-2column">
                            <a href="${pageContext.request.contextPath}/allUser">
                                <button type="button" class="btn btn-info">
                                    <span class="glyphicon glyphicon-list" aria-hidden="true"></span>
                                    &nbsp; &nbsp;
                                    显示所有用户
                                </button>
                            </a>
                        </div>

                        <div class="col-xs-1 col-md-1 column">
                            &nbsp;
                        </div>

                        <div class="col-xs-5 col-md-5 column">
                            <form class="form-inline" action="${pageContext.request.contextPath}/getUser" method="post">
                                <div class="form-group">
                                    <label>用户名：</label>
                                    <input type="text" class="form-control" name="userName" placeholder="Search for..." required>
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
                                    <th class="text-center">用户名</th>
                                    <th class="text-center">密码</th>
                                    <th class="text-center">余额</th>
                                    <th class="text-center">权限</th>
                                    <th class="text-center"><span class="glyphicon glyphicon-align-center" aria-hidden="true"></span></th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach var="user" items="${list}">
                                    <tr>
                                        <td>${user.userId}</td>
                                        <td>${user.userName}</td>
                                        <td>${user.password}</td>
                                        <td>${user.balance}</td>
                                        <td>${user.authorization}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/toUpdateUser?id=${user.userId}" style='text-decoration:none;'>
                                                <button class="btn btn-info">
                                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                                </button>
                                            </a>

                                            <button class="btn btn-danger" data-toggle="modal" data-target="#${user.userId}">
                                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                            </button>

                                            <div class="modal fade" id="${user.userId}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                            <h4 class="modal-title" id="myModalLabel">警告</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            确认删除该用户？
                                                        </div>
                                                        <div class="modal-footer">
                                                            <a href="${pageContext.request.contextPath}/deleteUser?id=${user.userId}" style='text-decoration:none;'>
                                                                <button class="btn btn-danger">确认</button>
                                                            </a>
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

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