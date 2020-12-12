<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clear-fix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>登录</small>
                    &nbsp;
                    <a href="${pageContext.request.contextPath}/goSignup">
                        <button type="button" class="btn btn-default">
                            注册
                        </button>
                    </a>
                </h1>
            </div>
        </div>
    </div>

    <div class="row clear-fix">
        <div class="col-md-12 column">
            <h1>&nbsp;</h1>
        </div>
    </div>

    <div class="col-xs-8 col-md-4 column">
        <form action="${pageContext.request.contextPath}/login" method="post">

            <div class="form-group">
                <label>用户名</label>
                <input type="text" class="form-control" name="name" placeholder="Phone Number/Email/UserName" required>
            </div>
            <div class="form-group">
                <label>密码</label>
                <input type="password" class="form-control" name="pwd" placeholder="Password" required>
                <span id="pwdInfo"><p style="color: red">${info}</p></span>
            </div>

            <div>
                <button type="submit" class="btn btn-success btn-block">登录</button>
            </div>

        </form>


    </div>
</div>

</body>
</html>
<%@ include file="common/foot.jsp"%>