<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/head.jsp"%>
<html>
<head>
    <title>添加用户</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://how2j.cn/study/jquery.min.js"></script>


    <script type="text/javascript">
        function a1(){
            $.ajax({
                url: '${pageContext.request.contextPath}/validationId',
                data: {"Id": $("#Id").val()},
                success: function (data){
                        $("#idInfo").css("color","red");
                        $("#idInfo").html(data);
                        $("#idInfo").val(data);

                    if($("#idInfo").val() === "" && $("#nameInfo").val() === "" && $("#balanceInfo").val() === "")
                            $("#btn").attr("disabled",false);
                    else
                            $("#btn").attr("disabled",true);
                }
            })
        }

        function a2(){
            $.ajax({
                url: '${pageContext.request.contextPath}/validationName',
                data: {"Name":$("#Name").val()},
                success: function (data){
                    $("#nameInfo").css("color","red");
                    $("#nameInfo").html(data);
                    $("#nameInfo").val(data);

                    if($("#idInfo").val() === "" && $("#nameInfo").val() === "" && $("#balanceInfo").val() === "")
                        $("#btn").attr("disabled",false);
                    else
                        $("#btn").attr("disabled",true);
                }

            })
        }


        function isN() {
            if($("#Balance").val() == ""|| isNaN($("#Balance").val())){
                $("#balanceInfo").css("color","red");
                $("#balanceInfo").html("请输入数字");
                $("#balanceInfo").val("请输入数字");
            }else{
                $("#balanceInfo").html("");
                $("#balanceInfo").val("");
            }

            if($("#idInfo").val() === "" && $("#nameInfo").val() === "" && $("#balanceInfo").val() === "")
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
                    <small>添加用户</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="col-xs-8 col-md-4 column">
        <form action="${pageContext.request.contextPath}/addUser" method="post">
            <div class="form-group">
                <label>用户ID</label>
                <input type="text" class="form-control" name="userId" id="Id" onkeyup="a1()" oninput= "value=value.replace(/[^\d]/g,'')">
                <span id="idInfo"></span>
            </div>
            <div class="form-group">
                <label>用户名</label>
                <input type="text" class="form-control" name="userName" id="Name" onkeyup="a2()" placeholder="Phone Number/Email/UserName" required>
                <span id="nameInfo"></span>
            </div>
            <div class="form-group">
                <label>密码</label>
                <input type="text" class="form-control" name="password" id="pwd" placeholder="Password" required>
            </div>
            <div class="form-group">
                <label>余额</label>
                <input type="text" class="form-control" name="balance" id="Balance" onkeyup="isN()" placeholder="Balance" required>
                <span id="balanceInfo"></span>
            </div>
            <div class="checkbox" align="right">
                <label>
                    <input type="checkbox" name="auth"> 管理员
                </label>
            </div>
            <div>
                <button type="submit" id="btn" class="btn btn-success btn-block" disabled>添加</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
<%@ include file="common/foot.jsp"%>