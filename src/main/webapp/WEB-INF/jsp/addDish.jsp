<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/head.jsp"%>
<html>
<head>
    <title>添加菜单</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://how2j.cn/study/jquery.min.js"></script>


    <script type="text/javascript">

        function isN() {
            if($("#unitPrice").val() == ""|| isNaN($("#unitPrice").val())){
                $("#unitPriceInfo").css("color","red");
                $("#unitPriceInfo").html("请输入数字");
                $("#unitPriceInfo").val("请输入数字");
            }else{
                $("#unitPriceInfo").html("");
                $("#unitPriceInfo").val("");
            }
        };

        function a(){
            $.ajax({
                url: '${pageContext.request.contextPath}/validationDishesName',
                data: {"Name":$("#Name").val()},
                success: function (data){
                    $("#nameInfo").css("color","red");
                    $("#nameInfo").html(data);
                    $("#nameInfo").val(data);

                    if($("#unitPriceInfo").val() === "" && $("#nameInfo").val() === "" )
                        $("#btn").attr("disabled",false);
                    else
                        $("#btn").attr("disabled",true);
                }

            })
        }
    </script>

</head>
<body>
<div class="container">
    <div class="row clear-fix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>添加菜单</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="col-xs-8 col-md-4 column">
        <form action="${pageContext.request.contextPath}/addDish" method="post">
            <div class="form-group">
                <label>菜名</label>
                <input type="text" class="form-control" name="dishesName" placeholder="DishName" id="Name" onkeyup="a()" required>
                <span id="nameInfo"></span>
            </div>

            <div class="form-group">
                <label>单价</label>
                <input type="text" class="form-control" name="unitPrice" id="unitPrice" onkeyup="isN()" placeholder="unitPrice" required>
                <span id="unitPriceInfo"></span>
            </div>

            <div class="form-group">
                <label>类别</label>
                <input type="text" class="form-control" name="category" placeholder="category" required>
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