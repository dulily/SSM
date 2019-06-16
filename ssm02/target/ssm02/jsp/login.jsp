<%--
  Created by IntelliJ IDEA.
  User: 17377
  Date: 2019/5/20
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .center{
            width: 500px;
            height: 400px;
            background-color:rgba(0,0,0,0.2);
            margin: 120px auto;
        }
        .sec{
            margin: 50px auto;
            padding: 40px;
        }
    </style>
</head>
<body style="background:url(${ctx}/static/images/back.jpg);">
<div class="center">
    <form action="${ctx}/user/login" method="post" class="form-horizontal sec" role="form">
        <div class="form-group">
            <label for="username" class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" name="username" id="username" placeholder="请输入用户名">
            </div>
        </div>
        <div class="form-group">
            <label for="password" class="col-sm-2 control-label">密码</label>
            <div class="col-sm-9">
                <input type="text" class="form-control" name="password" id="password" placeholder="请输入密码">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-9">
                <div class="checkbox">
                    <label>
                        <input type="checkbox">请记住我
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-5">
                <button type="submit" class="btn btn-default">登录</button>
            </div>
        </div>
        <div>
            <a href="">注册</a>
        </div>
    </form>
</div>

<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>

    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });


    //JavaScript代码区域
    layui.use(['element','jquery','layer'], function(){
        var element = layui.element;
        var jquery = layui.jquery;
        var layer = layui.layer;

        $(function () {
            $('input[name=name]').blur(function () {
                //获取名字
                var username=$('input[username=username]').val();
                var obj = {
                    'username':username
                };
                $.ajax({
                    url:'${ctx}/user/checkname',
                    type:'post',
                    data:JSON.stringify(obj),
                    contentType:'application/json',
                    success:function (data) {
                        if (data.code==2000){
                            //可用
                            // $('#msg').html("用户名可用");
                            layer.msg("用户名可用",{icon:6});
                        }else {
                            //不可用
                            // $('#msg').html("用户名已被注册");
                            layer.msg("用户名已被注册",{icon:6});
                        }
                    }
                })
            })
        })

    });



</script>

</body>
</html>
