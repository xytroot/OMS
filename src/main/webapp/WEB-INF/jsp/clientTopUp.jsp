<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="common/head.jsp"%>
<html>
<head>
    <title>充值</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://how2j.cn/study/jquery.min.js"></script>

    <script>
        function isN() {
            if($("#credit").val() == ""|| isNaN($("#credit").val())){
                $("#creditInfo").css("color","red");
                $("#creditInfo").html("请输入数字");
                $("#btn").attr("disabled",true)
            }else{
                $("#creditInfo").html("");
                $("#btn").attr("disabled",false)
            }
        };
    </script>
</head>

<body>

<div class="container-fluid">
    <div class="row clear-fix">

        <div class="col-md-2 column">
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation"><a href="${pageContext.request.contextPath}/clientOrder">菜单</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/clientCart">购物车</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/clientCheckOrder">待上菜</a></li>
                <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/goclientTopUp">充值</a></li>
                <li role="presentation"><a href="${pageContext.request.contextPath}/goclientChangePwd">修改密码</a></li>
            </ul>
        </div>

        <div class="col-md-4 column">
            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-body">

                    <div class="row clear-fix">
                        <form class="form-inline" action="${pageContext.request.contextPath}/clientTopUp" method="post">
                            &nbsp;
                            &nbsp;
                            <div class="form-group">
                                <label>￥: </label>
                                <input type="text" class="form-control" name="credits" id="credit" onkeyup="isN()" placeholder=请输入充值金额 required>
                            </div>
                            &nbsp;
                            &nbsp;
                            <button type="submit" class="btn btn-success" id="btn" disabled>充值</button>
                            <span id="creditInfo"></span>
                        </form>
                    </div>
                </div>
            </div>
        </div>


    </div>
</div>

</body>
</html>
<%@ include file="common/foot.jsp"%>