<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-default navbar-static-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-cutlery" aria-hidden="true"></span> &nbsp;OMS</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-center">
                <li><a href="#"><b>&nbsp;&nbsp;&nbsp;&nbsp;你好，欢迎使用OMS点餐管理系统！</b></a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a></li>
                <li><a href="#"><b>${auth}${userLoginInfo.getUserName()}</b></a></li>
                <li><a href="#"><b>账户余额: ${userLoginInfo.getBalance()}</b></a></li>
                <li>
                    <a href="${pageContext.request.contextPath}/logout"><span class="glyphicon glyphicon-off" aria-hidden="true"></span></a>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

</body>
</html>
