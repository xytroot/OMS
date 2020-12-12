<%@ page import="com.xu.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="common/head.jsp"%>
<html>
<head>
    <title>购物车</title>
    <script src="https://how2j.cn/study/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <script>
        function a(obj){
            var judge = ${totalPrice} > ${userLoginInfo.getBalance()};
            obj2 = document.getElementById("useWeixin");
            if(judge)
            {
                obj.checked=false;
                obj2.checked=true;
                $("#info").css("color", "red");
                $("#info").html("账户余额不足");
            }
        }

        function isN() {
            if($("#tableId").val() == ""|| isNaN($("#tableId").val())){
                $("#info").css("color","red");
                $("#info").html("请输入数字");
                $("#btn").attr("disabled",true);
            }else{
                $("#info").html("");
                $("#btn").attr("disabled",false);
            }
        }
    </script>
</head>

<body>

<div class="container-fluid">

    <div class="row clear-fix">
        <div class="col-md-2 column">
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation"><a href="${pageContext.request.contextPath}/clientOrder">菜单</a></li>
                <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/clientCart">购物车</a></li>
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

                        <div class="col-xs-8 col-md-8 column">
                            <form class="form-inline" action="${pageContext.request.contextPath}/clientSubmit" method="post">
                                <div class="form-group">
                                    <label>桌号：</label>
                                    <input type="text" class="form-control" name="tableId" id="tableId" onkeyup="isN()" placeholder="请填写" required>
                                </div>
                                &nbsp;
                                &nbsp;
                                <input type="radio" name="pay" id="useWeixin" value="1" checked> 微信支付
                                <input type="radio" name="pay" id="useBalance" value="0" onclick="a(this)"> 余额支付
                                &nbsp;
                                &nbsp;
                                <button type="submit" id="btn" class="btn btn-success" disabled>
                                    <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
                                    &nbsp;
                                    &nbsp;
                                    提交订单并支付
                                </button>
                                <span id="info"></span>
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
                                    <th class="text-center">菜名</th>
                                    <th class="text-center">单价</th>
                                    <th class="text-center">类别</th>
                                    <th class="text-center">数量</th>
                                    <th class="text-center"><span class="glyphicon glyphicon-align-center" aria-hidden="true"></span></th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach var="dish" items="${cartList}">
                                    <tr>
                                        <td>${dish.menu.dishesName}</td>
                                        <td>${dish.menu.unitPrice}</td>
                                        <td>${dish.menu.category}</td>
                                        <td>${dish.dishesNum}</td>
                                        <td>
                                            <button class="btn btn-danger" data-toggle="modal" data-target="#${dish.menu.dishesId}">
                                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                            </button>

                                            <div class="modal fade" id="${dish.menu.dishesId}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                            <h4 class="modal-title" id="myModalLabel">警告</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            确认将此菜品数量减一？
                                                        </div>
                                                        <div class="modal-footer">
                                                            <a href="${pageContext.request.contextPath}/clientCartDelete?dishesId=${dish.menu.dishesId}" style='text-decoration:none;'>
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

                                <tr>
                                    <td>合计: </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        ${totalPrice}
                                    </td>
                                </tr>
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