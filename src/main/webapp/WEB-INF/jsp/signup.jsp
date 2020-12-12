<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://how2j.cn/study/jquery.min.js"></script>

    <script>
        function a(){
            $.ajax({
                url: '${pageContext.request.contextPath}/validationName',
                data: {"Name":$("#Name").val()},
                success: function (data){
                    $("#nameInfo").css("color","red");
                    $("#nameInfo").html(data);
                    $("#nameInfo").val(data);
                    if($("#nameInfo").val() === "" && $("#pwdInfo").val() === "")
                        $("#btn").attr("disabled",false);
                    else
                        $("#btn").attr("disabled",true);
                }

            })
        }

        function a2(){
            if($("#pwd1").val() != $("#pwd2").val())
            {
                $("#pwdInfo").css("color","red");
                $("#pwdInfo").html("两次输入的密码不一致");
                $("#pwdInfo").val("两次输入的密码不一致");
            }else {
                $("#pwdInfo").html("");
                $("#pwdInfo").val("");
            }
            if($("#nameInfo").val() === "" && $("#pwdInfo").val() === "")
                $("#btn").attr("disabled",false);
            else
                $("#btn").attr("disabled",true);
        }
    </script>
</head>
<body>
<div class="container">
    <div class="row clear-fix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>注册</small>
                    &nbsp;
                    <a href="${pageContext.request.contextPath}/goLogin">
                        <button type="button" class="btn btn-default">
                            登录
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
        <form action="${pageContext.request.contextPath}/signup" method="post">

            <div class="form-group">
                <label>用户名</label>
                <input type="text" class="form-control" name="name" id="Name" onkeyup="a()" placeholder="Phone Number/Email/UserName" required>
                <span id="nameInfo"></span>
            </div>
            <div class="form-group">
                <label>密码</label>
                <input type="password" class="form-control" name="pwd" id="pwd1" placeholder="Password" required>
            </div>

            <div class="form-group">
                <label>请再次输入密码</label>
                <input type="password" class="form-control" id="pwd2" onkeyup="a2()" placeholder="Password" required>
                <span id="pwdInfo"></span>
            </div>

            <div>
                <button type="submit" id="btn" class="btn btn-success btn-block" disabled>注册</button>
            </div>

        </form>


    </div>
</div>

</body>
</html>
<%@ include file="common/foot.jsp"%>