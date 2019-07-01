<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>安全设置</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="${ctx}/static/css/categoryDetail.css">
    <link rel="stylesheet" href="${ctx}/static/css/rePassword.css">
    <link rel="stylesheet" href="${ctx}/static/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="${ctx}/static/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <%--头部--%>
    <jsp:include page="${ctx}/jsp/common/header2.jsp"></jsp:include>
</div>
<!-- 内容主体区域 -->
<div class="container">
    <!-- 安全设置区域 -->
    <h3>设置密码</h3>
    <!-- 表单内容 -->
    <div class="content-item">
        <div class="msgTip">${msg}</div>
        <form id="updatePwd" class="form-horizontal" role="form" action="${ctx}/user/updatePwd" method="post">
            <div class="form-group">
                <label for="password" class="col-sm-1 control-label">原密码</label>
                <div class="col-sm-6">
                    <input type="hidden" name="username" id="username" value="${userSession.username}">
                    <input type="password" class="form-control" id="password" name="password" placeholder="请输入初始密码">
                </div>
                <span style="color:#f44336;" id="pwdtip1"></span>
            </div>
            <div class="form-group">
                <label for="newPwd" class="col-sm-1 control-label">新密码</label>
                <div class="col-sm-6">
                    <input type="password" class="form-control" id="newPwd" name="newPwd" placeholder="请输入6-12位字符">
                </div>
                <span style="color:#f44336;" id="pwdtip2"></span>
            </div>
            <div class="form-group">
                <label for="confirmPwd" class="col-sm-1 control-label">确认密码</label>
                <div class="col-sm-6">
                    <input type="password" class="form-control" id="confirmPwd" name="confirmPwd" placeholder="请确认密码">
                </div>
                <span style="color:#f44336;" id="pwdtip3"></span>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-1 col-sm-6">
                    <button id="subme" class="layui-btn">提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    var info;
    $(function (){
        // 判断原密码是否正确
        $("#password").blur(function(){
            var username = $("#username").val();
            var password = $(this).val();
            $.ajax({
                url:'${ctx}/user/selectByPwd',
                type:'post',
                data:{username:username},
                success:function(data){
                    info=data;
                    if (data==password){
                        $("#pwdtip1").html("<span class='layui-icon layui-icon-ok-circle'></span>");
                    }else{
                        $("#pwdtip1").html("<span class='layui-icon layui-icon-close-fill'></span> 密码错误");
                    }

                }
            })
        })
        //判断新密码的字符长度
        $("#newPwd").blur(function(){
            var newPwd = $(this).val();
            if (newPwd.length<=5||newPwd.length>12){
                $("#pwdtip2").text("请输入6-12位字符");
            }else{
                $("#pwdtip2").html("<span class='layui-icon layui-icon-ok-circle'></span>");
            }
        })
        //判断新密码和确认密码是否一样
        $("#confirmPwd").blur(function(){
            var newPwd = $("#newPwd").val();
            var confirmPwd = $(this).val();
            if (newPwd != confirmPwd){
                $("#pwdtip3").html("<span class='layui-icon layui-icon-close-fill'></span>两次密码不一致");
            } else{
                $("#pwdtip3").html("<span class='layui-icon layui-icon-ok-circle'></span>");
            }
        })

        var submitBtn = document.getElementById("subme");
        // 阻止表单自动提交
        submitBtn.onclick = function (event) {
            var event = event || window.event;
            event.preventDefault(); // 兼容标准浏览器
            window.event.returnValue = false; // 兼容IE6~8
            if (info!=$("#password").val()){
                $("#password").focus();
                $("#pwdtip1").text("请重新输入原密码");
            }
            else if ($("#newPwd").val().length<=5||$("#newPwd").val().length>12){
                $("#newPwd").focus();
                $("#pwdtip2").text("请输入6-12位字符");
            } else if ($("#newPwd").val() != $("#confirmPwd").val()){
                $("#confirmPwd").focus();
                $("#pwdtip3").text("两次密码不一致");
            } else{
                // js提交
                $("#updatePwd").submit();
            }
        };

    })
</script>
<div class="content-foot">
    <span>&copy; 2019 duli.com - 信息科学与工程学院软件工程1班</span>
</div>

<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });

</script>
</body>
</html>
