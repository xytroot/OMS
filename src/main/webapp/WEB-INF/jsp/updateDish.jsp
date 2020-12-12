<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/head.jsp"%>
<html>
<head>
    <title>更改菜单</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://how2j.cn/study/jquery.min.js"></script>

    <script>
        function isN() {
            if($("#unitPrice").val() == ""|| isNaN($("#unitPrice").val())){
                $("#unitPriceInfo").css("color","red");
                $("#unitPriceInfo").html("请输入数字");
                $("#btn").attr("disabled",true);
            }else{
                $("#unitPriceInfo").html("");
                $("#btn").attr("disabled",false);
            }
        };
    </script>

</head>
<body>
<div class="container">
    <div class="row clear-fix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>更改菜单</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="col-xs-8 col-md-4 column">
        <form action="${pageContext.request.contextPath}/updateDish?dishesId=${DISH.dishesId}" method="post">
            <div class="form-group">
                <label>菜品ID</label>
                <input type="text" class="form-control" name="dishesId" value="${DISH.dishesId}" disabled>
            </div>
            <div class="form-group">
                <label>菜名</label>
                <input type="text" class="form-control" name="dishesName" placeholder="Phone Number/Email/MenuName" value="${DISH.dishesName}" required>
                <span id="nameInfo"></span>
            </div>

            <div class="form-group">
                <label>单价</label>
                <input type="text" class="form-control" name="unitPrice" id="unitPrice" onkeyup="isN()" placeholder="unitPrice" value="${DISH.unitPrice}" required>
                <span id="unitPriceInfo"></span>
            </div>

            <div class="form-group">
                <label>类别</label>
                <input type="text" class="form-control" name="category" value="${DISH.category}" required>
            </div>

            <div>
                <button type="submit" id="btn" class="btn btn-success btn-block">保存</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
<%@ include file="common/foot.jsp"%>
